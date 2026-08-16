**#0 GitHub Setup
use "https://raw.githubusercontent.com/jubo-git/Project/main/2.%20data_clean/full_dataset.dta", clear

**Quick Access 

	xtreg dtp_12m c.total_tier##i.post, fe vce(cluster onscode)
	xtreg dtp_24m c.total_tier##i.post, fe vce(cluster onscode)
	xtreg mmr1_24m c.total_tier##i.post, fe vce(cluster onscode)
	xtreg dtp_5y c.total_tier##i.post, fe vce(cluster onscode)
	xtreg dtp_boost_5y c.total_tier##i.post, fe vce(cluster onscode)
	xtreg mmr1_5y c.total_tier##i.post, fe vce(cluster onscode)
	xtreg mmr2_5y c.total_tier##i.post, fe vce(cluster onscode)

	**Basic DiD -  There is not "individual" vaccine measurements, rather they are aggregated by coverage at the Local Authority level. The variables (NOMIS measures) vary exclusively at this level, there is therefore no mixture of group and individual data. Therefore the regression model is adjusted for group level serial correlation over time using the vce(cluster onscode) function

**# 0.1 Define Panel Structure 
	xtset ons_id year
		
**#1  - Tier: DTP at 12 months (Justification on this one)

	**Model 1.1: Continuous Dose
	xtreg dtp_12m c.total_tier##i.post, fe vce(cluster onscode) //i.year not included to allow for average policy effect. The dynamic effects were verified in the event study 
	
	**Model 1.1b: Non-Linear Dose-Response Check (quadratic term)
	xtreg dtp_12m c.total_tier##i.post c.total_tier#c.total_tier#i.post, fe vce(cluster onscode)
	
	**Model 1.2: Cluster OLS
	regress dtp_12m c.total_tier##i.post, vce(cluster onscode)
	margins post, at(total_tier=(60(26)160))
	marginsplot, xdimension(post)

	**Model 1.3: Cluster with fixed effects
	xtreg dtp_12m c.total_tier##i.post, fe vce(cluster onscode)

	**Model 1.4: With NOMIS Controls
	regress dtp_12m c.total_tier##i.post asian_pct black_pct mixed_pct other_pct hh_deprived_1_pct hh_deprived_3_pct hh_deprived_4_pct christian_pct buddhist_pct hindu_pct jewish_pct muslim_pct sikh_pct otherreligion_pct, vce(cluster onscode)
	estat vif


**#2  - Tier: DTP at 24 months

	**Model 2.1: Continuous Dose
	xtreg dtp_24m c.total_tier##i.post, fe vce(cluster onscode)

	**Model 2.2: Cluster OLS
	regress dtp_24m c.total_tier##i.post, vce(cluster onscode)
	margins post, at(total_tier=(60(26)160))
	marginsplot, xdimension(post)

	**Model 2.3: Cluster with fixed effects
	xtreg dtp_24m c.total_tier##i.post, fe vce(cluster onscode)

	**Model 2.4: With NOMIS Controls
	regress dtp_24m c.total_tier##i.post asian_pct black_pct mixed_pct other_pct hh_deprived_1_pct hh_deprived_3_pct hh_deprived_4_pct christian_pct buddhist_pct hindu_pct jewish_pct muslim_pct sikh_pct otherreligion_pct, vce(cluster onscode)
	estat vif


**#3  - Tier: MMR1 at 24 months

	**Model 3.1: Continuous Dose
	xtreg mmr1_24m c.total_tier##i.post, fe vce(cluster onscode)

	**Model 3.2: Cluster OLS
	regress mmr1_24m c.total_tier##i.post, vce(cluster onscode)
	margins post, at(total_tier=(60(26)160))
	marginsplot, xdimension(post)

	**Model 3.3: Cluster with fixed effects
	xtreg mmr1_24m c.total_tier##i.post, fe vce(cluster onscode)

	**Model 3.4: With NOMIS Controls
	regress mmr1_24m c.total_tier##i.post asian_pct black_pct mixed_pct other_pct hh_deprived_1_pct hh_deprived_3_pct hh_deprived_4_pct christian_pct buddhist_pct hindu_pct jewish_pct muslim_pct sikh_pct otherreligion_pct, vce(cluster onscode)
	estat vif


**#4  - Tier: DTP at 5 years

	**Model 4.1: Continuous Dose
	xtreg dtp_5y c.total_tier##i.post, fe vce(cluster onscode)

	**Model 4.2: Cluster OLS
	regress dtp_5y c.total_tier##i.post, vce(cluster onscode)
	margins post, at(total_tier=(60(26)160))
	marginsplot, xdimension(post)

	**Model 4.3: Cluster with fixed effects
	xtreg dtp_5y c.total_tier##i.post, fe vce(cluster onscode)
	margins post, at(total_tier=(60(26)160))
	marginsplot, xdimension(post)

	**Model 4.4: With NOMIS Controls
	regress dtp_5y c.total_tier##i.post asian_pct black_pct mixed_pct other_pct hh_deprived_1_pct hh_deprived_3_pct hh_deprived_4_pct christian_pct buddhist_pct hindu_pct jewish_pct muslim_pct sikh_pct otherreligion_pct, vce(cluster onscode)
	estat vif


**#5  - Tier: DTP Booster at 5 years

	**Model 5.1: Continuous Dose
	xtreg dtp_boost_5y c.total_tier##i.post, fe vce(cluster onscode)

	**Model 5.2: Cluster OLS
	regress dtp_boost_5y c.total_tier##i.post, vce(cluster onscode)
	margins post, at(total_tier=(60(26)160))
	marginsplot, xdimension(post)

	**Model 5.3: Cluster with fixed effects
	xtreg dtp_boost_5y c.total_tier##i.post, fe vce(cluster onscode)
	margins post, at(total_tier=(60(26)160))
	marginsplot, xdimension(post)

	**Model 5.4: With NOMIS Controls
	regress dtp_boost_5y c.total_tier##i.post asian_pct black_pct mixed_pct other_pct hh_deprived_1_pct hh_deprived_3_pct hh_deprived_4_pct christian_pct buddhist_pct hindu_pct jewish_pct muslim_pct sikh_pct otherreligion_pct, vce(cluster onscode)
	estat vif


**#6  - Tier: MMR1 at 5 years

	**Model 6.1: Continuous Dose
	xtreg mmr1_5y c.total_tier##i.post, fe vce(cluster onscode)

	**Model 6.2: Cluster OLS
	regress mmr1_5y c.total_tier##i.post, vce(cluster onscode)
	margins post, at(total_tier=(60(26)160))
	marginsplot, xdimension(post)

	**Model 6.3: Cluster with fixed effects
	xtreg mmr1_5y c.total_tier##i.post, fe vce(cluster onscode)
	margins post, at(total_tier=(60(26)160))
	marginsplot, xdimension(post)

	**Model 6.4: With NOMIS Controls
	regress mmr1_5y c.total_tier##i.post asian_pct black_pct mixed_pct other_pct hh_deprived_1_pct hh_deprived_3_pct hh_deprived_4_pct christian_pct buddhist_pct hindu_pct jewish_pct muslim_pct sikh_pct otherreligion_pct, vce(cluster onscode)
	estat vif


**#7 : MMR2 at 5 years

	**Model 7.1: Continuous Dose
	xtreg mmr2_5y c.total_tier##i.post, fe vce(cluster onscode)

	**Model 7.2: Cluster OLS
	regress mmr2_5y c.total_tier##i.post, vce(cluster onscode)
	margins post, at(total_tier=(60(26)160))
	marginsplot, xdimension(post)

	**Model 7.3: Cluster with fixed effects
	xtreg mmr2_5y c.total_tier##i.post, fe vce(cluster onscode)
	margins post, at(total_tier=(60(26)160))
	marginsplot, xdimension(post)

	**Model 7.4: With NOMIS Controls
	regress mmr2_5y c.total_tier##i.post asian_pct black_pct mixed_pct other_pct hh_deprived_1_pct hh_deprived_3_pct hh_deprived_4_pct christian_pct buddhist_pct hindu_pct jewish_pct muslim_pct sikh_pct otherreligion_pct, vce(cluster onscode)
	estat vif


//Saving
!git pull
!git add .
!git commit -m "DiD Model Update - single treatment variable (total_tier), all vaccine outcomes (12m, 24m, 5y)"
!git push -u origin main