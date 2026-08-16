
use "https://raw.githubusercontent.com/jubo-git/Project/main/2.%20data_clean/full_dataset.dta", clear



**# EVENT STUDIES — grouped by outcome variable

	**# 0.1 Define Panel Structure 
	xtset ons_id year
	
**# dtp_12m
	xtreg dtp_12m c.total_tier##ib2019.year, fe vce(cluster onscode)

**# dtp_24m
	xtreg dtp_24m c.total_tier##ib2019.year, fe vce(cluster onscode)


**# mmr1_24m
	//reg mmr1_24m c.total_days_tier##ib2019.year, vce(cluster onscode)
	xtreg mmr1_24m c.total_tier##ib2019.year, fe vce(cluster onscode)

**# dtp_5y
	xtreg dtp_5y c.total_tier##ib2019.year, fe vce(cluster onscode)


**# dtp_boost_5y
	xtreg dtp_boost_5y c.total_tier##ib2019.year, fe vce(cluster onscode)


**# mmr1_5y
	xtreg mmr1_5y c.total_tier##ib2019.year, fe vce(cluster onscode)

**# mmr2_5y
	xtreg mmr2_5y c.total_tier##ib2019.year, fe vce(cluster onscode)



**# PARALLEL PLOTS BY QUINTILE — grouped by outcome variable


**# dtp_12m
	* Tier Quintile (Policy)
	bysort tierquintile year: egen mean_tier_dtp12m = mean(dtp_12m)
	twoway (line mean_tier_dtp12m year if tierquintile==1, sort) ///
		   (line mean_tier_dtp12m year if tierquintile==2, sort) ///
		   (line mean_tier_dtp12m year if tierquintile==3, sort) ///
		   (line mean_tier_dtp12m year if tierquintile==4, sort) ///
		   (line mean_tier_dtp12m year if tierquintile==5, sort), ///
		   legend(label(1 "Q1 (Lowest Restrictions)") label(2 "Q2") label(3 "Q3") label(4 "Q4") label(5 "Q5 (Highest Restrictions)")) ///
		   xline(2020.9) xlabel(2014(1)2025) ///
		   title("DTP1 at 12 months rates by Tier Severity")

	* Retail Quintile (Complacency)
	bysort retail_quintile year: egen mean_retail_dtp12m = mean(dtp_12m)
	twoway (line mean_retail_dtp12m year if retail_quintile==1, sort) ///
		   (line mean_retail_dtp12m year if retail_quintile==2, sort) ///
		   (line mean_retail_dtp12m year if retail_quintile==3, sort) ///
		   (line mean_retail_dtp12m year if retail_quintile==4, sort) ///
		   (line mean_retail_dtp12m year if retail_quintile==5, sort), ///
		   legend(label(1 "Q1 (Lowest)") label(2 "Q2") label(3 "Q3") label(4 "Q4") label(5 "Q5 (Highest)")) ///
		   xline(2020.9) xlabel(2014(1)2025) ///
		   title("DTP1 at 12 months rates by Retail Complacency")

**# dtp_24m
	bysort tierquintile year: egen mean_tier_dtp24m = mean(dtp_24m)
	twoway (line mean_tier_dtp24m year if tierquintile==1, sort) ///
		   (line mean_tier_dtp24m year if tierquintile==2, sort) ///
		   (line mean_tier_dtp24m year if tierquintile==3, sort) ///
		   (line mean_tier_dtp24m year if tierquintile==4, sort) ///
		   (line mean_tier_dtp24m year if tierquintile==5, sort), ///
		   legend(label(1 "Q1 (Lowest Restrictions)") label(2 "Q2") label(3 "Q3") label(4 "Q4") label(5 "Q5 (Highest Restrictions)")) ///
		   xline(2020.9) xlabel(2014(1)2025) ///
		   title("DTP1 at 24 months rates by Tier Severity")

	bysort retail_quintile year: egen mean_retail_dtp24m = mean(dtp_24m)
	twoway (line mean_retail_dtp24m year if retail_quintile==1, sort) ///
		   (line mean_retail_dtp24m year if retail_quintile==2, sort) ///
		   (line mean_retail_dtp24m year if retail_quintile==3, sort) ///
		   (line mean_retail_dtp24m year if retail_quintile==4, sort) ///
		   (line mean_retail_dtp24m year if retail_quintile==5, sort), ///
		   legend(label(1 "Q1 (Lowest)") label(2 "Q2") label(3 "Q3") label(4 "Q4") label(5 "Q5 (Highest)")) ///
		   xline(2020.9) xlabel(2014(1)2025) ///
		   title("DTP1 at 24 months rates by Retail Complacency")

**# mmr1_24m
	bysort tierquintile year: egen mean_tier_mmr24m = mean(mmr1_24m)
	twoway (line mean_tier_mmr24m year if tierquintile==1, sort) ///
		   (line mean_tier_mmr24m year if tierquintile==2, sort) ///
		   (line mean_tier_mmr24m year if tierquintile==3, sort) ///
		   (line mean_tier_mmr24m year if tierquintile==4, sort) ///
		   (line mean_tier_mmr24m year if tierquintile==5, sort), ///
		   legend(label(1 "Q1 (Lowest Restrictions)") label(2 "Q2") label(3 "Q3") label(4 "Q4") label(5 "Q5 (Highest Restrictions)")) ///
		   xline(2020.9) xlabel(2014(1)2025) ///
		   title("MMR1 at 24 months rates by Tier Severity")

	bysort retail_quintile year: egen mean_retail_mmr24m = mean(mmr1_24m)
	twoway (line mean_retail_mmr24m year if retail_quintile==1, sort) ///
		   (line mean_retail_mmr24m year if retail_quintile==2, sort) ///
		   (line mean_retail_mmr24m year if retail_quintile==3, sort) ///
		   (line mean_retail_mmr24m year if retail_quintile==4, sort) ///
		   (line mean_retail_mmr24m year if retail_quintile==5, sort), ///
		   legend(label(1 "Q1 (Lowest)") label(2 "Q2") label(3 "Q3") label(4 "Q4") label(5 "Q5 (Highest)")) ///
		   xline(2020.9) xlabel(2014(1)2025) ///
		   title("MMR1 at 24 months rates by Retail Complacency")

**# dtp_5y
	bysort tierquintile year: egen mean_tier_dtp5y = mean(dtp_5y)
	twoway (line mean_tier_dtp5y year if tierquintile==1, sort) ///
		   (line mean_tier_dtp5y year if tierquintile==2, sort) ///
		   (line mean_tier_dtp5y year if tierquintile==3, sort) ///
		   (line mean_tier_dtp5y year if tierquintile==4, sort) ///
		   (line mean_tier_dtp5y year if tierquintile==5, sort), ///
		   legend(label(1 "Q1 (Lowest Restrictions)") label(2 "Q2") label(3 "Q3") label(4 "Q4") label(5 "Q5 (Highest Restrictions)")) ///
		   xline(2020.9) xlabel(2014(1)2025) ///
		   title("DTP1 at 5 years rates by Tier Severity")

	bysort retail_quintile year: egen mean_retail_dtp5y = mean(dtp_5y)
	twoway (line mean_retail_dtp5y year if retail_quintile==1, sort) ///
		   (line mean_retail_dtp5y year if retail_quintile==2, sort) ///
		   (line mean_retail_dtp5y year if retail_quintile==3, sort) ///
		   (line mean_retail_dtp5y year if retail_quintile==4, sort) ///
		   (line mean_retail_dtp5y year if retail_quintile==5, sort), ///
		   legend(label(1 "Q1 (Lowest)") label(2 "Q2") label(3 "Q3") label(4 "Q4") label(5 "Q5 (Highest)")) ///
		   xline(2020.9) xlabel(2014(1)2025) ///
		   title("DTP1 at 5 years rates by Retail Complacency")

**# dtp_boost_5y
	bysort tierquintile year: egen mean_tier_dtpboost5y = mean(dtp_boost_5y)
	twoway (line mean_tier_dtpboost5y year if tierquintile==1, sort) ///
		   (line mean_tier_dtpboost5y year if tierquintile==2, sort) ///
		   (line mean_tier_dtpboost5y year if tierquintile==3, sort) ///
		   (line mean_tier_dtpboost5y year if tierquintile==4, sort) ///
		   (line mean_tier_dtpboost5y year if tierquintile==5, sort), ///
		   legend(label(1 "Q1 (Lowest Restrictions)") label(2 "Q2") label(3 "Q3") label(4 "Q4") label(5 "Q5 (Highest Restrictions)")) ///
		   xline(2020.9) xlabel(2014(1)2025) ///
		   title("DTP Booster at 5 years rates by Tier Severity")

	bysort retail_quintile year: egen mean_retail_dtpboost5y = mean(dtp_boost_5y)
	twoway (line mean_retail_dtpboost5y year if retail_quintile==1, sort) ///
		   (line mean_retail_dtpboost5y year if retail_quintile==2, sort) ///
		   (line mean_retail_dtpboost5y year if retail_quintile==3, sort) ///
		   (line mean_retail_dtpboost5y year if retail_quintile==4, sort) ///
		   (line mean_retail_dtpboost5y year if retail_quintile==5, sort), ///
		   legend(label(1 "Q1 (Lowest)") label(2 "Q2") label(3 "Q3") label(4 "Q4") label(5 "Q5 (Highest)")) ///
		   xline(2020.9) xlabel(2014(1)2025) ///
		   title("DTP Booster at 5 years rates by Retail Complacency")

**# mmr1_5y
	bysort tierquintile year: egen mean_tier_mmr15y = mean(mmr1_5y)
	twoway (line mean_tier_mmr15y year if tierquintile==1, sort) ///
		   (line mean_tier_mmr15y year if tierquintile==2, sort) ///
		   (line mean_tier_mmr15y year if tierquintile==3, sort) ///
		   (line mean_tier_mmr15y year if tierquintile==4, sort) ///
		   (line mean_tier_mmr15y year if tierquintile==5, sort), ///
		   legend(label(1 "Q1 (Lowest Restrictions)") label(2 "Q2") label(3 "Q3") label(4 "Q4") label(5 "Q5 (Highest Restrictions)")) ///
		   xline(2020.9) xlabel(2014(1)2025) ///
		   title("MMR1 at 5 years rates by Tier Severity")

	bysort retail_quintile year: egen mean_retail_mmr15y = mean(mmr1_5y)
	twoway (line mean_retail_mmr15y year if retail_quintile==1, sort) ///
		   (line mean_retail_mmr15y year if retail_quintile==2, sort) ///
		   (line mean_retail_mmr15y year if retail_quintile==3, sort) ///
		   (line mean_retail_mmr15y year if retail_quintile==4, sort) ///
		   (line mean_retail_mmr15y year if retail_quintile==5, sort), ///
		   legend(label(1 "Q1 (Lowest)") label(2 "Q2") label(3 "Q3") label(4 "Q4") label(5 "Q5 (Highest)")) ///
		   xline(2020.9) xlabel(2014(1)2025) ///
		   title("MMR1 at 5 years rates by Retail Complacency")

**# mmr2_5y
	bysort tierquintile year: egen mean_tier_mmr25y = mean(mmr2_5y)
	twoway (line mean_tier_mmr25y year if tierquintile==1, sort) ///
		   (line mean_tier_mmr25y year if tierquintile==2, sort) ///
		   (line mean_tier_mmr25y year if tierquintile==3, sort) ///
		   (line mean_tier_mmr25y year if tierquintile==4, sort) ///
		   (line mean_tier_mmr25y year if tierquintile==5, sort), ///
		   legend(label(1 "Q1 (Lowest Restrictions)") label(2 "Q2") label(3 "Q3") label(4 "Q4") label(5 "Q5 (Highest Restrictions)")) ///
		   xline(2020.9) xlabel(2014(1)2025) ///
		   title("MMR2 at 5 years rates by Tier Severity")

	bysort retail_quintile year: egen mean_retail_mmr25y = mean(mmr2_5y)
	twoway (line mean_retail_mmr25y year if retail_quintile==1, sort) ///
		   (line mean_retail_mmr25y year if retail_quintile==2, sort) ///
		   (line mean_retail_mmr25y year if retail_quintile==3, sort) ///
		   (line mean_retail_mmr25y year if retail_quintile==4, sort) ///
		   (line mean_retail_mmr25y year if retail_quintile==5, sort), ///
		   legend(label(1 "Q1 (Lowest)") label(2 "Q2") label(3 "Q3") label(4 "Q4") label(5 "Q5 (Highest)")) ///
		   xline(2020.9) xlabel(2014(1)2025) ///
		   title("MMR2 at 5 years rates by Retail Complacency")