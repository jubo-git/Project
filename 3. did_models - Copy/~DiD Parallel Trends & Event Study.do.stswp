use "https://raw.githubusercontent.com/jubo-git/Project/main/2.%20data_clean/full_dataset.dta", clear
xtset ons_id year


* 2. EVENT STUDIES BY OUTCOME VARIABLE (Base Year = 2020)
xtreg dtp_12m ib2019.year##c.total_tier, ///
    fe vce(cluster onscode)


**# dtp_24m
xtreg dtp_24m ib2019.year##c.total_tier, ///
    fe vce(cluster onscode)


**# mmr1_24m
xtreg mmr1_24m ib2019.year##c.total_tier, ///
    fe vce(cluster onscode)

**# dtp_5y
xtreg dtp_5y ib2019.year##c.total_tier, ///
    fe vce(cluster onscode)

**# dtp_boost_5y
xtreg dtp_boost_5y ib2019.year##c.total_tier, ///
    fe vce(cluster onscode)

**# mmr1_5y
xtreg mmr1_5y ib2019.year##c.total_tier, ///
    fe vce(cluster onscode)

**# mmr2_5y
xtreg mmr2_5y ib2019.year##c.total_tier, ///
    fe vce(cluster onscode)


**# PARALLEL TREND PLOTS BY quartile — Grouped by Outcome Variable
**# dtp_12m
	bysort tier_quartile year: egen mean_tier_dtp12m = mean(dtp_12m)
	twoway (line mean_tier_dtp12m year if tier_quartile==1, sort) ///
		   (line mean_tier_dtp12m year if tier_quartile==2, sort) ///
		   (line mean_tier_dtp12m year if tier_quartile==3, sort) ///
		   (line mean_tier_dtp12m year if tier_quartile==4, sort), ///
		   legend(label(1 "Q1 (Lowest Restrictions)") label(2 "Q2") label(3 "Q3") label(4 "Q4") label(5 "Q5 (Highest Restrictions)")) ///
		   xline(2020) xlabel(2014(1)2025) ///
		   title("DTP at 12 Months Coverage Rates by Tier Severity") ///
		   name(g_dtp12m, replace)

**# dtp_24m
	bysort tier_quartile year: egen mean_tier_dtp24m = mean(dtp_24m)
	twoway (line mean_tier_dtp24m year if tier_quartile==1, sort) ///
		   (line mean_tier_dtp24m year if tier_quartile==2, sort) ///
		   (line mean_tier_dtp24m year if tier_quartile==3, sort) ///
		   (line mean_tier_dtp24m year if tier_quartile==4, sort), ///
		   legend(label(1 "Q1 (Lowest Restrictions)") label(2 "Q2") label(3 "Q3") label(4 "Q4") label(5 "Q5 (Highest Restrictions)")) ///
		   xline(2020) xlabel(2014(1)2025) ///
		   title("DTP at 24 Months Coverage Rates by Tier Severity") ///
		   name(g_dtp24m, replace)

**# mmr1_24m
	bysort tier_quartile year: egen mean_tier_mmr24m = mean(mmr1_24m)
	twoway (line mean_tier_mmr24m year if tier_quartile==1, sort) ///
		   (line mean_tier_mmr24m year if tier_quartile==2, sort) ///
		   (line mean_tier_mmr24m year if tier_quartile==3, sort) ///
		   (line mean_tier_mmr24m year if tier_quartile==4, sort), ///
		   legend(label(1 "Q1 (Lowest Restrictions)") label(2 "Q2") label(3 "Q3") label(4 "Q4") label(5 "Q5 (Highest Restrictions)")) ///
		   xline(2020) xlabel(2014(1)2025) ///
		   title("MMR1 at 24 Months Coverage Rates by Tier Severity") ///
		   name(g_mmr1_24m, replace)

**# dtp_5y
	bysort tier_quartile year: egen mean_tier_dtp5y = mean(dtp_5y)
	twoway (line mean_tier_dtp5y year if tier_quartile==1, sort) ///
		   (line mean_tier_dtp5y year if tier_quartile==2, sort) ///
		   (line mean_tier_dtp5y year if tier_quartile==3, sort) ///
		   (line mean_tier_dtp5y year if tier_quartile==4, sort), ///
		   legend(label(1 "Q1 (Lowest Restrictions)") label(2 "Q2") label(3 "Q3") label(4 "Q4") label(5 "Q5 (Highest Restrictions)")) ///
		   xline(2020) xlabel(2014(1)2025) ///
		   title("DTP at 5 Years Coverage Rates by Tier Severity") ///
		   name(g_dtp5y, replace)

**# dtp_boost_5y
	bysort tier_quartile year: egen mean_tier_dtpboost5y = mean(dtp_boost_5y)
	twoway (line mean_tier_dtpboost5y year if tier_quartile==1, sort) ///
		   (line mean_tier_dtpboost5y year if tier_quartile==2, sort) ///
		   (line mean_tier_dtpboost5y year if tier_quartile==3, sort) ///
		   (line mean_tier_dtpboost5y year if tier_quartile==4, sort), ///
		   legend(label(1 "Q1 (Lowest Restrictions)") label(2 "Q2") label(3 "Q3") label(4 "Q4") label(5 "Q5 (Highest Restrictions)")) ///
		   xline(2020) xlabel(2014(1)2025) ///
		   title("DTP Booster at 5 Years Coverage Rates by Tier Severity") ///
		   name(g_dtpboost5y, replace)

**# mmr1_5y
	bysort tier_quartile year: egen mean_tier_mmr1_5y = mean(mmr1_5y)
	twoway (line mean_tier_mmr1_5y year if tier_quartile==1, sort) ///
		   (line mean_tier_mmr1_5y year if tier_quartile==2, sort) ///
		   (line mean_tier_mmr1_5y year if tier_quartile==3, sort) ///
		   (line mean_tier_mmr1_5y year if tier_quartile==4, sort), ///
		   legend(label(1 "Q1 (Lowest Restrictions)") label(2 "Q2") label(3 "Q3") label(4 "Q4") label(5 "Q5 (Highest Restrictions)")) ///
		   xline(2020) xlabel(2014(1)2025) ///
		   title("MMR1 at 5 Years Coverage Rates by Tier Severity") ///
		   name(g_mmr1_5y, replace)

**# mmr2_5y
	bysort tier_quartile year: egen mean_tier_mmr2_5y = mean(mmr2_5y)
	twoway (line mean_tier_mmr2_5y year if tier_quartile==1, sort) ///
		   (line mean_tier_mmr2_5y year if tier_quartile==2, sort) ///
		   (line mean_tier_mmr2_5y year if tier_quartile==3, sort) ///
		   (line mean_tier_mmr2_5y year if tier_quartile==4, sort), ///
		   legend(label(1 "Q1 (Lowest Restrictions)") label(2 "Q2") label(3 "Q3") label(4 "Q4") label(5 "Q5 (Highest Restrictions)")) ///
		   xline(2020) xlabel(2014(1)2025) ///
		   title("MMR2 at 5 Years Coverage Rates by Tier Severity") ///
		   name(g_mmr2_5y, replace)


**# COMBINE GRAPHS ACROSS TWO PAGES, WITH SMALLER TEXT FOR LEGIBILITY
	* iscale() shrinks title/legend/axis text and markers relative to the plot
	* box (it does not resize the plot itself). Lower the multiplier further
	* (e.g. *.4) if still too cramped, or raise it (e.g. *.7) if too small.

	**# Page 1 of 2: dtp_12m, dtp_24m, mmr1_24m, dtp_5y
	graph combine g_dtp12m g_dtp24m g_mmr1_24m g_dtp5y, ///
		rows(2) cols(2) ///
		iscale(*.55) ///
		title("Parallel Trends (1 of 2): Vaccination Uptake by Tier Exposure Quartile, 2014-2025") ///
		name(combined_trends_p1, replace)

	* Export as a single file. Use .png for Word, .pdf/.eps for a print-quality dissertation figure.
	graph export "parallel_trends_page1.png", name(combined_trends_p1) width(2400) replace
	* graph export "parallel_trends_page1.pdf", name(combined_trends_p1) replace

	**# Page 2 of 2: dtp_boost_5y, mmr1_5y, mmr2_5y
	graph combine g_dtpboost5y g_mmr1_5y g_mmr2_5y, ///
		rows(2) cols(2) ///
		iscale(*.55) ///
		title("Parallel Trends (2 of 2): Vaccination Uptake by Tier Exposure Quartile, 2014-2025") ///
		name(combined_trends_p2, replace)

	graph export "parallel_trends_page2.png", name(combined_trends_p2) width(2400) replace
	* graph export "parallel_trends_page2.pdf", name(combined_trends_p2) replace
