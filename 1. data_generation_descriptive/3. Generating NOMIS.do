**#3 NOMIS
local repo "https://raw.githubusercontent.com/jubo-git/Project/main/data_raw"
local datasets ethnic_group_2021 deprivation_2021 religion_2021

foreach group of local datasets {
    copy "`repo'/`group'.xlsx" "temp_`group'.xlsx", replace
    import excel "temp_`group'.xlsx", sheet("Data") cellrange(A8) firstrow clear
    
    rename *, lower
    keep if substr(area, 1, 4) == "lacu"
    rename b onscode
    drop if missing(onscode)
    
    tempfile t_`group'
    save "`t_`group''", replace    
    capture erase "temp_`group'.xlsx"
}


use "`t_ethnic_group_2021'", clear
merge 1:1 onscode using "`t_deprivation_2021'", nogenerate
merge 1:1 onscode using "`t_religion_2021'", nogenerate

* Clean up and calculate scores
drop if inlist(area, "lacu2023:Rutland", "lacu2023:Isles of Scilly", "lacu2023:Westmorland and Furness", "lacu2023:City of London" )
drop if substr(onscode, 1, 1) == "W"

gen deprivation_score = (1*householdisdeprivedinonedim) + (2*householdisdeprivedintwodim) + (3*householdisdeprivedinthreed) + (4*householdisdeprivedinfourdi)

save "data_clean/Nomis.dta", replace