**import ALL raw lockdown data
import excel "C:\Users\44799\OneDrive - MMU\03 DISSERTATION\DATASETS\RAW DATA Covid-local-restrictions.xlsx", sheet("RAW All LA England") firstrow


**tidying
rename *, lower
drop county region month dayofmonth country
rename englandtiera tiera
rename englandtierb tierb
rename dateddmmyy date
format date %td
gen year = 2020

**collapse (stat) old_variable, by(group_variable) // for now all the lockdown measures are equalised. do all at once as deletes and replaces everything. sroted by LA name to prepare for vaccine data

collapse (sum) sumsociald = socialdistancing ///
		 (sum) sumhospshut = hospitalityshut  ///
		 (sum) sumretail = retailshut ///
		 (max) maxtiera = tiera  ///
		 (max) maxtierb = tierb ///
,by(laname)
