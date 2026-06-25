clear all
macro drop _all

* Set your main directory once at the top
cd "C:\Users\25943553\OneDrive - MMU\03 DISSERTATION\STATA\DiD"

**#1 Processing Lockdown Data to be Comp. with Vaccine Data
** import ALL raw lockdown data from the public web repository
local repo "https://raw.githubusercontent.com/jubo-git/Project/main/data_raw"

copy "`repo'/Combining%20MMR%20and%20Lockdown%20Score.xlsx" "temp_main.xlsx", replace
import excel "temp_main.xlsx", sheet("Raw Lockdown Data") firstrow clear

** Tidying (generic and making variables more streamlined)
	* maintain english data only 
	drop Scotlandtier
	drop if Country !="England"

	rename *, lower
	rename englandtiera tiera
	rename englandtierb tierb
	rename noindoormixing noindoormix
	rename nooutdoormixing nooutmix

	* National and Regional Data: Not required as the detail is held at the county and local authority level 
	drop country region regioncode
	
	* create a date function (to allow for averages later)
	gen date = mdy(month,dayofmonth,2020)
	format date %td
	label variable date "Date of Restriction"
	drop month dayofmonth 
	
	* need to rename LOCKDOWN data E10000002 to E06000060 as code changed in 2021
	replace lacode = "E06000060" if lacode == "E10000002"
	replace lacode = "E06000065" if lacode == "E10000023"
	replace lacode = "E06000066" if lacode == "E10000027"
	
** COMBINING LOCAL AUTHORITY DATA
	replace lacode = "" if inlist(lacode, "E11000001", "E11000002", "E11000003")
	replace lacode = "" if inlist(lacode, "E11000005", "E11000006", "E11000007")
	replace lacode = "" if inlist(lacode, "E13000001", "E13000002")
	gen onscode = countycode if lacode == ""
	replace onscode = lacode if lacode != ""
	duplicates drop onscode date, force
	
	* Renaming onscode (after sense checked in excel)
	replace laname = "Buckinghamshire" if onscode == "E06000060"
	replace laname = "Cambridgeshire" if onscode == "E10000003"
	replace laname = "Cumbria" if onscode == "E10000006"
	replace laname = "Derbyshire" if onscode == "E10000007"
	replace laname = "Devon" if onscode == "E10000008"
	replace laname = "East Sussex" if onscode == "E10000011"
	replace laname = "Essex" if onscode == "E10000012"
	replace laname = "Gloucestershire" if onscode == "E10000013"
	replace laname = "Hampshire" if onscode == "E10000014"
	replace laname = "Hertfordshire" if onscode == "E10000015"
	replace laname = "Kent" if onscode == "E10000016"
	replace laname = "Lancashire" if onscode == "E10000017"
	replace laname = "Leicestershire" if onscode == "E10000018"
	replace laname = "Lincolnshire" if onscode == "E10000019"
	replace laname = "Norfolk" if onscode == "E10000020"
	replace laname = "North Yorkshire" if onscode == "E10000023"
	replace laname = "Northamptonshire" if onscode == "E10000021"
	replace laname = "Nottinghamshire" if onscode == "E10000024"
	replace laname = "Oxfordshire" if onscode == "E10000025"
	replace laname = "Somerset" if onscode == "E10000027"
	replace laname = "Staffordshire" if onscode == "E10000028"
	replace laname = "Suffolk" if onscode == "E10000029"
	replace laname = "Surrey" if onscode == "E10000030"
	replace laname = "Warwickshire" if onscode == "E10000031"
	replace laname = "West Sussex" if onscode == "E10000032"
	replace laname = "Worcestershire" if onscode == "E10000034"
		
	gen highest_tier = max(tiera, tierb)
	gen w_hospshut   = hospitalityshut * highest_tier
	gen w_retail      = retailshut      * highest_tier
	gen w_primary     = primaryclosed   * highest_tier
	gen w_secondary  = secondaryclosed * highest_tier
		
	collapse (sum) sumsociald = socialdistancing ///
		 (sum) weighted_hosp = w_hospshut  ///
		 (sum) weighted_retail = w_retail  ///
		 (sum) weighted_primary = w_primary ///
		 (sum) weighted_secondary = w_secondary ///
		 (max) maxtiera = tiera ///
		 (max) maxtierb = tierb, by(onscode laname)
		  
	gen weightedtotalscore = weighted_hosp + weighted_retail + weighted_primary + weighted_secondary
	xtile totalquintile = weightedtotalscore, nquantiles(5)
	xtile totalquartile = weightedtotalscore, nquantiles(4)

	* Drop specific areas not reflected in Vaccine Data 
	drop if inlist(onscode, "E06000017", "E06000053", "E09000001", "E07000188")
	sort laname

	save "data_clean/Lockdown Dataset COMP.dta", replace


**#2 - Vaccine Processing 
* Import from your locally  temp spreadsheet
import excel "temp_main.xlsx", sheet("Raw MMR Dataset") firstrow clear

* Tidying 
rename *, lower
label variable mmr2_5y "MMR2 % of Children at 5 years"
label variable mmr1_5y "MMR1 % of Children at 5 years"
label variable mmr1_24m "MMR1 % of Children at 2 years"

	* Backdating ONS codes for boundary changes consistency
	drop if inlist(onscode, "E06000029", "E06000061", "E06000062") 
	replace onscode = "E06000058" if onscode == "E06000028" 
	replace localauthority = "Bournemouth, Christchurch and Poole" if onscode == "E06000058"
	replace localauthority = "Westminster" if onscode == "E09000033" 
	replace localauthority = "Bristol" if onscode == "E06000023" 
	replace onscode = "E06000060" if onscode == "E10000002" 
	replace localauthority = "Herefordshire" if onscode == "E06000019" 
	replace onscode = "E06000059" if onscode == "E10000009" 
	replace localauthority = "Kingston upon Hull" if onscode == "E06000010" 	
	replace onscode = "E06000065" if onscode == "E10000023" 
	replace onscode = "E06000066" if onscode == "E10000027" 
	
save "data_clean/MMR Dataset COMP.dta", replace
capture erase "temp_main.xlsx"
   

**#3 NOMIS
local repo "https://raw.githubusercontent.com/jubo-git/Project/main/data_raw"
local datasets ethnic_group_2021 deprivation_2021 religion_2021

foreach group of local datasets {
    copy "`repo'/`group'.xlsx" "temp_`group'.xlsx", replace
    import excel "temp_`group'.xlsx", sheet("Data") cellrange(A8) firstrow clear
    
    rename *, lower
    keep if substr(area, 1, 4) == "lacu"
    rename b onscode
    drop if missing(onscode)
    
    tempfile t_`group'
    save "`t_`group''", replace    
    capture erase "temp_`group'.xlsx"
}


use "`t_ethnic_group_2021'", clear
merge 1:1 onscode using "`t_deprivation_2021'", nogenerate
merge 1:1 onscode using "`t_religion_2021'", nogenerate

* Clean up and calculate scores
drop if inlist(area, "lacu2023:Rutland", "lacu2023:Isles of Scilly", "lacu2023:Westmorland and Furness", "lacu2023:City of London" )
drop if substr(onscode, 1, 1) == "W"

gen deprivation_score = (1*householdisdeprivedinonedim) + (2*householdisdeprivedintwodim) + (3*householdisdeprivedinthreed) + (4*householdisdeprivedinfourdi)


save "data_clean/Nomis.dta", replace


**#4 Creating Usable Dataset 
clear
use "data_clean/MMR Dataset COMP.dta"
merge m:1 onscode using "data_clean/Lockdown Dataset COMP.dta", nogenerate
drop laname code sumsociald 

* Save intermediate file to clean data subfolder
save "data_clean/Lockdown_MMR_Data.dta", replace


**#5 Combining NOMIS, Lockdown and Vaccine
clear
use "data_clean/Lockdown_MMR_Data.dta"
merge m:1 onscode using "data_clean/Nomis.dta", nogenerate
drop area

* Save final integrated dataset into clean data subfolder
save "data_clean/Lockdown_MMR_NOMIS.dta", replace


** 3. Save and Push Everything to GitHub (Now safely at the bottom)
!git add .
!git commit -m "Update of cleaned data directories"
!git push -u origin main