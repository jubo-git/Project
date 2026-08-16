**#4 Creating Usable Dataset 
cd "C:\Users\44799\OneDrive - MMU\03 DISSERTATION\GITHUB\"

clear
use "2. data_clean\final_combined_vaccine_dataset.dta"
merge m:1 onscode using "2. data_clean\lockdown_dataset_medium.dta", nogenerate


	* Save intermediate file to clean data subfolder
	save "2. data_clean/lockdown_vaccine_data.dta", replace
	replace onscode = "E08000012" if laname == "St Helens"
	
**#5 Combining NOMIS, Lockdown and Vaccine
clear
use "2. data_clean/lockdown_vaccine_data.dta"
	
//Cumbria and Northamptonshire and St.Helens
	
merge m:1 onscode using "2. data_clean/nomis_dataset.dta"

	**Investigating Mismatched via _merge variable 
	tab laname _merge //note there is no NOMIS data for Northamptonshire and Cumbria 
	drop area  totalallhouseholds _merge // remove unncessary variables for analysis 

	**Prepare for DiD analysis by encoding ONS, generating post variable and outlining panel data 
	encode onscode, gen(ons_id)
	destring year, replace
	gen post = (year >= 2020)
	xtset ons_id year
	
	**Inspecting missing values 
	list laname onscode if year == . //They have come over from NOMIS data where they don't match any codes. 
	drop if year == .
	
	**# Data Cleaning

	* Rename ethnic group variables _pct 
	rename white white_pct
	rename asianasianbritishorasianwe asian_pct
	rename blackblackbritishblackwels black_pct
	rename mixedormultipleethnicgroups mixed_pct
	rename otherethnicgroup other_pct

	* Rename the deprivation variables _pct
	rename householdisnotdeprivedinany hh_deprived_0_pct
	rename householdisdeprivedinonedim hh_deprived_1_pct
	rename householdisdeprivedintwodim hh_deprived_2_pct
	rename householdisdeprivedinthreed hh_deprived_3_pct
	rename householdisdeprivedinfourdi hh_deprived_4_pct
	
	*Rename religion variables _pct
	rename noreligion noreligion_pct
	rename christian christian_pct
	rename buddhist	buddhist_pct
	rename hindu hindu_pct
	rename jewish jewish_pct
	rename muslim muslim_pct
	rename sikh sikh_pct
	rename otherreligion otherreligion_pct
	
	
//	cd "C:\Users\44799\OneDrive - MMU\03 DISSERTATION\GITHUB\"	
	save "2. data_clean/full_dataset.dta", replace