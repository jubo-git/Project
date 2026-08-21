use "https://raw.githubusercontent.com/jubo-git/Project/main/2.%20data_clean/full_dataset.dta", clear
xtset ons_id year

**# EVENT STUDIES — Grouped by Outcome Variable (Base Year = 2019)

**# dtp_12m
	xtreg dtp_12m c.total_tier#ib2019.year i.year, fe vce(cluster onscode)

**# dtp_24m
	xtreg dtp_24m c.total_tier#ib2019.year i.year, fe vce(cluster onscode)

**# mmr1_24m
	xtreg mmr1_24m c.total_tier#ib2019.year i.year, fe vce(cluster onscode)

**# dtp_5y
	xtreg dtp_5y c.total_tier#ib2019.year i.year, fe vce(cluster onscode)

**# dtp_boost_5y
	xtreg dtp_boost_5y c.total_tier#ib2019.year i.year, fe vce(cluster onscode)

**# mmr1_5y
	xtreg mmr1_5y c.total_tier#ib2019.year i.year, fe vce(cluster onscode)

**# mmr2_5y
	xtreg mmr2_5y c.total_tier#ib2019.year i.year, fe vce(cluster onscode)


**# PARALLEL TREND PLOTS BY quartile — Grouped by Outcome Variable

**# dtp_12m
	bysort tier_quartile year: egen mean_tier_dtp12m = mean(dtp_12m)
	twoway (line mean_tier_dtp12m year if tier_quartile==1, sort) ///
		   (line mean_tier_dtp12m year if tier_quartile==2, sort) ///
		   (line mean_tier_dtp12m year if tier_quartile==3, sort) ///
		   (line mean_tier_dtp12m year if tier_quartile==4, sort), ///
		   legend(label(1 "Q1 (Lowest Restrictions)") label(2 "Q2") label(3 "Q3") label(4 "Q4") label(5 "Q5 (Highest Restrictions)")) ///
		   xline(2020) xlabel(2014(1)2025) ///
		   title("DTP at 12 Months Coverage Rates by Tier Severity")

**# dtp_24m
	bysort tier_quartile year: egen mean_tier_dtp24m = mean(dtp_24m)
	twoway (line mean_tier_dtp24m year if tier_quartile==1, sort) ///
		   (line mean_tier_dtp24m year if tier_quartile==2, sort) ///
		   (line mean_tier_dtp24m year if tier_quartile==3, sort) ///
		   (line mean_tier_dtp24m year if tier_quartile==4, sort), ///
		   legend(label(1 "Q1 (Lowest Restrictions)") label(2 "Q2") label(3 "Q3") label(4 "Q4") label(5 "Q5 (Highest Restrictions)")) ///
		   xline(2020) xlabel(2014(1)2025) ///
		   title("DTP at 24 Months Coverage Rates by Tier Severity")

**# mmr1_24m
	bysort tier_quartile year: egen mean_tier_mmr24m = mean(mmr1_24m)
	twoway (line mean_tier_mmr24m year if tier_quartile==1, sort) ///
		   (line mean_tier_mmr24m year if tier_quartile==2, sort) ///
		   (line mean_tier_mmr24m year if tier_quartile==3, sort) ///
		   (line mean_tier_mmr24m year if tier_quartile==4, sort), ///
		   legend(label(1 "Q1 (Lowest Restrictions)") label(2 "Q2") label(3 "Q3") label(4 "Q4") label(5 "Q5 (Highest Restrictions)")) ///
		   xline(2020) xlabel(2014(1)2025) ///
		   title("MMR1 at 24 Months Coverage Rates by Tier Severity")

**# dtp_5y
	bysort tier_quartile year: egen mean_tier_dtp5y = mean(dtp_5y)
	twoway (line mean_tier_dtp5y year if tier_quartile==1, sort) ///
		   (line mean_tier_dtp5y year if tier_quartile==2, sort) ///
		   (line mean_tier_dtp5y year if tier_quartile==3, sort) ///
		   (line mean_tier_dtp5y year if tier_quartile==4, sort), ///
		   legend(label(1 "Q1 (Lowest Restrictions)") label(2 "Q2") label(3 "Q3") label(4 "Q4") label(5 "Q5 (Highest Restrictions)")) ///
		   xline(2020) xlabel(2014(1)2025) ///
		   title("DTP at 5 Years Coverage Rates by Tier Severity")

**# dtp_boost_5y
	bysort tier_quartile year: egen mean_tier_dtpboost5y = mean(dtp_boost_5y)
	twoway (line mean_tier_dtpboost5y year if tier_quartile==1, sort) ///
		   (line mean_tier_dtpboost5y year if tier_quartile==2, sort) ///
		   (line mean_tier_dtpboost5y year if tier_quartile==3, sort) ///
		   (line mean_tier_dtpboost5y year if tier_quartile==4, sort), ///
		   legend(label(1 "Q1 (Lowest Restrictions)") label(2 "Q2") label(3 "Q3") label(4 "Q4") label(5 "Q5 (Highest Restrictions)")) ///
		   xline(2020) xlabel(2014(1)2025) ///
		   title("DTP Booster at 5 Years Coverage Rates by Tier Severity")

**# mmr1_5y
	bysort tier_quartile year: egen mean_tier_mmr1_5y = mean(mmr1_5y)
	twoway (line mean_tier_mmr1_5y year if tier_quartile==1, sort) ///
		   (line mean_tier_mmr1_5y year if tier_quartile==2, sort) ///
		   (line mean_tier_mmr1_5y year if tier_quartile==3, sort) ///
		   (line mean_tier_mmr1_5y year if tier_quartile==4, sort), ///
		   legend(label(1 "Q1 (Lowest Restrictions)") label(2 "Q2") label(3 "Q3") label(4 "Q4") label(5 "Q5 (Highest Restrictions)")) ///
		   xline(2020) xlabel(2014(1)2025) ///
		   title("MMR1 at 5 Years Coverage Rates by Tier Severity")

**# mmr2_5y
	bysort tier_quartile year: egen mean_tier_mmr2_5y = mean(mmr2_5y)
	twoway (line mean_tier_mmr2_5y year if tier_quartile==1, sort) ///
		   (line mean_tier_mmr2_5y year if tier_quartile==2, sort) ///
		   (line mean_tier_mmr2_5y year if tier_quartile==3, sort) ///
		   (line mean_tier_mmr2_5y year if tier_quartile==4, sort), ///
		   legend(label(1 "Q1 (Lowest Restrictions)") label(2 "Q2") label(3 "Q3") label(4 "Q4") label(5 "Q5 (Highest Restrictions)")) ///
		   xline(2020) xlabel(2014(1)2025) ///
		   title("MMR2 at 5 Years Coverage Rates by Tier Severity")