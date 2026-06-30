**#0 GitHub Setup
use "https://raw.githubusercontent.com/jubo-git/Project/main/data_clean/Lockdown_MMR_NOMIS.dta"


	**Basic DiD -  There is not "indivual" vaccine measurements, rather they are aggregated by coverage at the Local Authority level. The variables (NOMIS measures) vary exclusively at this level, there is therefore no mixture of group and invidual data. Therefore the regression model is adjusted for group level serial correlation over time using the vce(cluster onscode function


**#1 Confidence - Tier A: MMR1 at 24 months

	**Model 1.1: Continous Dose
	xtreg mmr1_24m c.tierdays_a##post, fe vce(cluster onscode)

	**Model 1.2: Cluster OLS
	regress mmr1_24m i.tieraquintile##post, vce(cluster onscode)
	margins tieraquintile#post
	marginsplot, xdimension(post)

	**Model 1.3: Cluster with fixed effects
	xtreg mmr1_24m i.tieraquintile##post, fe vce(cluster onscode)
	margins tieraquintile#post
	marginsplot, xdimension(post)

	**Model 1.4: With NOMIS Controls

	//(Race (reference to White)) & (reference to Household is not Deprived) Religion (reference to no religion / not answered)
	//dropped asianasianbritishorasianwe due to high vif
	//Need to find time-dependent NOMIS results. Not census data

	regress mmr1_24m i.tieraquintile##post blackblackbritishblackwels otherethnicgroup householdisdeprivedinonedim householdisdeprivedinthreed householdisdeprivedinfourdi christian buddhist hindu jewish muslim sikh otherreligion, vce(cluster ons_id)
	estat vif


**#2 Confidence - Tier A: MMR1 at 5 years

	**Model 2.1: Continous Dose
	xtreg mmr1_5y c.tierdays_a##post, fe vce(cluster onscode)

	**Model 2.2: Cluster OLS
	regress mmr1_5y i.tieraquintile##post, vce(cluster onscode)
	margins tieraquintile#post
	marginsplot, xdimension(post)

	**Model 2.3: Cluster with fixed effects
	xtreg mmr1_5y i.tieraquintile##post, fe vce(cluster onscode)
	margins tieraquintile#post
	marginsplot, xdimension(post)

	**Model 2.4: With NOMIS Controls
	regress mmr1_5y i.tieraquintile##post blackblackbritishblackwels otherethnicgroup householdisdeprivedinonedim householdisdeprivedinthreed householdisdeprivedinfourdi christian buddhist hindu jewish muslim sikh otherreligion, vce(cluster ons_id)
	estat vif


**#3 Confidence - Tier A: MMR2 at 5 years

	**Model 3.1: Continous Dose
	xtreg mmr2_5y c.tierdays_a##post, fe vce(cluster onscode)

	**Model 3.2: Cluster OLS
	regress mmr2_5y i.tieraquintile##post, vce(cluster onscode)
	margins tieraquintile#post
	marginsplot, xdimension(post)

	**Model 3.3: Cluster with fixed effects
	xtreg mmr2_5y i.tieraquintile##post, fe vce(cluster onscode)
	margins tieraquintile#post
	marginsplot, xdimension(post)

	**Model 3.4: With NOMIS Controls
	regress mmr2_5y i.tieraquintile##post blackblackbritishblackwels otherethnicgroup householdisdeprivedinonedim householdisdeprivedinthreed householdisdeprivedinfourdi christian buddhist hindu jewish muslim sikh otherreligion, vce(cluster ons_id)
	estat vif


**#4 Confidence - Tier B: MMR1 at 24 months

	**Model 4.1: Continous Dose
	xtreg mmr1_24m c.tierdays_b##post, fe vce(cluster onscode)

	**Model 4.2: Cluster OLS
	regress mmr1_24m i.tierbquintile##post, vce(cluster onscode)
	margins tierbquintile#post
	marginsplot, xdimension(post)

	**Model 4.3: Cluster with fixed effects
	xtreg mmr1_24m i.tierbquintile##post, fe vce(cluster onscode)
	margins tierbquintile#post
	marginsplot, xdimension(post)

	**Model 4.4: With NOMIS Controls
	regress mmr1_24m i.tierbquintile##post blackblackbritishblackwels otherethnicgroup householdisdeprivedinonedim householdisdeprivedinthreed householdisdeprivedinfourdi christian buddhist hindu jewish muslim sikh otherreligion, vce(cluster ons_id)
	estat vif


**#5 Confidence - Tier B: MMR1 at 5 years

	**Model 5.1: Continous Dose
	xtreg mmr1_5y c.tierdays_b##post, fe vce(cluster onscode)

	**Model 5.2: Cluster OLS
	regress mmr1_5y i.tierbquintile##post, vce(cluster onscode)
	margins tierbquintile#post
	marginsplot, xdimension(post)

	**Model 5.3: Cluster with fixed effects
	xtreg mmr1_5y i.tierbquintile##post, fe vce(cluster onscode)
	margins tierbquintile#post
	marginsplot, xdimension(post)

	**Model 5.4: With NOMIS Controls
	regress mmr1_5y i.tierbquintile##post blackblackbritishblackwels otherethnicgroup householdisdeprivedinonedim householdisdeprivedinthreed householdisdeprivedinfourdi christian buddhist hindu jewish muslim sikh otherreligion, vce(cluster ons_id)
	estat vif


**#6 Confidence - Tier B: MMR2 at 5 years

	**Model 6.1: Continous Dose
	xtreg mmr2_5y c.tierdays_b##post, fe vce(cluster onscode)

	**Model 6.2: Cluster OLS
	regress mmr2_5y i.tierbquintile##post, vce(cluster onscode)
	margins tierbquintile#post
	marginsplot, xdimension(post)

	**Model 6.3: Cluster with fixed effects
	xtreg mmr2_5y i.tierbquintile##post, fe vce(cluster onscode)
	margins tierbquintile#post
	marginsplot, xdimension(post)

	**Model 6.4: With NOMIS Controls
	regress mmr2_5y i.tierbquintile##post blackblackbritishblackwels otherethnicgroup householdisdeprivedinonedim householdisdeprivedinthreed householdisdeprivedinfourdi christian buddhist hindu jewish muslim sikh otherreligion, vce(cluster ons_id)
	estat vif


**#7 Complacency - Retail: MMR1 at 24 months

	**Model 7.1: Continous Dose
	xtreg mmr1_24m c.total_retail##post, fe vce(cluster onscode)

	**Model 7.2: Cluster OLS
	regress mmr1_24m i.complacency_quintile##post, vce(cluster onscode)
	margins complacency_quintile#post
	marginsplot, xdimension(post)

	**Model 7.3: Cluster with fixed effects
	xtreg mmr1_24m i.complacency_quintile##post, fe vce(cluster onscode)
	margins complacency_quintile#post
	marginsplot, xdimension(post)

	**Model 7.4: With NOMIS Controls
	regress mmr1_24m i.complacency_quintile##post blackblackbritishblackwels otherethnicgroup householdisdeprivedinonedim householdisdeprivedinthreed householdisdeprivedinfourdi christian buddhist hindu jewish muslim sikh otherreligion, vce(cluster ons_id)
	estat vif


**#8 Complacency - Retail: MMR1 at 5 years

	**Model 8.1: Continous Dose
	xtreg mmr1_5y c.total_retail##post, fe vce(cluster onscode)

	**Model 8.2: Cluster OLS
	regress mmr1_5y i.complacency_quintile##post, vce(cluster onscode)
	margins complacency_quintile#post
	marginsplot, xdimension(post)

	**Model 8.3: Cluster with fixed effects
	xtreg mmr1_5y i.complacency_quintile##post, fe vce(cluster onscode)
	margins complacency_quintile#post
	marginsplot, xdimension(post)

	**Model 8.4: With NOMIS Controls
	regress mmr1_5y i.complacency_quintile##post blackblackbritishblackwels otherethnicgroup householdisdeprivedinonedim householdisdeprivedinthreed householdisdeprivedinfourdi christian buddhist hindu jewish muslim sikh otherreligion, vce(cluster ons_id)
	estat vif


**#9 Complacency - Retail: MMR2 at 5 years

	**Model 9.1: Continous Dose
	xtreg mmr2_5y c.total_retail##post, fe vce(cluster onscode)

	**Model 9.2: Cluster OLS
	regress mmr2_5y i.complacency_quintile##post, vce(cluster onscode)
	margins complacency_quintile#post
	marginsplot, xdimension(post)

	**Model 9.3: Cluster with fixed effects
	xtreg mmr2_5y i.complacency_quintile##post, fe vce(cluster onscode)
	margins complacency_quintile#post
	marginsplot, xdimension(post)

	**Model 9.4: With NOMIS Controls
	regress mmr2_5y i.complacency_quintile##post blackblackbritishblackwels otherethnicgroup householdisdeprivedinonedim householdisdeprivedinthreed householdisdeprivedinfourdi christian buddhist hindu jewish muslim sikh otherreligion, vce(cluster ons_id)
	estat vif


//Saving
!git pull
!git add .
!git commit -m "DiD by Tier A, Tier B, Complacency - Total removed"
!git push -u origin main