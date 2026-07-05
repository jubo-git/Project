**# Bookmark #1 Import 
//importing vaccine data 
import excel "C:\Users\44799\OneDrive - MMU\03 DISSERTATION\DATASETS\Combining MMR and Lockdown Score.xlsx", sheet("Raw MMR Dataset") firstrow

**# Bookmark #2
//tidying 
rename *, lower
label variable mmr2_5y "MMR2 % of Children at 5 years"
label variable mmr1_5y "MMR1 % of Children at 5 years"
label variable mmr1_24m "MMR1 % of Children at 2 years"

//Although there are boundary changes - the UK goverment maintains time-series data for all the combined authorties. Therefore the most up-to-date ONS code is backdated for consistency

	//Bournemouth, Christchurch and Poole: 2014 - 2019 Bournemouth (E06000028) & Poole (E06000029). Combined to Bournemouth, Christchurch and Poole	(E06000058) in 2020. Goverment data DROPS Poole.
	//North Northamptonshire (E06000061) new ONS with no pre-lockdown data - drop 
	// West Northamptonshire (E06000062) new ONS with no pre-lockdown data - drop 

	drop if inlist(onscode, "E06000029", "E06000061", "E06000062")
	
	//Westminster and City of Westminster follow chronological and are combined (E09000033)
	replace localauthority = "Westminster" if onscode == "E09000033"

	// Just renaming Bristol, City of to Bristol - both mantained (E06000023) and there was no boundary change 
	replace localauthority = "Bristol" if onscode == "E06000023"

	//Buckinghamshire boundary did not change - it was previously made up of multiple councils but was then viewed as one unitary area. Does not affect the vaccine measurement spread therefore the dataset is combined rename E10000002 to E06000060
	replace onscode = "E06000060" if onscode == "E10000002"
	
	//Hereforshire mantains code, just had name change so rename E06000019 to Herefordshire
	replace localauthority = "Herefordshire" if onscode == "E06000019"

	//Dorset mantained in goverment data, rename E10000009 to E06000059
	replace onscode = "E06000059" if onscode == "E10000009"

	//rename all E06000010 to Kingston upon Hull
	replace localauthority = "Kingston upon Hull" if onscode == "E06000010"

	
	//NorthYorkshire  E10000023 to E06000065 (the most recent ONS code)
	replace onscode = "E06000065" if onscode == "E10000023"
	
	//Somerset E10000027 to E06000066 (most recent ONS code)
	replace onscode = "E06000066" if onscode == "E10000027"
	
save "C:\Users\44799\OneDrive - MMU\03 DISSERTATION\STATA\MMR Data\MMR_Data_Comp.dta"

