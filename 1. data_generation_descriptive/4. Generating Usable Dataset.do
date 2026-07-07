**#4 Creating Usable Dataset 
cd "C:\Users\44799\OneDrive - MMU\03 DISSERTATION\GITHUB\"

clear
use "2. data_clean\final_combined_vaccine_dataset.dta"
merge m:1 onscode using "2. data_clean/lockdown_dataset.dta", nogenerate


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
	drop area z_tier z_retail totalallhouseholds _merge // remove unncessary variables for analysis 

	**Prepare for DiD analysis by encoding ONS, generating post variable and outlining panel data 
	encode onscode, gen(ons_id)
	destring year, replace
	gen post = (year >= 2020)
	xtset ons_id year
	
	**Inspecting missing values 
	list laname onscode if year == . //They have come over from NOMIS data where they don't match any codes. 
	drop if year == .
	
	cd "C:\Users\44799\OneDrive - MMU\03 DISSERTATION\GITHUB\"	
	save "2. data_clean/full_dataset.dta", replace