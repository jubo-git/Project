**# Load Dataset 

use "https://raw.githubusercontent.com/jubo-git/Project/main/2.%20data_clean/full_dataset.dta", clear

*Demonstrate treatment variate 

sum total_tier total_tier1 total_tier2 total_tier3 total_tier4, detail

* Summary of continuous dosage broken down by Quintiles
tabstat total_tier total_tier1 total_tier2 total_tier3 total_tier4, ///
    by(tier_quintile) stat(mean sd min max) format(%9.1f)
	
*Demograhpic covariate balance by tier quintile 
preserve
    duplicates drop onscode, force
    
    dtable asian_pct black_pct white_pct hh_deprived_3_pct hh_deprived_4_pct muslim_pct christian_pct, ///
        by(tier_quintile) ///
        continuous(, stat(mean sd)) ///
        title("Table 2: Time-Invariant Census Covariates Stratified by Lockdown Tier Quintile")
restore
	
	
**# Descriptive - Overall 

	mean *_pct

	dtable *_pct
	
**Univariate Data (they are all numerical): Measures of Central Tendency (Mean, Median and Mode) 
	
	*Percentage metrics 
	sum *_pct, d

	**# Descriptive - Outcome Variables (by pre/post)



**# Descriptive Standard Deviations 
	//This is to show how under or over represented a group is 

//foreach item in list_of_items {
//   [stata commands using `item']
//}
	
	foreach nomis_type of varlist *_pct {
    egen z_`nomis_type' = std(`nomis_type')
	}

	tabstat z_*_pct, by(total_tier) format(%9.2f)

	**Average makeup (%) of each quintile
	tabstat *_pct, by(onscode) 
	dtable *_pct, by(total_tier) continuous(*_pct, statistic(median)) title("Descriptive Statistics by Confidence Quintile")
	
**# Descriptive Update 
* ==============================================================================
* DESCRIPTIVE ANALYSIS: VACCINE UPTAKE, TIER DOSAGE, AND DEMOGRAPHICS
* ==============================================================================

* 1. Primary Outcomes (Vaccine Uptake - Full Panel: N = LA * Years)
tabstat dtp_12m dtp_24m dtp_5y dtp_boost_5y mmr1_24m mmr1_5y mmr2_5y, ///
    stats(n mean sd p50 p25 p75 min max) columns(statistics) format(%9.2f)

* 2. Treatment Indicators & Quintiles (Time-Invariant LA Level: N = 314)
* Preserve/collapse to unique LA level to prevent panel-weighting bias
preserve
    collapse (mean) total_tier tier_quintile total_tier1 total_tier2 total_tier3 total_tier4 ///
                    total_retail retail_quintile, by(onscode)
    
    tabstat total_tier total_tier1 total_tier2 total_tier3 total_tier4 total_retail, ///
        stats(n mean sd p50 p25 p75 min max) columns(statistics) format(%9.2f)
        
    tab tier_quintile
    tab retail_quintile
restore

* 3. Demographic Controls (Census 2021 - Time-Invariant LA Level: N = 314)
preserve
    collapse (mean) asian_pct black_pct mixed_pct other_pct white_pct ///
                    hh_deprived_1_pct hh_deprived_2_pct hh_deprived_3_pct hh_deprived_4_pct hh_deprived_0_pct ///
                    christian_pct buddhist_pct hindu_pct jewish_pct muslim_pct sikh_pct ///
                    otherreligion_pct noreligion_pct notanswered, by(onscode)

    tabstat asian_pct black_pct mixed_pct other_pct white_pct ///
            hh_deprived_1_pct hh_deprived_2_pct hh_deprived_3_pct hh_deprived_4_pct ///
            christian_pct muslim_pct jewish_pct noreligion_pct, ///
            stats(n mean sd p50 p25 p75 min max) columns(statistics) format(%9.2f)
restore
	