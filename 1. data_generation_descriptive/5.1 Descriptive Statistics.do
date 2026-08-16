**# 1.4.1 Treatment Indicators & Quintiles (Time-Invariant LA Level: N = 314)

preserve
    collapse (mean) total_tier tier_quintile total_tier1 total_tier2 total_tier3 total_tier4 ///
                    total_retail retail_quintile, by(onscode)
    
    tabstat total_tier total_tier1 total_tier2 total_tier3 total_tier4 total_retail, ///
        stats(n mean sd p50 p25 p75 min max) columns(statistics) format(%9.2f)
        
    tab tier_quintile
    tab retail_quintile
restore

**# 1.4.2 Vaccination Uptake across LA's (MMR and Hexavalent)
codebook mmr1_5y mmr2_5y dtp_12m dtp_24m mmr1_24m dtp_5y dtp_boost_5y

recode dtp_5y dtp_boost_5y (0 = .)

tabstat dtp_12m dtp_24m dtp_5y dtp_boost_5y mmr1_24m mmr1_5y mmr2_5y, ///
    stats(n mean sd p50 p25 p75 min max) columns(statistics) format(%9.2f)
	
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
tabstat white_pct asian_pct black_pct hh_deprived_0_pct christian_pct noreligion_pct, ///
    by(tier_quintile) stats(mean) format(%9.2f)

* 2. Cross-Tabulation using a Structured Table
table tier_quintile, stat(mean white_pct asian_pct black_pct hh_deprived_0_pct christian_pct noreligion_pct)

	* Continuous Correlations
	pwcorr total_tier white_pct hh_deprived_0_pct noreligion_pct, sig star(0.05)
