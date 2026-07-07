**#0 Directory and GitHub Setup
cd "/Users/25943553/Library/CloudStorage/OneDrive-MMU/03 DISSERTATION/STATA/DiD"

use "https://raw.githubusercontent.com/jubo-git/Project/main/data_clean/Lockdown_MMR_NOMIS.dta", clear
//use "https://raw.githubusercontent.com/jubo-git/Project/main/data_clean/Lockdown_MMR_NOMIS_NO_LONDON.dta"


**#1 Annual Aggregation & Intensity Scaling
* Create a single daily tier scale variable from Phase A and Phase B
gen daily_tier = 0
replace daily_tier = tiera if !missing(tiera)
replace daily_tier = tierb if !missing(tierb)

* Collapse 366 daily rows down to 1 annual row per Local Authority
* This properly turns duration * intensity into a total annual exposure score
collapse (sum) annual_policy_burden = daily_tier ///
         (sum) total_retail = retailshut ///
         (mean) mmr1_24m mmr1_5y mmr2_5y, by(onscode laname regioncode year)

* Construct true annual quintiles on the collapsed data
xtile tier_combined_quintile = annual_policy_burden, nquantiles(5)
xtile complacency_quintile = total_retail, nquantiles(5)


**# mmr1_24m

	* Combined Tier Quintile (Policy)
	bysort tier_combined_quintile year: egen mean_tier_mmr24m = mean(mmr1_24m)
	
		*Plot of MMR Rates at 24 months by Combined Tier Severity
		twoway (line mean_tier_mmr24m year if tier_combined_quintile==1, sort) ///
			   (line mean_tier_mmr24m year if tier_combined_quintile==2, sort) ///
			   (line mean_tier_mmr24m year if tier_combined_quintile==3, sort) ///
			   (line mean_tier_mmr24m year if tier_combined_quintile==4, sort) ///
			   (line mean_tier_mmr24m year if tier_combined_quintile==5, sort), ///
			   legend(label(1 "Q1 (Lowest Restrictions)") label(2 "Q2") label(3 "Q3") label(4 "Q4") label(5 "Q5 (Highest Restrictions)")) ///
			   xline(2020.9) xlabel(2014(1)2025) ///
			   title("MMR1 at 24 months rates by Combined Tier Severity")

		*Event Study (using continuous annual intensity score)
		reg mmr1_24m c.annual_policy_burden##ib2019.year, vce(cluster onscode)
			   
	* Complacency Quintile (Behavior)
		bysort complacency_quintile year: egen mean_complacency_mmr24m = mean(mmr1_24m)
		
		twoway (line mean_complacency_mmr24m year if complacency_quintile==1, sort) ///
			   (line mean_complacency_mmr24m year if complacency_quintile==2, sort) ///
			   (line mean_complacency_mmr24m year if complacency_quintile==3, sort) ///
			   (line mean_complacency_mmr24m year if complacency_quintile==4, sort) ///
			   (line mean_complacency_mmr24m year if complacency_quintile==5, sort), ///
			   legend(label(1 "Q1 (Lowest)") label(2 "Q2") label(3 "Q3") label(4 "Q4") label(5 "Q5 (Highest)")) ///
			   xline(2020.9) xlabel(2014(1)2025) ///
			   title("MMR1 at 24 months rates by Complacency")

		*Event Study
		reg mmr1_24m c.total_retail##ib2019.year, vce(cluster onscode)


**# mmr1_5y

	* Combined Tier Quintile (Policy)
		bysort tier_combined_quintile year: egen mean_tier_mmr1_5y = mean(mmr1_5y)
		
		twoway (line mean_tier_mmr1_5y year if tier_combined_quintile==1, sort) ///
			   (line mean_tier_mmr1_5y year if tier_combined_quintile==2, sort) ///
			   (line mean_tier_mmr1_5y year if tier_combined_quintile==3, sort) ///
			   (line mean_tier_mmr1_5y year if tier_combined_quintile==4, sort) ///
			   (line mean_tier_mmr1_5y year if tier_combined_quintile==5, sort), ///
			   legend(label(1 "Q1 (Lowest)") label(2 "Q2") label(3 "Q3") label(4 "Q4") label(5 "Q5 (Highest)")) ///
			   xline(2020.9) xlabel(2014(1)2025) ///
			   title("MMR1 at 5 years rates by Combined Tier Severity")

		*Event Study
		reg mmr1_5y c.annual_policy_burden##ib2019.year, vce(cluster onscode)

	* Complacency Quintile (Behavior)
		bysort complacency_quintile year: egen mean_complacency_mmr1_5y = mean(mmr1_5y)
		
		twoway (line mean_complacency_mmr1_5y year if complacency_quintile==1, sort) ///
			   (line mean_complacency_mmr1_5y year if complacency_quintile==2, sort) ///
			   (line mean_complacency_mmr1_5y year if complacency_quintile==3, sort) ///
			   (line mean_complacency_mmr1_5y year if complacency_quintile==4, sort) ///
			   (line mean_complacency_mmr1_5y year if complacency_quintile==5, sort), ///
			   legend(label(1 "Q1 (Lowest)") label(2 "Q2") label(3 "Q3") label(4 "Q4") label(5 "Q5 (Highest)")) ///
			   xline(2020.9) xlabel(2014(1)2025) ///
			   title("MMR1 at 5 years rates by Complacency")

		*Event Study
		reg mmr1_5y c.total_retail##ib2019.year, vce(cluster onscode)


**# mmr2_5y

	* Combined Tier Quintile (Policy)
		bysort tier_combined_quintile year: egen mean_tier_mmr2_5y = mean(mmr2_5y)
		
		twoway (line mean_tier_mmr2_5y year if tier_combined_quintile==1, sort) ///
			   (line mean_tier_mmr2_5y year if tier_combined_quintile==2, sort) ///
			   (line mean_tier_mmr2_5y year if tier_combined_quintile==3, sort) ///
			   (line mean_tier_mmr2_5y year if tier_combined_quintile==4, sort) ///
			   (line mean_tier_mmr2_5y year if tier_combined_quintile==5, sort), ///
			   legend(label(1 "Q1 (Lowest)") label(2 "Q2") label(3 "Q3") label(4 "Q4") label(5 "Q5 (Highest)")) ///
			   xline(2020.9) xlabel(2014(1)2025) ///
			   title("MMR2 at 5 years rates by Combined Tier Severity")

		*Event Study
		reg mmr2_5y c.annual_policy_burden##ib2019.year, vce(cluster onscode)

	* Complacency Quintile (Behavior)
		bysort complacency_quintile year: egen mean_complacency_mmr2_5y = mean(mmr2_5y)
		
		twoway (line mean_complacency_mmr2_5y year if complacency_quintile==1, sort) ///
			   (line mean_complacency_mmr2_5y year if complacency_quintile==2, sort) ///
			   (line mean_complacency_mmr2_5y year if complacency_quintile==3, sort) ///
			   (line mean_complacency_mmr2_5y year if complacency_quintile==4, sort) ///
			   (line mean_complacency_mmr2_5y year if complacency_quintile==5, sort), ///
			   legend(label(1 "Q1 (Lowest)") label(2 "Q2") label(3 "Q3") label(4 "Q4") label(5 "Q5 (Highest)")) ///
			   xline(2020.9) xlabel(2014(1)2025) ///
			   title("MMR2 at 5 years rates by Complacency")

		*Event Study
		reg mmr2_5y c.total_retail##ib2019.year, vce(cluster onscode)


//Saving
!git add .
!git commit -m "Parallel Trends Do-File (Cleaned Combined Tiers)"
!git push -u origin main
