**#0 GitHub Setup
use "https://raw.githubusercontent.com/jubo-git/Project/main/data_clean/Lockdown_MMR_NOMIS.dta"

**#Parallel Trends 
 
 *mmr1_24m
	* Quintile
		bysort totalquintile year: egen mean_q5_mmr24m = mean(mmr1_24m)

		twoway (line mean_q5_mmr24m year if totalquintile==1) ///
			   (line mean_q5_mmr24m year if totalquintile==2) ///
			   (line mean_q5_mmr24m year if totalquintile==3) ///
			   (line mean_q5_mmr24m year if totalquintile==4) ///
			   (line mean_q5_mmr24m year if totalquintile==5), ///
			   legend(label(1 "Q1 (Lowest)") label(2 "Q2") label(3 "Q3") label(4 "Q4") label(5 "Q5 (Highest)")) ///
			   xline(2020.9) xlabel(2014(1)2025) ///
			   title("MMR1 at 24 months rates by lockdown exposure quintile")

	* Quartile
		bysort totalquartile year: egen mean_q4_mmr24m = mean(mmr1_24m)

		twoway (line mean_q4_mmr24m year if totalquartile==1) ///
			   (line mean_q4_mmr24m year if totalquartile==2) ///
			   (line mean_q4_mmr24m year if totalquartile==3) ///
			   (line mean_q4_mmr24m year if totalquartile==4), ///
			   legend(label(1 "Q1 (Lowest)") label(2 "Q2") label(3 "Q3") label(4 "Q4 (Highest)")) ///
			   xline(2020.9) xlabel(2014(1)2025) ///
			   title("MMR1 at 24 months rates by lockdown exposure quartile")
	
*mmr1_5y
	*quintile
		bysort totalquintile year: egen mean_q5_mmr1_5y = mean(mmr1_5y)

		twoway (line mean_q5_mmr1_5y year if totalquintile==1) ///
		   (line mean_q5_mmr1_5y year if totalquintile==2) ///
		   (line mean_q5_mmr1_5y year if totalquintile==3) ///
		   (line mean_q5_mmr1_5y year if totalquintile==4) ///
		   (line mean_q5_mmr1_5y year if totalquintile==5), ///
		   legend(label(1 "Q1 (Lowest)") label(2 "Q2") label(3 "Q3") label(4 "Q4") label(5 "Q5 (Highest)")) ///
		   xline(2020.9) xlabel(2014(1)2025) ///
		   title("MMR1 at 5 years rates by lockdown exposure quintile")

	*quartile
		bysort totalquartile year: egen mean_q4_mmr1_5y = mean(mmr1_5y)

		twoway (line mean_q4_mmr1_5y year if totalquartile==1) ///
			   (line mean_q4_mmr1_5y year if totalquartile==2) ///
			   (line mean_q4_mmr1_5y year if totalquartile==3) ///
			   (line mean_q4_mmr1_5y year if totalquartile==4), ///
			   legend(label(1 "Q1 (Lowest)") label(2 "Q2") label(3 "Q3") label(4 "Q4 (Highest)")) ///
			   xline(2020.9) xlabel(2014(1)2025) ///
			   title("MMR1 at 5 years rates by lockdown exposure quartile")
*mmr2_5y
	*quintile 
		bysort totalquintile year: egen mean_q5_mmr2_5y = mean(mmr2_5y)

		twoway (line mean_q5_mmr2_5y year if totalquintile==1) ///
		   (line mean_q5_mmr2_5y year if totalquintile==2) ///
		   (line mean_q5_mmr2_5y year if totalquintile==3) ///
		   (line mean_q5_mmr2_5y year if totalquintile==4) ///
		   (line mean_q5_mmr2_5y year if totalquintile==5), ///
		   legend(label(1 "Q1 (Lowest)") label(2 "Q2") label(3 "Q3") label(4 "Q4") label(5 "Q5 (Highest)")) ///
		   xline(2020.9) xlabel(2014(1)2025) ///
		   title("MMR2 at 5 years rates by lockdown exposure quintile")

	*quartile
		bysort totalquartile year: egen mean_q4_mmr2_5y = mean(mmr2_5y)

		twoway (line mean_q4_mmr2_5y year if totalquartile==1) ///
			   (line mean_q4_mmr2_5y year if totalquartile==2) ///
			   (line mean_q4_mmr2_5y year if totalquartile==3) ///
			   (line mean_q4_mmr2_5y year if totalquartile==4), ///
			   legend(label(1 "Q1 (Lowest)") label(2 "Q2") label(3 "Q3") label(4 "Q4 (Highest)")) ///
			   xline(2020.9) xlabel(2014(1)2025) ///
			   title("MMR2 at 5 years rates by lockdown exposure quartile")


