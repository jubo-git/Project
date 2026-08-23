**# 2024 - 25
local repo "https://raw.githubusercontent.com/jubo-git/Project/main/0.%20data_raw_excel/COVER%20Data"
copy "`repo'/2024-to-2025-cover-anual-data-tables.xlsx" "temp_2024_25.xlsx", replace

		*T4a_UTLA12m [A8: G167] (6in1_12m)
		import excel "temp_2024_25.xlsx", sheet("T4a_UTLA12m") cellrange(A8:G167) firstrow clear
		drop OrganisationDataServicecode Note Numberaged12months
		rename *, lower
		rename localauthority laname
		rename code onscode
		rename regionname region 
		rename coverageat12monthsdtapipvh dtp_12m
		keep onscode laname region dtp_12m
		drop if missing(onscode) | onscode == "ONS Code"
		tempfile data12m
		save "`data12m'"
		
		*T5a_UTLA24m [A8: H167]  (6in1_24m & mmr1_24m)
		import excel "temp_2024_25.xlsx", sheet("T5a_UTLA24m") cellrange(A8:H167) firstrow clear
		drop OrganisationDataServicecode Note Numberaged24months
		rename *, lower
		rename localauthority laname
		rename code onscode
		rename regionname region 
		rename coverageat24monthsdtapipvh dtp_24m
		rename coverageat24monthsmmr1 mmr1_24m
		keep onscode laname region dtp_24m mmr1_24m
		drop if missing(onscode) | onscode == "ONS Code"
		tempfile data24m
		save "`data24m'"
		
		*T6a_UTLA5y [A8: K167] (6in1_5y & booster & mmr1_5y & mmr2_5y)
		import excel "temp_2024_25.xlsx", sheet("T6a_UTLA5y") cellrange(A8:K167) firstrow clear
		drop OrganisationDataServicecode Note Numberaged5years Coverageat5yearsHibMenCboo
		rename *, lower
		rename localauthority laname
		rename code onscode
		rename regionname region 
		rename coverageat5yearsdtapipvhib dtp_5y
		rename coverageat5yearsdtapipvboo dtp_boost_5y
		rename coverageat5yearsmmr1 mmr1_5y
		rename coverageat5yearsmmr2 mmr2_5y
		keep onscode laname region dtp_5y dtp_boost_5y mmr1_5y mmr2_5y
		drop if missing(onscode) | onscode == "ONS Code"
		tempfile data5y
		save "`data5y'"
	
		*Merge all temp files to create 2025 dataset 
		use "`data12m'", clear
		merge 1:1 onscode using "`data24m'", nogenerate
		merge 1:1 onscode using "`data5y'", nogenerate
		gen year = "2025"
		
		tempfile master_2025
		save "`master_2025'", replace
	
**# 2023 - 24 
local repo "https://raw.githubusercontent.com/jubo-git/Project/main/0.%20data_raw_excel/COVER%20Data"
copy "`repo'/2023%20-%202024%20childhood-vaccinations.xlsx" "temp_2023_24.xlsx", replace

		*Table 8a [A21: F169] (6in1_12m)
		import excel "temp_2023_24.xlsx", sheet("Table 8a") cellrange(A21:F169) clear
		drop D E 
		rename A onscode 
		rename B laname 
		rename C region 
		rename F dtp_12m
		keep onscode laname region dtp_12m
		drop if missing(onscode) | onscode == "ONS Code"
		tempfile data12m_24
		save "`data12m_24'"

		*Table 9a [A21: G169] (6in1_24m & mmr1_24m)
		import excel "temp_2023_24.xlsx", sheet("Table 9a") cellrange(A21:G169) clear
		drop D E 
		rename A onscode
		rename B laname
		rename C region
		rename F dtp_24m
		rename G mmr1_24m
		keep onscode laname region dtp_24m mmr1_24m
		drop if missing(onscode) | onscode == "ONS Code"
		tempfile data24m_24
		save "`data24m_24'", replace
		
		*Table 10a [A21: I169] (6in1_5y & booster & mmr1_5y & mmr2_5y)
		import excel "temp_2023_24.xlsx", sheet("Table 10a") cellrange(A21:I169) clear
		drop D E
		rename A onscode
		rename B laname
		rename C region
		rename F dtp_5y
		rename G dtp_boost_5y
		rename H mmr1_5y
		rename I mmr2_5y
		keep onscode laname region dtp_5y dtp_boost_5y mmr1_5y mmr2_5y
		drop if missing(onscode) | onscode == "ONS Code"
		tempfile data5y_24
		save "`data5y_24'", replace
		
		*Merge all temp files to create 2024 dataset 
		use "`data12m_24'", clear
		merge 1:1 onscode using "`data24m_24'", nogenerate
		merge 1:1 onscode using "`data5y_24'", nogenerate
		gen year = "2024"
		
		tempfile master_2024
		save "`master_2024'", replace

**# 2022 - 23 
local repo "https://raw.githubusercontent.com/jubo-git/Project/main/0.%20data_raw_excel/COVER%20Data"
copy "`repo'/2022-2023-childhood_vaccination_datatables.xlsx" "temp_2022_23.xlsx", replace

		*Table 8a [A21: F169] (6in1_12m)
		import excel "temp_2022_23.xlsx", sheet("Table 8a") cellrange(A21:F169) clear
		drop D E 
		rename A onscode 
		rename B laname 
		rename C region 
		rename F dtp_12m
		keep onscode laname region dtp_12m
		drop if missing(onscode) | onscode == "ONS Code"
		tempfile data12m_23
		save "`data12m_23'"

		*Table 9a [A21: G169] (6in1_24m & mmr1_24m)
		import excel "temp_2022_23.xlsx", sheet("Table 9a") cellrange(A21:G169) clear
		drop D E 
		rename A onscode
		rename B laname
		rename C region
		rename F dtp_24m
		rename G mmr1_24m
		keep onscode laname region dtp_24m mmr1_24m
		drop if missing(onscode) | onscode == "ONS Code"
		tempfile data24m_23
		save "`data24m_23'"

		*Table 10a [A21: I169] (6in1_5y & booster & mmr1_5y & mmr2_5y)
		import excel "temp_2022_23.xlsx", sheet("Table 10a") cellrange(A21:I169) clear
		drop D E
		rename A onscode
		rename B laname
		rename C region
		rename F dtp_5y
		rename G dtp_boost_5y
		rename H mmr1_5y
		rename I mmr2_5y
		keep onscode laname region dtp_5y dtp_boost_5y mmr1_5y mmr2_5y
		drop if missing(onscode) | onscode == "ONS Code"
		tempfile data5y_23
		save "`data5y_23'"

		*Merge all temp files to create 2023 dataset 
		use "`data12m_23'", clear
		merge 1:1 onscode using "`data24m_23'", nogenerate
		merge 1:1 onscode using "`data5y_23'", nogenerate
		gen year = "2023"
		
		tempfile master_2023
		save "`master_2023'", replace

**# 2021 - 22
local repo "https://raw.githubusercontent.com/jubo-git/Project/main/0.%20data_raw_excel/COVER%20Data"
copy "`repo'/2021-22%20Childhood%20Vaccination%20Statistics.xlsx" "temp_2021_22.xlsx", replace

		*Table 8b [B32: F204] (6in1_12m)
		import excel "temp_2021_22.xlsx", sheet("Table 8b") cellrange(B32:F204) clear
		drop D E
		rename B laname
		rename C onscode
		rename F dtp_12m
		gen region = ""
		keep onscode laname region dtp_12m
		drop if missing(onscode) | onscode == "ONS Code"
		tempfile data12m_22
		save "`data12m_22'"

		*Table 9b [B31: G203] (6in1_24m & mmr1_24m)
		import excel "temp_2021_22.xlsx", sheet("Table 9b") cellrange(B31:G203) clear
		drop D E
		rename B laname
		rename C onscode
		rename F dtp_24m
		rename G mmr1_24m
		keep onscode laname dtp_24m mmr1_24m 
		drop if missing(onscode) | onscode == "ONS Code"
		tempfile data24m_22
		save "`data24m_22'"

		*Table 10b [B31: I203] (6in1_5y & booster & mmr1_5y & mmr2_5y)
		import excel "temp_2021_22.xlsx", sheet("Table 10b") cellrange(B31:I203) clear
		drop D E
		rename B laname
		rename C onscode
		rename F dtp_5y
		rename G dtp_boost_5y
		rename H mmr1_5y
		rename I mmr2_5y
		keep onscode laname dtp_5y dtp_boost_5y mmr1_5y mmr2_5y
		drop if missing(onscode) | onscode == "ONS Code"
		tempfile data5y_22
		save "`data5y_22'"

		*Merge all temp files to create 2022 dataset 
		use "`data12m_22'", clear
		merge 1:1 onscode using "`data24m_22'", nogenerate
		merge 1:1 onscode using "`data5y_22'", nogenerate
		gen year = "2022"
		
		tempfile master_2022
		save "`master_2022'", replace

**# 2020 - 21
local repo "https://raw.githubusercontent.com/jubo-git/Project/main/0.%20data_raw_excel/COVER%20Data"
copy "`repo'/2020-21-Childhood%20Vaccination%20Statistics.xlsx" "temp_2020_21.xlsx", replace

		*Table 8b [B32: F203] (6in1_12m)
		import excel "temp_2020_21.xlsx", sheet("Table 8b") cellrange(B32:F203) clear
		drop D E
		rename C onscode
		rename B laname
		rename F dtp_12m
		gen region = ""
		keep onscode laname region dtp_12m
		drop if missing(onscode) | onscode == "ONS Code"
		tempfile data12m_21
		save "`data12m_21'"

		*Table 9b [B31: G202] (6in1_24m & mmr1_24m)
		import excel "temp_2020_21.xlsx", sheet("Table 9b") cellrange(B31:G202) clear
		drop D E
		rename C onscode
		rename B laname
		rename F dtp_24m
		rename G mmr1_24m
		keep onscode laname dtp_24m mmr1_24m
		drop if missing(onscode) | onscode == "ONS Code"
		tempfile data24m_21
		save "`data24m_21'"

		*Table 10b [B31: I202] (6in1_5y & booster & mmr1_5y & mmr2_5y)
		import excel "temp_2020_21.xlsx", sheet("Table 10b") cellrange(B31:I202) clear
		drop D E
		rename C onscode
		rename B laname
		rename F dtp_5y
		rename G dtp_boost_5y
		rename H mmr1_5y
		rename I mmr2_5y
		keep onscode laname dtp_5y dtp_boost_5y mmr1_5y mmr2_5y
		drop if missing(onscode) | onscode == "ONS Code"
		tempfile data5y_21
		save "`data5y_21'"

		*Merge all temp files to create 2021 dataset 
		use "`data12m_21'", clear
		merge 1:1 onscode using "`data24m_21'", nogenerate
		merge 1:1 onscode using "`data5y_21'", nogenerate
		gen year = "2021"
		
		tempfile master_2021
		save "`master_2021'", replace
		
**# 2019 - 20
local repo "https://raw.githubusercontent.com/jubo-git/Project/main/0.%20data_raw_excel/COVER%20Data"
copy "`repo'/2019-20-child-vacc-stat-eng-data-tables.xlsx" "temp_2019_20.xlsx", replace

		*Table 8b [B31: F202] (6in1_12m)
		import excel "temp_2019_20.xlsx", sheet("Table 8b") cellrange(B31:F202) clear
		drop D E
		rename C onscode
		rename B laname
		rename F dtp_12m
		gen region = ""
		keep onscode laname region dtp_12m
		drop if missing(onscode) | onscode == "ONS Code"
		tempfile data12m_20
		save "`data12m_20'"

		*Table 9b [B30: G201] (6in1_24m & mmr1_24m)
		import excel "temp_2019_20.xlsx", sheet("Table 9b") cellrange(B30:G201) clear
		drop D E
		rename C onscode
		rename B laname
		rename F dtp_24m
		rename G mmr1_24m
		keep onscode laname dtp_24m mmr1_24m
		drop if missing(onscode) | onscode == "ONS Code"
		tempfile data24m_20
		save "`data24m_20'"

		*Table 10b [B31: I202] (6in1_5y & booster & mmr1_5y & mmr2_5y)
		import excel "temp_2019_20.xlsx", sheet("Table 10b") cellrange(B31:I202) clear
		drop D E
		rename C onscode
		rename B laname
		rename F dtp_5y
		rename G dtp_boost_5y
		rename H mmr1_5y
		rename I mmr2_5y
		keep onscode laname dtp_5y dtp_boost_5y mmr1_5y mmr2_5y
		drop if missing(onscode) | onscode == "ONS Code"
		tempfile data5y_20
		save "`data5y_20'"

		*Merge all temp files to create 2020 dataset 
		use "`data12m_20'", clear
		merge 1:1 onscode using "`data24m_20'", nogenerate
		merge 1:1 onscode using "`data5y_20'", nogenerate
		gen year = "2020"
		
		tempfile master_2020
		save "`master_2020'", replace

**# 2018 - 19
local repo "https://raw.githubusercontent.com/jubo-git/Project/main/0.%20data_raw_excel/COVER%20Data"
copy "`repo'/2018-19-child-vacc-stat-eng-tables.xlsx" "temp_2018_19.xlsx", replace

		*Table 8b [B31: F203] (6in1_12m)
		import excel "temp_2018_19.xlsx", sheet("Table 8b") cellrange(B31:F203) clear
		drop D E
		rename C onscode
		rename B laname
		rename F dtp_12m
		gen region = ""
		keep onscode laname region dtp_12m
		drop if missing(onscode) | onscode == "ONS Code"
		tempfile data12m_19
		save "`data12m_19'"

		*Table 9b [B30: G202] (6in1_24m & mmr1_24m)
		import excel "temp_2018_19.xlsx", sheet("Table 9b") cellrange(B30:G202) clear
		drop D E
		rename C onscode
		rename B laname
		rename F dtp_24m
		rename G mmr1_24m
		keep onscode laname dtp_24m mmr1_24m
		drop if missing(onscode) | onscode == "ONS Code"
		tempfile data24m_19
		save "`data24m_19'"

		*Table 10b [B31: I203] (6in1_5y & booster & mmr1_5y & mmr2_5y)
		import excel "temp_2018_19.xlsx", sheet("Table 10b") cellrange(B31:I203) clear
		drop D E
		rename C onscode
		rename B laname
		rename F dtp_5y
		rename G dtp_boost_5y
		rename H mmr1_5y
		rename I mmr2_5y
		keep onscode laname dtp_5y dtp_boost_5y mmr1_5y mmr2_5y
		drop if missing(onscode) | onscode == "ONS Code"
		tempfile data5y_19
		save "`data5y_19'"

		*Merge all temp files to create 2019 dataset 
		use "`data12m_19'", clear
		merge 1:1 onscode using "`data24m_19'", nogenerate
		merge 1:1 onscode using "`data5y_19'", nogenerate
		gen year = "2019"
		
		tempfile master_2019
		save "`master_2019'", replace

**# 2017 - 18
local repo "https://raw.githubusercontent.com/jubo-git/Project/main/0.%20data_raw_excel/COVER%20Data"
copy "`repo'/2017-18-child-vacc-stat-eng-tab.xlsx" "temp_2017_18.xlsx", replace

		*Table 8b [B31: F203] (6in1_12m)
		import excel "temp_2017_18.xlsx", sheet("Table 8b") cellrange(B31:F203) clear
		drop D E
		rename C onscode
		rename B laname
		rename F dtp_12m
		gen region = ""
		keep onscode laname region dtp_12m
		drop if missing(onscode) | onscode == "ONS Code"
		tempfile data12m_18
		save "`data12m_18'"

		*Table 9b [B30: G202] (6in1_24m & mmr1_24m)
		import excel "temp_2017_18.xlsx", sheet("Table 9b") cellrange(B30:G202) clear
		drop D E
		rename C onscode
		rename B laname
		rename F dtp_24m
		rename G mmr1_24m
		destring mmr1_24m, replace force
		keep onscode laname dtp_24m mmr1_24m
		drop if missing(onscode) | onscode == "ONS Code"
		tempfile data24m_18
		save "`data24m_18'"

		*Table 10b [B31: I203] (6in1_5y & booster & mmr1_5y & mmr2_5y)
		import excel "temp_2017_18.xlsx", sheet("Table 10b") cellrange(B31:I203) clear
		drop D E
		rename C onscode
		rename B laname
		rename F dtp_5y
		rename G dtp_boost_5y
		rename H mmr1_5y
		rename I mmr2_5y
		keep onscode laname dtp_5y dtp_boost_5y mmr1_5y mmr2_5y
		drop if missing(onscode) | onscode == "ONS Code"
		tempfile data5y_18
		save "`data5y_18'"

		*Merge all temp files to create 2018 dataset 
		use "`data12m_18'", clear
		merge 1:1 onscode using "`data24m_18'", nogenerate
		merge 1:1 onscode using "`data5y_18'", nogenerate
		gen year = "2018"
		
		tempfile master_2018
		save "`master_2018'", replace

		
**# 2016 - 17
local repo "https://raw.githubusercontent.com/jubo-git/Project/main/0.%20data_raw_excel/COVER%20Data"
copy "`repo'/2016-17-nhs-immu-stat-eng-tab.xlsx" "temp_2016_17.xlsx", replace

		*Table 8b [B31: F203] (6in1_12m)
		import excel "temp_2016_17.xlsx", sheet("Table 8b") cellrange(B31:F203) clear
		drop D E
		rename C onscode
		rename B laname
		rename F dtp_12m
		gen region = ""
		keep onscode laname region dtp_12m
		drop if missing(onscode) | onscode == "ONS Code"
		tempfile data12m_17
		save "`data12m_17'"

		*Table 9b [B30: G202] (6in1_24m & mmr1_24m)
		import excel "temp_2016_17.xlsx", sheet("Table 9b") cellrange(B30:G202) clear
		drop D E
		rename C onscode
		rename B laname
		rename F dtp_24m
		rename G mmr1_24m
		keep onscode laname dtp_24m mmr1_24m
		drop if missing(onscode) | onscode == "ONS Code"
		tempfile data24m_17
		save "`data24m_17'"

		*Table 10b [B31: I203] (6in1_5y & booster & mmr1_5y & mmr2_5y)
		import excel "temp_2016_17.xlsx", sheet("Table 10b") cellrange(B31:I203) clear
		drop D E
		rename C onscode
		rename B laname
		rename F dtp_5y
		rename G dtp_boost_5y
		rename H mmr1_5y
		rename I mmr2_5y
		keep onscode laname dtp_5y dtp_boost_5y mmr1_5y mmr2_5y
		drop if missing(onscode) | onscode == "ONS Code"
		tempfile data5y_17
		save "`data5y_17'"

		*Merge all temp files to create 2018 dataset 
		use "`data12m_17'", clear
		merge 1:1 onscode using "`data24m_17'", nogenerate
		merge 1:1 onscode using "`data5y_17'", nogenerate
		gen year = "2017"
		
		tempfile master_2017
		save "`master_2017'", replace
		
**# 2015 - 16
local repo "https://raw.githubusercontent.com/jubo-git/Project/main/0.%20data_raw_excel/COVER%20Data"
copy "`repo'/2015-16-nhs-immu-stat-eng-tab.xlsx" "temp_2015_16.xlsx", replace

		*Table 10a [B31: F203] (6in1_12m)
		import excel "temp_2015_16.xlsx", sheet("Table 10a") cellrange(B31:F203) clear
		drop D E
		rename C onscode
		rename B laname
		rename F dtp_12m
		gen region = ""
		keep onscode laname region dtp_12m
		drop if missing(onscode) | onscode == "ONS Code"
		tempfile data12m_16
		save "`data12m_16'"

		*Table 11a [B30: G202] (6in1_24m & mmr1_24m)
		import excel "temp_2015_16.xlsx", sheet("Table 11a") cellrange(B30:G202) clear
		drop D E
		rename C onscode
		rename B laname
		rename F dtp_24m
		rename G mmr1_24m
		keep onscode laname dtp_24m mmr1_24m
		drop if missing(onscode) | onscode == "ONS Code"
		tempfile data24m_16
		save "`data24m_16'"

		*Table 12a [B31: I203] (6in1_5y & booster & mmr1_5y & mmr2_5y) 
		import excel "temp_2015_16.xlsx", sheet("Table 12a") cellrange(B31:I203) clear
		drop D E
		rename C onscode
		rename B laname
		rename F dtp_5y
		rename G dtp_boost_5y
		rename H mmr1_5y
		rename I mmr2_5y
		keep onscode laname dtp_5y dtp_boost_5y mmr1_5y mmr2_5y
		drop if missing(onscode) | onscode == "ONS Code"
		tempfile data5y_16
		save "`data5y_16'"

		*Merge all temp files to create 2016 dataset 
		use "`data12m_16'", clear
		merge 1:1 onscode using "`data24m_16'", nogenerate
		merge 1:1 onscode using "`data5y_16'", nogenerate
		gen year = "2016"
		
		tempfile master_2016
		save "`master_2016'", replace

**# 2014 - 15
local repo "https://raw.githubusercontent.com/jubo-git/Project/main/0.%20data_raw_excel/COVER%20Data"
copy "`repo'/2014-15-nhs-immu-stat-eng-tab.xlsx" "temp_2014_15.xlsx", replace

		*Table 10a [B24: G196] (6in1_12m)
		import excel "temp_2014_15.xlsx", sheet("Table 10a") cellrange(A20:F196) clear
		drop D E 
		rename C onscode
		rename B laname
		rename F dtp_12m
		rename A region
		keep onscode laname region dtp_12m
		drop if missing(onscode) | onscode == "ONS Code"
		tempfile data12m_15
		save "`data12m_15'"

		*Table 11a [B23: I195] (6in1_24m & mmr1_24m)
		import excel "temp_2014_15.xlsx", sheet("Table 11a") cellrange(A23:G195) clear
		drop D E 
		rename C onscode
		rename A region
		rename B laname
		rename F dtp_24m
		rename G mmr1_24m
		keep onscode laname dtp_24m mmr1_24m
		drop if missing(onscode) | onscode == "ONS Code"
		tempfile data24m_15
		save "`data24m_15'"

		*Table 12a [B24: I196] (6in1_5y & booster & mmr1_5y & mmr2_5y)
		import excel "temp_2014_15.xlsx", sheet("Table 12a") cellrange(B24:J196) clear
		drop D E
		rename C onscode
		rename B laname
		rename G dtp_boost_5y
		rename F dtp_5y
		rename H mmr1_5y
		rename I mmr2_5y
		keep onscode laname dtp_5y dtp_boost_5y mmr1_5y mmr2_5y
		drop if missing(onscode) | onscode == "ONS Code"
		tempfile data5y_15
		save "`data5y_15'"

		*Merge all temp files to create 2015 dataset 
		use "`data12m_15'", clear
		merge 1:1 onscode using "`data24m_15'", nogenerate
		merge 1:1 onscode using "`data5y_15'", nogenerate
		gen year = "2015"
		
		tempfile master_2015
		save "`master_2015'", replace

**# 2013 - 14
local repo "https://raw.githubusercontent.com/jubo-git/Project/main/0.%20data_raw_excel/COVER%20Data"
copy "`repo'/2013-14-nhs-immu-stat-eng-tab-exc.xlsx" "temp_2013_14.xlsx", replace

		*Table 10a [B23: G195] (6in1_12m)
		import excel "temp_2013_14.xlsx", sheet("Table 10a") cellrange(A23:F195) clear
		drop D E 
		rename C onscode
		rename B laname
		rename F dtp_12m
		rename A region
		keep onscode laname region dtp_12m
		drop if missing(onscode) | onscode == "ONS Code"
		tempfile data12m_14
		save "`data12m_14'"

		*Table 11a [B22: I194] (6in1_24m & mmr1_24m)
		import excel "temp_2013_14.xlsx", sheet("Table 11a") cellrange(A22:G194) clear
		drop D E
		rename C onscode
		rename B laname
		rename F dtp_24m
		rename G mmr1_24m
		keep onscode laname dtp_24m mmr1_24m
		drop if missing(onscode) | onscode == "ONS Code"
		tempfile data24m_14
		save "`data24m_14'"

		*Table 12a [B23: I195] (6in1_5y & booster & mmr1_5y & mmr2_5y)
		import excel "temp_2013_14.xlsx", sheet("Table 12a") cellrange(A23:I195) clear
		drop D E
		rename C onscode
		rename B laname
		rename F dtp_boost_5y
		rename G dtp_5y
		rename H mmr1_5y
		rename I mmr2_5y
		keep onscode laname dtp_5y dtp_boost_5y mmr1_5y mmr2_5y
		drop if missing(onscode) | onscode == "ONS Code"
		tempfile data5y_14
		save "`data5y_14'"

		*Merge all temp files to create 2014 dataset 
		use "`data12m_14'", clear
		merge 1:1 onscode using "`data24m_14'", nogenerate
		merge 1:1 onscode using "`data5y_14'", nogenerate
		gen year = "2014"
		destring dtp_boost_5y dtp_5y, replace force
		
		tempfile master_2014
		save "`master_2014'", replace
		
**# Master Vaccine Dataset 

use "`master_2025'", clear

	append using "`master_2024'"
	append using "`master_2023'"
	append using "`master_2022'"
	append using "`master_2021'"
	append using "`master_2020'"
	append using "`master_2019'"
	append using "`master_2018'"
	append using "`master_2017'"
	append using "`master_2016'"
	append using "`master_2015'"
	append using "`master_2014'"
	
*Mid-Point Save 
*Save 
cd "C:\Users\44799\OneDrive - MMU\03 DISSERTATION\GITHUB"
save "2. data_clean\mid_combined_vaccine_dataset.dta", replace

*Tidying-Up 
use "2. data_clean\mid_combined_vaccine_dataset.dta"
replace laname = trim(regexr(laname, "\([0-9]+\)", ""))
drop if inlist(laname, "", "[z]")
replace laname = "St Helens" if laname == "St. Helens"

* Harmonised ONS Code Recoding

	replace onscode = "E06000058" if onscode == "E06000028"  
	replace laname = "Bournemouth, Christchurch and Poole" if onscode == "E06000058" // BCP Council" // BCP Council

	replace onscode = "E06000060" if onscode == "E10000002" // Buckinghamshire

	replace onscode = "E06000059" if onscode == "E10000009" // Dorset

	replace onscode = "E06000065" if onscode == "E10000023" // North Yorkshire
	
	replace onscode = "E06000066" if onscode == "E10000027" // Somerset

*Create a Northamptonshire Variable (using the average of the post 2021 regions to create a Northamptonshire 2014 - 2025 variable)

	* Calculate averages for the split authorities
	local vars dtp_12m dtp_24m mmr1_24m dtp_5y mmr1_5y dtp_boost_5y mmr2_5y

	foreach v of local vars {
		bysort year: egen avg_`v' = mean(cond(inlist(onscode,"E06000061","E06000062"), `v', .))
	}

	* Keep one copy (North Northamptonshire) to become Northamptonshire
	foreach v of local vars {
		replace `v' = avg_`v' if onscode=="E06000061"
		drop avg_`v'
	}

	replace onscode = "E10000021" if onscode=="E06000061"
	replace laname  = "Northamptonshire" if onscode=="E10000021"

	* Remove West Northamptonshire
	drop if onscode=="E06000062"

*Drop unneeded codes & standardize names globally
		drop if onscode == "E06000029" // Drop Poole (combined into Bournemouth)
	replace laname = "Westminster" if onscode == "E09000033" //Combining City of Westminster (2014-15 with Westminster)
	replace laname = "Bristol" if onscode == "E06000023" //Renaming Bristol, city of 
	replace laname = "Herefordshire" if onscode == "E06000019" //Renaming Herefordshire, County of
	replace laname = "Kingston upon Hull" if onscode == "E06000010" //renaming Kingston upon Hull, City of
	replace laname = "Northamptonshire" if onscode == "E10000021"


collapse (sum) dtp_12m dtp_24m mmr1_24m dtp_5y dtp_boost_5y mmr1_5y mmr2_5y, by(onscode laname region year)

* Save as a clean temporary file ready for merging
sort onscode year
*Save 
	cd "C:\Users\44799\OneDrive - MMU\03 DISSERTATION\GITHUB"
	save "2. data_clean\final_combined_vaccine_dataset.dta", replace

capture erase "temp_2024_25.xlsx"
capture erase "temp_2023_24.xlsx"
capture erase "temp_2022_23.xlsx"
capture erase "temp_2021_22.xlsx"
capture erase "temp_2020_21.xlsx"
capture erase "temp_2019_20.xlsx"
capture erase "temp_2018_19.xlsx"
capture erase "temp_2017_18.xlsx"
capture erase "temp_2016_17.xlsx"
capture erase "temp_2015_16.xlsx"
capture erase "temp_2014_15.xlsx"
capture erase "temp_2013_14.xlsx"