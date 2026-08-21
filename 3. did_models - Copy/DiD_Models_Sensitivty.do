**#0 GitHub Setup
use "https://raw.githubusercontent.com/jubo-git/Project/main/2.%20data_clean/full_dataset.dta", clear

**# 0.1 Define Panel Structure 
xtset ons_id year

**# Quick Access: Primary Continuous cDiD Specifications
	//xtreg [outcome] c.total_tier#i.post i.year, fe vce(cluster onscode)
	xtreg dtp_12m c.total_tier#i.post i.year, fe vce(cluster onscode)
	xtreg dtp_24m c.total_tier#i.post i.year, fe vce(cluster onscode)
	xtreg mmr1_24m c.total_tier#i.post i.year, fe vce(cluster onscode)
	xtreg dtp_5y c.total_tier#i.post i.year, fe vce(cluster onscode)
	xtreg dtp_boost_5y c.total_tier#i.post i.year, fe vce(cluster onscode)
	xtreg mmr1_5y c.total_tier#i.post i.year, fe vce(cluster onscode)
	xtreg mmr2_5y c.total_tier#i.post i.year, fe vce(cluster onscode)


**#1 - Tier: DTP at 12 months

	**Model 1.1: Primary Continuous cDiD (LA FE + Year FE)
	xtreg dtp_12m c.total_tier#i.post i.year, fe vce(cluster onscode)
	
	**Model 1.2: Non-Linear Dose-Response Check (Quadratic Term)
	xtreg dtp_12m c.total_tier#i.post c.total_tier#c.total_tier#i.post i.year, fe vce(cluster onscode)

	**Model 1.3: Pooled OLS Cross-Sectional Check with NOMIS Controls
	regress dtp_12m c.total_tier#i.post asian_pct black_pct mixed_pct other_pct hh_deprived_1_pct hh_deprived_3_pct hh_deprived_4_pct christian_pct buddhist_pct hindu_pct jewish_pct muslim_pct sikh_pct otherreligion_pct, vce(cluster onscode)
	estat vif


**#2 - Tier: DTP at 24 months

	**Model 2.1: Primary Continuous cDiD (LA FE + Year FE)
	xtreg dtp_24m c.total_tier#i.post i.year, fe vce(cluster onscode)

	**Model 2.2: Non-Linear Dose-Response Check (Quadratic Term)
	xtreg dtp_24m c.total_tier#i.post c.total_tier#c.total_tier#i.post i.year, fe vce(cluster onscode)

	**Model 2.3: Pooled OLS Cross-Sectional Check with NOMIS Controls
	regress dtp_24m c.total_tier#i.post asian_pct black_pct mixed_pct other_pct hh_deprived_1_pct hh_deprived_3_pct hh_deprived_4_pct christian_pct buddhist_pct hindu_pct jewish_pct muslim_pct sikh_pct otherreligion_pct, vce(cluster onscode)
	estat vif


**#3 - Tier: MMR1 at 24 months

	**Model 3.1: Primary Continuous cDiD (LA FE + Year FE)
	xtreg mmr1_24m c.total_tier#i.post i.year, fe vce(cluster onscode)

	**Model 3.2: Non-Linear Dose-Response Check (Quadratic Term)
	xtreg mmr1_24m c.total_tier#i.post c.total_tier#c.total_tier#i.post i.year, fe vce(cluster onscode)

	**Model 3.3: Pooled OLS Cross-Sectional Check with NOMIS Controls
	regress mmr1_24m c.total_tier#i.post asian_pct black_pct mixed_pct other_pct hh_deprived_1_pct hh_deprived_3_pct hh_deprived_4_pct christian_pct buddhist_pct hindu_pct jewish_pct muslim_pct sikh_pct otherreligion_pct, vce(cluster onscode)
	estat vif


**#4 - Tier: DTP at 5 years

	**Model 4.1: Primary Continuous cDiD (LA FE + Year FE)
	xtreg dtp_5y c.total_tier#i.post i.year, fe vce(cluster onscode)

	**Model 4.2: Non-Linear Dose-Response Check (Quadratic Term)
	xtreg dtp_5y c.total_tier#i.post c.total_tier#c.total_tier#i.post i.year, fe vce(cluster onscode)

	**Model 4.3: Pooled OLS Cross-Sectional Check with NOMIS Controls
	regress dtp_5y c.total_tier#i.post asian_pct black_pct mixed_pct other_pct hh_deprived_1_pct hh_deprived_3_pct hh_deprived_4_pct christian_pct buddhist_pct hindu_pct jewish_pct muslim_pct sikh_pct otherreligion_pct, vce(cluster onscode)
	estat vif


**#5 - Tier: DTP Booster at 5 years

	**Model 5.1: Primary Continuous cDiD (LA FE + Year FE)
	xtreg dtp_boost_5y c.total_tier#i.post i.year, fe vce(cluster onscode)

	**Model 5.2: Non-Linear Dose-Response Check (Quadratic Term)
	xtreg dtp_boost_5y c.total_tier#i.post c.total_tier#c.total_tier#i.post i.year, fe vce(cluster onscode)

	**Model 5.3: Pooled OLS Cross-Sectional Check with NOMIS Controls
	regress dtp_boost_5y c.total_tier#i.post asian_pct black_pct mixed_pct other_pct hh_deprived_1_pct hh_deprived_3_pct hh_deprived_4_pct christian_pct buddhist_pct hindu_pct jewish_pct muslim_pct sikh_pct otherreligion_pct, vce(cluster onscode)
	estat vif


**#6 - Tier: MMR1 at 5 years

	**Model 6.1: Primary Continuous cDiD (LA FE + Year FE)
	xtreg mmr1_5y c.total_tier#i.post i.year, fe vce(cluster onscode)

	**Model 6.2: Non-Linear Dose-Response Check (Quadratic Term)
	xtreg mmr1_5y c.total_tier#i.post c.total_tier#c.total_tier#i.post i.year, fe vce(cluster onscode)

	**Model 6.3: Pooled OLS Cross-Sectional Check with NOMIS Controls
	regress mmr1_5y c.total_tier#i.post asian_pct black_pct mixed_pct other_pct hh_deprived_1_pct hh_deprived_3_pct hh_deprived_4_pct christian_pct buddhist_pct hindu_pct jewish_pct muslim_pct sikh_pct otherreligion_pct, vce(cluster onscode)
	estat vif


**#7 - Tier: MMR2 at 5 years

	**Model 7.1: Primary Continuous cDiD (LA FE + Year FE)
	xtreg mmr2_5y c.total_tier#i.post i.year, fe vce(cluster onscode)

	**Model 7.2: Non-Linear Dose-Response Check (Quadratic Term)
	xtreg mmr2_5y c.total_tier#i.post c.total_tier#c.total_tier#i.post i.year, fe vce(cluster onscode)

	**Model 7.3: Pooled OLS Cross-Sectional Check with NOMIS Controls
	regress mmr2_5y c.total_tier#i.post asian_pct black_pct mixed_pct other_pct hh_deprived_1_pct hh_deprived_3_pct hh_deprived_4_pct christian_pct buddhist_pct hindu_pct jewish_pct muslim_pct sikh_pct otherreligion_pct, vce(cluster onscode)
	estat vif


**# Sensitivity/Robustness Check 

	**# Multi-Tier Model (Threshold Effects: Tiers 2/3/4 relative to Tier 1)
	* Note: total_tier1 is omitted as the reference category to prevent collinearity.
	* Coefficients on tier2-4 represent additional impact relative to Tier 1 baseline.
	
	xtreg dtp_12m c.total_tier2#i.post c.total_tier3#i.post c.total_tier4#i.post i.year, fe vce(cluster onscode)
	xtreg dtp_24m c.total_tier2#i.post c.total_tier3#i.post c.total_tier4#i.post i.year, fe vce(cluster onscode)
	xtreg mmr1_24m c.total_tier2#i.post c.total_tier3#i.post c.total_tier4#i.post i.year, fe vce(cluster onscode)
	xtreg dtp_5y c.total_tier2#i.post c.total_tier3#i.post c.total_tier4#i.post i.year, fe vce(cluster onscode)
	xtreg dtp_boost_5y c.total_tier2#i.post c.total_tier3#i.post c.total_tier4#i.post i.year, fe vce(cluster onscode)
	xtreg mmr1_5y c.total_tier2#i.post c.total_tier3#i.post c.total_tier4#i.post i.year, fe vce(cluster onscode)
	xtreg mmr2_5y c.total_tier2#i.post c.total_tier3#i.post c.total_tier4#i.post i.year, fe vce(cluster onscode)

	* Findings wording: total_tier3#1.post is significantly more negative than total_tier2#1.post.
	* Interpretation: "While exposure to Tier 2 reduced uptake by X%, each day in Tier 3 reduced 
	* uptake by Y%, proving that restriction severity amplifies disruption relative to baseline exposure."


//Saving
!git pull
!git add .
!git commit -m "DiD Model Update - corrected interaction syntax, added year FE, disaggregated tier days robustness checks"
!git push -u origin main