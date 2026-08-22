
use "https://raw.githubusercontent.com/jubo-git/Project/main/2.%20data_clean/full_dataset.dta", clear

**# 1.4.1 Treatment Indicators & Quintiles (Time-Invariant LA Level: N = 314)

preserve
    collapse (mean) total_tier tier_quartile total_tier1 total_tier2 total_tier3 total_tier4 ///
                   retail_quartile, by(onscode)
    
    tabstat total_tier total_tier1 total_tier2 total_tier3 total_tier4, ///
        stats(n mean sd p50 p25 p75 min max) columns(statistics) format(%9.2f)
        
    tab tier_quartile
restore

preserve
    * Collapse to LA level
    collapse (mean) total_tier tier_quartile total_tier1 total_tier2 total_tier3 total_tier4 ///
                   , by(onscode)

    * 1. Cumulative Tier Score (Composite Index)
    histogram total_tier, percent ///
        title("total_tier", size(small)) ///
        xtitle("Composite Tier Index") ///
        name(gr_total_tier, replace)

    * 2. Individual Tier Days (Calendar Days)
    local day_vars total_tier1 total_tier2 total_tier3 total_tier4 total_retail
    foreach var of local day_vars {
        histogram `var', percent ///
            title("`var'", size(small)) ///
            xtitle("Days") ///
            name(gr_`var', replace)
    }

    * Combine into grid
    graph combine gr_total_tier gr_total_tier1 gr_total_tier2 gr_total_tier3 gr_total_tier4 , ///
        cols(3) title("Distributions of Exposure Index & Restriction Days Across LAs")
restore

**# 1.4.2 Vaccination Uptake across LA's (MMR and Hexavalent)
codebook mmr1_5y mmr2_5y dtp_12m dtp_24m mmr1_24m dtp_5y dtp_boost_5y

recode dtp_5y dtp_boost_5y (0 = .)

tabstat dtp_12m dtp_24m dtp_5y dtp_boost_5y mmr1_24m mmr1_5y mmr2_5y, ///
    stats(n mean sd p50 p25 p75 min max) columns(statistics) format(%9.2f)
	
	* Loop to generate individual histograms truncated at 60%
	foreach var in dtp_12m dtp_24m dtp_5y dtp_boost_5y mmr1_24m mmr1_5y mmr2_5y {
		histogram `var' if `var' >= 60, percent ///
			xscale(range(60 100)) xlabel(60(10)100) ///
			title("`var'", size(small)) name(gr_`var', replace)
	}

	* Combine into a single figure
	graph combine gr_dtp_12m gr_dtp_24m gr_dtp_5y gr_dtp_boost_5y gr_mmr1_24m gr_mmr1_5y gr_mmr2_5y, ///
		cols(3) title("Distributions of Vaccine Uptake (Lowest % at 60%)")
		
**# 1.4.3	Baseline Demographics and Covariates (Census 2021)
preserve
    collapse (mean) asian_pct black_pct mixed_pct other_pct white_pct ///
                    hh_deprived_1_pct hh_deprived_2_pct hh_deprived_3_pct hh_deprived_4_pct hh_deprived_0_pct christian_pct buddhist_pct hindu_pct jewish_pct muslim_pct sikh_pct              otherreligion_pct noreligion_pct notanswered, by(onscode)

    tabstat asian_pct black_pct mixed_pct other_pct white_pct ///
            hh_deprived_1_pct hh_deprived_2_pct hh_deprived_3_pct hh_deprived_4_pct hh_deprived_0_pct ///
            christian_pct muslim_pct jewish_pct noreligion_pct, ///
            stats(n mean sd p50 p25 p75 min max) columns(statistics) format(%9.2f)
restore

**# Bivariate

*1. Summary of Demographic Shares across Tier Quintiles
	
	*Race
	tabstat asian_pct black_pct mixed_pct other_pct white_pct hh_deprived_0_pct christian_pct noreligion_pct, ///
		by(tier_quartile) stats(mean) format(%9.2f)
	
	*Deprivation
	tabstat hh_deprived_1_pct hh_deprived_2_pct hh_deprived_3_pct hh_deprived_4_pct hh_deprived_0_pct, ///
		by(tier_quartile) stats(mean) format(%9.2f)
	
	*Religion
		tabstat christian_pct muslim_pct jewish_pct noreligion_pct,  ///
		by(tier_quartile) stats(mean) format(%9.2f)
	

* 2. Cross-Tabulation using a Structured Table
table tier_quartile, stat(mean white_pct asian_pct black_pct hh_deprived_0_pct christian_pct noreligion_pct)

	* Continuous Correlations
	pwcorr total_tier white_pct hh_deprived_0_pct noreligion_pct, sig star(0.05)
