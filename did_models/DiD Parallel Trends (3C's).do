**#0 GitHub Setup
use "https://raw.githubusercontent.com/jubo-git/Project/main/data_clean/Lockdown_MMR_NOMIS.dta", clear

//use "https://raw.githubusercontent.com/jubo-git/Project/main/data_clean/Lockdown_MMR_NOMIS_NO_LONDON.dta"

**#0 GitHub Setup
use "https://raw.githubusercontent.com/jubo-git/Project/main/data_clean/Lockdown_MMR_NOMIS.dta", clear

//use "https://raw.githubusercontent.com/jubo-git/Project/main/data_clean/Lockdown_MMR_NOMIS_NO_LONDON.dta"

**# mmr1_24m

	* Tier A Quintile
	bysort tieraquintile year: egen mean_tiera_mmr24m = mean(mmr1_24m)
	
		*Plot of MMR Rates at 24 months: from 2014 - 2025 by Tier A Severity
		
		twoway (line mean_tiera_mmr24m year if tieraquintile==1, sort) ///
			   (line mean_tiera_mmr24m year if tieraquintile==2, sort) ///
			   (line mean_tiera_mmr24m year if tieraquintile==3, sort) ///
			   (line mean_tiera_mmr24m year if tieraquintile==4, sort) ///
			   (line mean_tiera_mmr24m year if tieraquintile==5, sort), ///
			   legend(label(1 "Q1 (Lowest Tier A Restriction)") label(2 "Q2") label(3 "Q3") label(4 "Q4") label(5 "Q5 (Highest Tier A Restriction)")) ///
			   xline(2020.9) xlabel(2014(1)2025) ///
			   title("MMR1 at 24 months rates by Tier A Severity")

		*Event Study 
		
		reg mmr1_24m c.tierdays_a##ib2019.year, vce(cluster onscode)
			   
	* Tier B Quintile
		bysort tierbquintile year: egen mean_tierb_mmr24m = mean(mmr1_24m)
		twoway (line mean_tierb_mmr24m year if tierbquintile==1, sort) ///
			   (line mean_tierb_mmr24m year if tierbquintile==2, sort) ///
			   (line mean_tierb_mmr24m year if tierbquintile==3, sort) ///
			   (line mean_tierb_mmr24m year if tierbquintile==4, sort) ///
			   (line mean_tierb_mmr24m year if tierbquintile==5, sort), ///
			   legend(label(1 "Q1 (Lowest Tier B Restriction )") label(2 "Q2") label(3 "Q3") label(4 "Q4") label(5 "Q5 (Highest Tier B Restriction)")) ///
			   xline(2020.9) xlabel(2014(1)2025) ///
			   title("MMR1 at 24 months rates by Tier B Severity")

		*Event Study
		
		reg mmr1_24m c.tierdays_b##ib2019.year, vce(cluster onscode)

	* Complacency Quintile
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

	* Tier A Quintile
		bysort tieraquintile year: egen mean_tiera_mmr1_5y = mean(mmr1_5y)
		twoway (line mean_tiera_mmr1_5y year if tieraquintile==1, sort) ///
			   (line mean_tiera_mmr1_5y year if tieraquintile==2, sort) ///
			   (line mean_tiera_mmr1_5y year if tieraquintile==3, sort) ///
			   (line mean_tiera_mmr1_5y year if tieraquintile==4, sort) ///
			   (line mean_tiera_mmr1_5y year if tieraquintile==5, sort), ///
			   legend(label(1 "Q1 (Lowest)") label(2 "Q2") label(3 "Q3") label(4 "Q4") label(5 "Q5 (Highest)")) ///
			   xline(2020.9) xlabel(2014(1)2025) ///
			   title("MMR1 at 5 years rates by Tier A Severity")

		*Event Study
		
		reg mmr1_5y c.tierdays_a##ib2019.year, vce(cluster onscode)

	* Tier B Quintile
		bysort tierbquintile year: egen mean_tierb_mmr1_5y = mean(mmr1_5y)
		twoway (line mean_tierb_mmr1_5y year if tierbquintile==1, sort) ///
			   (line mean_tierb_mmr1_5y year if tierbquintile==2, sort) ///
			   (line mean_tierb_mmr1_5y year if tierbquintile==3, sort) ///
			   (line mean_tierb_mmr1_5y year if tierbquintile==4, sort) ///
			   (line mean_tierb_mmr1_5y year if tierbquintile==5, sort), ///
			   legend(label(1 "Q1 (Lowest)") label(2 "Q2") label(3 "Q3") label(4 "Q4") label(5 "Q5 (Highest)")) ///
			   xline(2020.9) xlabel(2014(1)2025) ///
			   title("MMR1 at 5 years rates by Tier B Severity")

		*Event Study
		
		reg mmr1_5y c.tierdays_b##ib2019.year, vce(cluster onscode)

	* Complacency Quintile
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

	* Tier A Quintile 
		bysort tieraquintile year: egen mean_tiera_mmr2_5y = mean(mmr2_5y)
		twoway (line mean_tiera_mmr2_5y year if tieraquintile==1, sort) ///
			   (line mean_tiera_mmr2_5y year if tieraquintile==2, sort) ///
			   (line mean_tiera_mmr2_5y year if tieraquintile==3, sort) ///
			   (line mean_tiera_mmr2_5y year if tieraquintile==4, sort) ///
			   (line mean_tiera_mmr2_5y year if tieraquintile==5, sort), ///
			   legend(label(1 "Q1 (Lowest)") label(2 "Q2") label(3 "Q3") label(4 "Q4") label(5 "Q5 (Highest)")) ///
			   xline(2020.9) xlabel(2014(1)2025) ///
			   title("MMR2 at 5 years rates by Tier A Severity")

		*Event Study
		
		reg mmr2_5y c.tierdays_a##ib2019.year, vce(cluster onscode)

	* Tier B Quintile
		bysort tierbquintile year: egen mean_tierb_mmr2_5y = mean(mmr2_5y)
		twoway (line mean_tierb_mmr2_5y year if tierbquintile==1, sort) ///
			   (line mean_tierb_mmr2_5y year if tierbquintile==2, sort) ///
			   (line mean_tierb_mmr2_5y year if tierbquintile==3, sort) ///
			   (line mean_tierb_mmr2_5y year if tierbquintile==4, sort) ///
			   (line mean_tierb_mmr2_5y year if tierbquintile==5, sort), ///
			   legend(label(1 "Q1 (Lowest)") label(2 "Q2") label(3 "Q3") label(4 "Q4") label(5 "Q5 (Highest)")) ///
			   xline(2020.9) xlabel(2014(1)2025) ///
			   title("MMR2 at 5 years rates by Tier B Severity")

		*Event Study
		
		reg mmr2_5y c.tierdays_b##ib2019.year, vce(cluster onscode)

	* Complacency Quintile
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
!git commit -m "Parallel Trends Do-File (for 3C's)"
!git push -u origin main
