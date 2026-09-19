use "https://raw.githubusercontent.com/jubo-git/Project/main/2.%20data_clean/full_dataset.dta", clear
preserve




**# Discussion: RQ2
*Can you show the changes in co-efficients 


**# NOT USING - but was to demonstrate the pre-existing MMR trends before and after intervention (think better illustrated through margins )

* Calculate mean LA-level coverage for each year
collapse (mean) mmr1_24m mmr1_5y mmr2_5y, by(year)

* Plot MMR coverage trends
twoway ///
    (line mmr1_24m year, lwidth(medthick) msymbol(circle)) ///
    (line mmr1_5y year, lwidth(medthick) msymbol(square)) ///
    (line mmr2_5y year, lwidth(medthick) msymbol(triangle)) ///
    , ///
    xline(2020.75, lpattern(dash)) ///
    xlabel(2015(1)2024) ///
    ylabel(, angle(horizontal)) ///
    xtitle("Year") ///
    ytitle("Mean local-authority vaccination coverage (%)") ///
    title("MMR vaccination coverage over time") ///
    subtitle("Dashed line indicates introduction of the tier framework") ///
    legend(order(1 "MMR1 at 24 months" ///
                 2 "MMR1 at 5 years" ///
                 3 "MMR2 at 5 years") ///
           rows(1) position(6)) ///
    graphregion(color(white))

restore