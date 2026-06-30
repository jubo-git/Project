**#0 GitHub Setup
use "https://raw.githubusercontent.com/jubo-git/Project/main/data_clean/Lockdown_MMR_NOMIS.dta"

**#1 Difference in Difference
encode onscode, gen(ons_id)
gen post = (year >= 2020)

use ESS5GBdiagnostics 
ssc install regcheck	

	**Basic DiD - This is the most basic model (IN THIS CASE). There is not "indivual" vaccine measurements, rather they are aggregated by coverage at the Local Authority level. The variables (NOMIS measures) vary exclusively at this level, there is therefore no mixture of group and invidual data. Therefore the regression model is adjusted for group level serial correlation over time using the vce(cluster onscode function)  
	
	**Model 1: MMR1 at 24 Months
	regress mmr1_24m i.totalquintile##post, vce(cluster onscode)
	margins totalquintile#post
	marginsplot, xdimension(post)
	
		**with Race (reference to White)
		regress mmr1_24m i.totalquintile##post asianasianbritishorasianwe 	blackblackbritishblackwels mixedormultipleethnicgroups otherethnicgroup, vce(cluster onscode) 	
		
		**with Household deprivation  (reference to Household is not Deprived)
		regress mmr1_24m i.totalquintile##post householdisdeprivedinonedim householdisdeprivedintwodim householdisdeprivedinthreed householdisdeprivedinfourdi, vce(cluster onscode)
		
		**with Religion (reference to no religion / not answered)
		regress mmr1_24m i.totalquintile##post christian buddhist 		hindu jewish muslim sikh otherreligion, vce(cluster onscode)
		
		**ALL (?)
		regress mmr1_24m i.totalquintile##post asianasianbritishorasianwe 	blackblackbritishblackwels mixedormultipleethnicgroups otherethnicgroup householdisdeprivedinonedim householdisdeprivedintwodim householdisdeprivedinthreed householdisdeprivedinfourdi christian buddhist 		hindu jewish muslim sikh otherreligion, vce(cluster onscode)
		
		estat vif
		
		//dropped asianasianbritishorasianwe mixedormultipleethnicgroups householdisdeprivedinonedim
		
			regress mmr1_24m i.totalquintile##post 	blackblackbritishblackwels  otherethnicgroup householdisdeprivedinonedim householdisdeprivedinthreed householdisdeprivedinfourdi christian buddhist hindu jewish muslim sikh otherreligion, vce(cluster onscode)
		
		
		
	**mmr1_5y
	regress mmr1_5y i.totalquintile##post, vce(cluster onscode)
	margins totalquintile#post
	marginsplot, xdimension(post)
	
	regress mmr2_5y i.totalquintile##post, vce(cluster onscode)
	margins totalquintile#post
	marginsplot, xdimension(post)

	
	
	**With NOMIS 
	//referene to white, no religion/notanswered, householdisnotdeprivedinany 
	
	* Model 1: MMR1 at 24 Months
	di "--- DiD Regression: MMR1 at 24 Months ---"
	regress mmr1_24m treated post did `nomis_controls', vce(cluster onscode)
	
	regress mmr1_24m i.totalquintile##post asianasianbritishorasianwe blackblackbritishblackwels mixedormultipleethnicgroups otherethnicgroup 	householdisdeprivedinonedim householdisdeprivedintwodim householdisdeprivedinthreed householdisdeprivedinfourdi christian buddhist 		hindu jewish muslim sikh otherreligion , vce(cluster onscode)
	
	estat vif

	//Checking 

	* Model 2: MMR1 at 5 Years
	regress mmr1_5y treated post did asianasianbritishorasianwe blackblackbritishblackwels mixedormultipleethnicgroups otherethnicgroup 	householdisdeprivedinonedim householdisdeprivedintwodim householdisdeprivedinthreed householdisdeprivedinfourdi christian buddhist 		hindu jewish muslim sikh otherreligion , vce(cluster onscode)
	

	* Model 3: MMR2 at 5 Years
	regress mmr2_5y treated post did asianasianbritishorasianwe blackblackbritishblackwels mixedormultipleethnicgroups otherethnicgroup 	householdisdeprivedinonedim householdisdeprivedintwodim householdisdeprivedinthreed householdisdeprivedinfourdi christian buddhist 		hindu jewish muslim sikh otherreligion , vce(cluster onscode)
	
//Saving
!git add .
!git commit -m "DiD"
!git push -u origin main	