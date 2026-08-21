
**#0 GitHub Setup
use "https://raw.githubusercontent.com/jubo-git/Project/main/2.%20data_clean/full_dataset.dta", clear

**# 0.1 Define Panel Structure 
xtset ons_id year


**# PRIMARY CONTINUOUS cDiD MODELS (LA FE + Year FE) — Table 2


	**Model 1.1: Tier — DTP at 12 months
	xtreg dtp_12m c.total_tier#i.post i.year, fe vce(cluster onscode)

	**Model 2.1: Tier — DTP at 24 months
	xtreg dtp_24m c.total_tier#i.post i.year, fe vce(cluster onscode)

	**Model 3.1: Tier — MMR1 at 24 months
	xtreg mmr1_24m c.total_tier#i.post i.year, fe vce(cluster onscode)

	**Model 4.1: Tier — DTP at 5 years
	xtreg dtp_5y c.total_tier#i.post i.year, fe vce(cluster onscode)

	**Model 5.1: Tier — DTP Booster at 5 years
	xtreg dtp_boost_5y c.total_tier#i.post i.year, fe vce(cluster onscode)

	**Model 6.1: Tier — MMR1 at 5 years
	xtreg mmr1_5y c.total_tier#i.post i.year, fe vce(cluster onscode)

	**Model 7.1: Tier — MMR2 at 5 years
	xtreg mmr2_5y c.total_tier#i.post i.year, fe vce(cluster onscode)



**#  NON-LINEAR DOSE-RESPONSE CHECK (Quadratic Term)

	**Model 1.2: Tier — DTP at 12 months
	xtreg dtp_12m c.total_tier#i.post c.total_tier#c.total_tier#i.post i.year, fe vce(cluster onscode)

	**Model 2.2: Tier — DTP at 24 months
	xtreg dtp_24m c.total_tier#i.post c.total_tier#c.total_tier#i.post i.year, fe vce(cluster onscode)

	**Model 3.2: Tier — MMR1 at 24 months
	xtreg mmr1_24m c.total_tier#i.post c.total_tier#c.total_tier#i.post i.year, fe vce(cluster onscode)

	**Model 4.2: Tier — DTP at 5 years
	xtreg dtp_5y c.total_tier#i.post c.total_tier#c.total_tier#i.post i.year, fe vce(cluster onscode)

	**Model 5.2: Tier — DTP Booster at 5 years
	xtreg dtp_boost_5y c.total_tier#i.post c.total_tier#c.total_tier#i.post i.year, fe vce(cluster onscode)

	**Model 6.2: Tier — MMR1 at 5 years
	xtreg mmr1_5y c.total_tier#i.post c.total_tier#c.total_tier#i.post i.year, fe vce(cluster onscode)

	**Model 7.2: Tier — MMR2 at 5 years
	xtreg mmr2_5y c.total_tier#i.post c.total_tier#c.total_tier#i.post i.year, fe vce(cluster onscode)



**# POOLED OLS WITH NOMIS CONTROLS + VIF — Table 6


	**Model 1.3: Tier — DTP at 12 months
	regress dtp_12m c.total_tier#i.post asian_pct black_pct mixed_pct other_pct hh_deprived_1_pct hh_deprived_3_pct hh_deprived_4_pct christian_pct buddhist_pct hindu_pct jewish_pct muslim_pct sikh_pct otherreligion_pct, vce(cluster onscode)
	estat vif

	**Model 2.3: Tier — DTP at 24 months
	regress dtp_24m c.total_tier#i.post asian_pct black_pct mixed_pct other_pct hh_deprived_1_pct hh_deprived_3_pct hh_deprived_4_pct christian_pct buddhist_pct hindu_pct jewish_pct muslim_pct sikh_pct otherreligion_pct, vce(cluster onscode)
	estat vif

	**Model 3.3: Tier — MMR1 at 24 months
	regress mmr1_24m c.total_tier#i.post asian_pct black_pct mixed_pct other_pct hh_deprived_1_pct hh_deprived_3_pct hh_deprived_4_pct christian_pct buddhist_pct hindu_pct jewish_pct muslim_pct sikh_pct otherreligion_pct, vce(cluster onscode)
	estat vif

	**Model 4.3: Tier — DTP at 5 years
	regress dtp_5y c.total_tier#i.post asian_pct black_pct mixed_pct other_pct hh_deprived_1_pct hh_deprived_3_pct hh_deprived_4_pct christian_pct buddhist_pct hindu_pct jewish_pct muslim_pct sikh_pct otherreligion_pct, vce(cluster onscode)
	estat vif

	**Model 5.3: Tier — DTP Booster at 5 years
	regress dtp_boost_5y c.total_tier#i.post asian_pct black_pct mixed_pct other_pct hh_deprived_1_pct hh_deprived_3_pct hh_deprived_4_pct christian_pct buddhist_pct hindu_pct jewish_pct muslim_pct sikh_pct otherreligion_pct, vce(cluster onscode)
	estat vif

	**Model 6.3: Tier — MMR1 at 5 years
	regress mmr1_5y c.total_tier#i.post asian_pct black_pct mixed_pct other_pct hh_deprived_1_pct hh_deprived_3_pct hh_deprived_4_pct christian_pct buddhist_pct hindu_pct jewish_pct muslim_pct sikh_pct otherreligion_pct, vce(cluster onscode)
	estat vif

	**Model 7.3: Tier — MMR2 at 5 years
	regress mmr2_5y c.total_tier#i.post asian_pct black_pct mixed_pct other_pct hh_deprived_1_pct hh_deprived_3_pct hh_deprived_4_pct christian_pct buddhist_pct hindu_pct jewish_pct muslim_pct sikh_pct otherreligion_pct, vce(cluster onscode)
	estat vif


* 5. SENSITIVITY / ROBUSTNESS CHECK — Multi-Tier Model
*    (Threshold Effects: Tiers 2/3/4 relative to Tier 1)
********************************************************************************

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


********************************************************************************
* 6. SAVE / VERSION CONTROL
********************************************************************************

//Saving
!git pull
!git add .
!git commit -m "DiD Model Update - corrected interaction syntax, added year FE, disaggregated tier days robustness checks"
!git push -u origin main
