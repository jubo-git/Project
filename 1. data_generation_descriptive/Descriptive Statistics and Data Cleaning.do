**# Load Dataset 

use "https://raw.githubusercontent.com/jubo-git/Project/main/data_clean/Lockdown_MMR_NOMIS.dta", clear

save "data_clean/Lockdown Dataset COMP.dta", replace

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
	

**# Descriptive - Overall 

	mean *_pct
	sum *_pct, d
	dtable *_pct
	
**Univariate Data (they are all numerical): Measures of Central Tendency (Mean, Median and Mode) 

**# Descriptive Standard Deviations 
	//This is to show how under or over represented a group is 

//foreach item in list_of_items {
//   [stata commands using `item']
//}
	
	foreach nomis_type of varlist *_pct {
    egen z_`nomis_type' = std(`nomis_type')
	}

	tabstat z_*_pct, by(confidence_quintile) format(%9.2f)
	tabstat z_*_pct, by(complacency_quintile) format(%9.2f)
	
	**Average makeup (%) of each quintile
	tabstat *_pct, by(onscode) 
	dtable *_pct, by(confidence_quintile) continuous(*_pct, statistic(median)) title("Descriptive Statistics by Confidence Quintile")