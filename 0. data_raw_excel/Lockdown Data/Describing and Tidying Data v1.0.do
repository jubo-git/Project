**#1 Processing Lockdown Data to be Comp. with Vaccine Data

**import ALL raw lockdown data - importing full dataset and filtering in STATA to allow for reproducibility 
import excel "C:\Users\44799\OneDrive - MMU\03 DISSERTATION\DATASETS\Combining MMR and Lockdown Score.xlsx", sheet("Raw Lockdown Data") firstrow

**Tidying (generic and making variables more streamlined)

	**mantain english data only 
	drop Scotlandtier
	drop if Country !="England"

	rename *, lower
	rename englandtiera tiera
	rename englandtierb tierb
	rename noindoormixing noindoormix
	rename nooutdoormixing nooutmix

	*National and Regional Data: Not required as the detail is held at the county and local authroity level 
	drop country region regioncode
	
	**create a date function (to allow for averages later)
	gen date = mdy(month,dayofmonth,2020)
	format date %td
	label variable date "Date of Restriction"
	drop month dayofmonth 
	
**COMBINING LOCAL AUTHORITY DATA: The vaccine data is held on a Geographical ONS Code. Some of the lockdown detail is held at a local authroity level which cannot be directly reflected in the vaccine data.

**Pivot tables in Excel show that although the data is held at a local authority level all local authorties in the same LA Code had the same lockdown treatment. Verify in STATA (difficult to tell)

	duplicates r lacode date

 *rather than taking the average as planned it is a case of dropping and renaming per each lockdown measure (9 types of lockdown measured socialdistancing hospitalityshut retailshut noindoormix nooutmix tiera tierb primaryclosed secondaryclosed)
 
	codebook lacode 
	codebook countycode 
	*there are 34 unique lacodes and 317 unique county codes 
	duplicates drop lacode date, force
	
*sense checking (slightly unsure if this has worked) - should be 157 (161-split codes) * 366 days = 57462
	codebook la code
	**output 34 


	*DATES: although there are specific dates, they are all in the 2020 period. Additionally, the lockdown scores will not be used as continous data so it is not required. Therefore no date stamp is required.
	drop  month dayofmonth 
	
	**need to rename the codes to fit with the most recent vaccien data
	
**#2 Processing Vaccine Data 

	
**#3 Combining the Vaccine and Lockdown Data



* There has also been some changes in names and codes so data will need to be combined. 
*Merge with vaccine data 
*merge m:1 using (need to generate a .dta for the vaccine data)

