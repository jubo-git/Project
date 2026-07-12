**#1 Processing Lockdown Data to be Comp. with Vaccine Data
** import ALL raw lockdown data from the public web repository
local repo "https://raw.githubusercontent.com/jubo-git/Project/main/0.%20data_raw_excel"
copy "`repo'/Lockdown%20Data/Covid-local-restrictions-dataset.xlsx" "temp_main.xlsx", replace
import excel "temp_main.xlsx", sheet("dataset") firstrow clear

** Tidying (generic and making variables more streamlined)

	* maintain english data only 
	drop Scotlandtier
	drop if Country !="England"

	rename *, lower
	rename englandtiera tiera
	rename englandtierb tierb
	rename noindoormixing noindoormix
	rename nooutdoormixing nooutmix

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
	
**# Diagnostic before defining variables 

	**Social Distancing 
		bysort date: egen sd_socialdistancing = sd(socialdistancing)
		tab sd_socialdistancing
		bysort onscode: egen total_days_sociald = total(socialdistancing)
		tab total_days_sociald

	**Primary 
		bysort onscode: egen total_days_closed = total(primaryclosed)
		tab total_days_closed
	
	**Secondary School Closures	
		bysort onscode: egen total_days_secondary = total(secondaryclosed)
		tab total_days_secondary

	**Hospitality Shutdown
		bysort onscode: egen total_days_hosp = total(hospitalityshut)
		tab total_days_hosp

	**Retail Shutdown
		bysort onscode: egen total_days_retail = total(retailshut)
		tab total_days_retail

	**Tier A 
		bysort date: egen sd_tiera = sd(tiera)
		tab sd_tiera
	
	**Tier B 
		bysort date: egen sd_tierb = sd(tierb)
		tab sd_tierb
	
//Reveals that social distancing, primary, secondary hospitality had very little national variation. Just retail shutdown, tier a and tier b. Not using tiers as a weighting factor as it disguses national trends. Not possible or neccessary to build a total score.

**# Creating Quintiles 

		//Hospitality dropped: diagnostic showed near-zero cross-LA variation
		//Retail retained as sole Complacency proxy - confirmed genuine local variation.
		//Note: Convenience (primary/secondary school closures) dropped entirely. Diagnostic showed 99.34% of LAs identical on both total_days_closed (72 days) and total_days_secondary (86 days) - closures were applied near-nationally
		
		**From lockdown dataset information Tier A and Tier B were a 		concurrent scheme. Verified below 
		gen daily_tier = 0
		replace daily_tier = tiera if !missing(tiera)
		replace daily_tier = tierb if !missing(tierb)

	** Collapse using to capture the total cumulative duration x 		severity
	collapse (sum) total_retail = retailshut ///
			 (sum) total_tier = daily_tier, by(onscode laname regioncode)		  

	xtile tier_quintile   = total_tier, nquantiles(5)
	xtile retail_quintile = total_retail, nquantiles(5)
		
		
	* Drop specific areas not reflected in Vaccine Data 
	drop if inlist(onscode, "E06000017", "E06000053", "E09000001", "E07000188")
	sort laname
	//cd "C:\Users\44799\OneDrive - MMU\03 DISSERTATION\GITHUB\"
	save "2. data_clean\lockdown_dataset.dta", replace

