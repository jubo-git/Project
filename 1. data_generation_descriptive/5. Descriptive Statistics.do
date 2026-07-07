**# Load Dataset 

use "https://raw.githubusercontent.com/jubo-git/Project/main/data_clean/Lockdown_MMR_NOMIS.dta", clear


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