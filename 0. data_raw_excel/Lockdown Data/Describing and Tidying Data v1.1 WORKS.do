**#1 Processing Lockdown Data to be Comp. with Vaccine Data

**import ALL raw lockdown data - importing full dataset and filtering in STATA to allow for reproducibility 

//At Home import 
import excel "C:\Users\44799\OneDrive - MMU\03 DISSERTATION\DATASETS\Combining MMR and Lockdown Score.xlsx", sheet("Raw Lockdown Data") firstrow

//In Uni import
//import excel "C:\Users\25943553\OneDrive - MMU\03 DISSERTATION\DATASETS\Combining MMR and Lockdown Score.xlsx", sheet("Raw Lockdown Data") firstrow


**Tidying (generic and making variables more streamlined)

	**mantain english data only 
	drop Scotlandtier
	drop if Country !="England"

	rename *, lower
	rename englandtiera tiera
	rename englandtierb tierb
	rename noindoormixing noindoormix
	rename nooutdoormixing nooutmix

	*National and Regional Data: Not required as the detail is held at the county and local authroity level 
	
	drop country region regioncode
	
	**create a date function (to allow for averages later)
	gen date = mdy(month,dayofmonth,2020)
	format date %td
	label variable date "Date of Restriction"
	drop month dayofmonth 
	
	
**COMBINING LOCAL AUTHORITY DATA: The vaccine data is held on a Geographical ONS Code. Lockdown data is held on local and county level. Pivot tables in Excel show that lockdown does not always match the level where the vaccine data is held. 
	
	replace lacode = "" if inlist(lacode, "E11000001", "E11000002", "E11000003")
	replace lacode = "" if inlist(lacode, "E11000005", "E11000006", "E11000007")
	replace lacode = "" if inlist(lacode, "E13000001", "E13000002")
	gen onscode = countycode if lacode == ""
	replace onscode = lacode if lacode != ""
	duplicates drop onscode date, force
	
*Renaming onscode (after sense checked in excel)
	replace laname = "Buckinghamshire" if onscode == "E10000002"
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
		
	collapse (sum) sumsociald = socialdistancing ///
		 (sum) sumhospshut = hospitalityshut  ///
		 (sum) sumretail = retailshut ///
		 (max) maxtiera = tiera  ///
		 (max) maxtierb = tierb ///
,by(onscode laname)

*need to drop COUNTY (Rutland - E06000017) (Isle of Scilly - E06000053) - (City of London - E09000001*) these are not reflected in Vaccine Data 
* city of london vaccine data is normally reflected in hackney. has the same lockdown score so just dropped 

drop if inlist(onscode,  "E06000017", "E06000053", "E09000001")
expand 12
sort laname

**#2 Processing Data 

	
**#3 Combining the Vaccine and  Data



* There has also been some changes in names and codes so data will need to be combined. 
*Merge with vaccine data 
*merge m:1 using (need to generate a .dta for the vaccine data)

