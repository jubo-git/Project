**#0 GitHub Setup
use "https://raw.githubusercontent.com/jubo-git/Project/main/data_clean/Lockdown_MMR_NOMIS.dta"


	**Basic DiD -  There is not "indivual" vaccine measurements, rather they are aggregated by coverage at the Local Authority level. The variables (NOMIS measures) vary exclusively at this level, there is therefore no mixture of group and invidual data. Therefore the regression model is adjusted for group level serial correlation over time using the vce(cluster onscode function
	
**# MMR1 at 24 months 	 

	**Model 1.1: Continous Dose
	xtreg mmr1_24m c.weightedtotalscore##post, fe vce(cluster onscode)

	**Model 1.2: Cluster OLS
	regress mmr1_24m i.totalquartile##post, vce(cluster onscode)
	margins totalquartile#post
	marginsplot, xdimension(post)

	**Model 1.3: Cluster with fixed effects (not sure if there is a point in this as total quartile doesn't vary over time)
	xtreg mmr1_24m i.totalquartile##post, fe vce(cluster onscode)
	margins totalquartile#post
	marginsplot, xdimension(post)

	**Model 1.4: With NOMIS Controls

	//(Race (reference to White)) & (reference to Household is not Deprived) Religion (reference to no religion / not answered)
	//dropped asianasianbritishorasianwe due to high vif
	//Need to find time-dependent NOMIS results. Not census data

	regress mmr1_24m i.totalquartile##post blackblackbritishblackwels otherethnicgroup householdisdeprivedinonedim householdisdeprivedinthreed householdisdeprivedinfourdi christian buddhist hindu jewish muslim sikh otherreligion, vce(cluster ons_id)
	estat vif
	**#2 MMR1 at 5 years

	**Model 2.1: Continous Dose
	xtreg mmr1_5y c.weightedtotalscore##post, fe vce(cluster onscode)

	**Model 2.2: Cluster OLS
	regress mmr1_5y i.totalquintile##post, vce(cluster onscode)
	margins totalquintile#post
	marginsplot, xdimension(post)

	**Model 2.3: Cluster with fixed effects
	xtreg mmr1_5y i.totalquintile##post, fe vce(cluster onscode)
	margins totalquintile#post
	marginsplot, xdimension(post)

	**Model 2.4: With NOMIS Controls
	regress mmr1_5y i.totalquintile##post asianasianbritishorasianwe blackblackbritishblackwels mixedormultipleethnicgroups otherethnicgroup householdisdeprivedinonedim householdisdeprivedintwodim householdisdeprivedinthreed householdisdeprivedinfourdi christian buddhist hindu jewish muslim sikh otherreligion, vce(cluster onscode)
	estat vif


**#3 MMR2 at 5 years

	**Model 3.1: Continous Dose
	xtreg mmr2_5y c.weightedtotalscore##post, fe vce(cluster onscode)

	**Model 3.2: Cluster OLS
	regress mmr2_5y i.totalquintile##post, vce(cluster onscode)
	margins totalquintile#post
	marginsplot, xdimension(post)

	**Model 3.3: Cluster with fixed effects
	xtreg mmr2_5y i.totalquintile##post, fe vce(cluster onscode)
	margins totalquintile#post
	marginsplot, xdimension(post)

	**Model 3.4: With NOMIS Controls
	regress mmr2_5y i.totalquintile##post asianasianbritishorasianwe blackblackbritishblackwels mixedormultipleethnicgroups otherethnicgroup householdisdeprivedinonedim householdisdeprivedintwodim householdisdeprivedinthreed householdisdeprivedinfourdi christian buddhist hindu jewish muslim sikh otherreligion, vce(cluster onscode)
	estat vif

//Saving
cd "C:\Users\25943553\OneDrive - MMU\03 DISSERTATION\STATA\DiD"
!git pull
!git add .
!git commit -m "DiD by Quintile"
!git push -u origin main	