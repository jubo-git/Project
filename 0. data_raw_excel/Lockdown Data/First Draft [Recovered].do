**import ALL raw lockdown data
import excel "C:\Users\25943553\OneDrive - MMU\03 DISSERTATION\DATASETS\Covid-local-restrictions-dataset.xlsx", sheet("dataset") firstrow

**mantain english data only 
drop Scotlandtier
drop if Country !="England"

**tidying
rename *, lower
drop  month dayofmonth country region
rename englandtiera tiera
rename englandtierb tierb
rename dateddmmyy date
format date %td
gen year = 2020

**The vaccine data is held on a Geographical ONS Code. Some of the lockdown detail is held at a local authority level by name, the LA code is what is reflective of the authroity level of interest. therefore the list of MMR authority codes is used as a filter 



**collapse (stat) old_variable, by(group_variable) // for now all the lockdown measures are equalised. do all at once as deletes and replaces everything. sorted by LA code as THERE ARE MULTIPLE LA authorties in the measurement th

collapse (sum) sumsociald = socialdistancing ///
		 (sum) sumhospshut = hospitalityshut  ///
		 (sum) sumretail = retailshut ///
		 (max) maxtiera = tiera  ///
		 (max) maxtierb = tierb ///
,by(lacode)
