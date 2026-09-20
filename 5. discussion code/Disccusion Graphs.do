use "https://raw.githubusercontent.com/jubo-git/Project/main/2.%20data_clean/full_dataset.dta", clear
preserve




**# Discussion: RQ2
*Can you show the changes in co-efficients 
		
		**Need to run regression first 
			* Hexavalent at 1 year
			xtreg hex_1y ib1.tier_quartile##1.post i.year, ///
				fe vce(cluster onscode)
			eststo hex_1y

			* Hexavalent at 2 years
			xtreg hex_2y ib1.tier_quartile##1.post i.year, ///
				fe vce(cluster onscode)
			eststo hex_2y

			* MMR1 at 2 years
			xtreg mmr1_2y ib1.tier_quartile##1.post i.year, ///
				fe vce(cluster onscode)
			eststo mmr1_2y

			* Hexavalent at 5 years
			xtreg hex_5y ib1.tier_quartile##1.post i.year, ///
				fe vce(cluster onscode)
			eststo hex_5y

			* DTP booster at 5 years
			xtreg dtp_boost_5y ib1.tier_quartile##1.post i.year, ///
				fe vce(cluster onscode)
			eststo dtp_boost_5y

			* MMR1 at 5 years
			xtreg mmr1_5y ib1.tier_quartile##1.post i.year, ///
				fe vce(cluster onscode)
			eststo mmr1_5y

			* MMR2 at 5 years
			xtreg mmr2_5y ib1.tier_quartile##1.post i.year, ///
				fe vce(cluster onscode)
			eststo mmr2_5y
			

**# FIGURE 1: MMR OUTCOMES


coefplot ///
    (mmr1_2y, ///
        keep(2.tier_quartile#1.post ///
             3.tier_quartile#1.post ///
             4.tier_quartile#1.post) ///
        label("MMR1 at 2 Years")) ///
    (mmr1_5y, ///
        keep(2.tier_quartile#1.post ///
             3.tier_quartile#1.post ///
             4.tier_quartile#1.post) ///
        label("MMR1 at 5 Years")) ///
    (mmr2_5y, ///
        keep(2.tier_quartile#1.post ///
             3.tier_quartile#1.post ///
             4.tier_quartile#1.post) ///
        label("MMR2 at 5 Years")), ///
    vertical ///
    nooffset ///
    recast(connected) ///
    ciopts(recast(rcap)) ///
    yline(0, lpattern(dash) lcolor(gs8)) ///
    xlabel(1 "Q2" 2 "Q3" 3 "Q4", labsize(medium)) ///
    xtitle("Cumulative Tier Exposure Quartile", size(medsmall)) ///
    ytitle("Coverage Change Relative to Q1 (Percentage Points)", ///
           size(medsmall)) ///
    title("Cumulative Tier Exposure and MMR Coverage", ///
          size(medium)) ///
    legend(pos(3) ring(1) cols(1) size(small) ///
           region(lstyle(none))) ///
    ylabel(, grid glcolor(gs14) glpattern(solid) labsize(small)) ///
    graphregion(color(white)) ///
    plotregion(margin(small)) ///
    xsize(10) ysize(6)
	
	*==============================================================*
* FIGURE 2: HEXAVALENT + BOOSTER OUTCOMES
*==============================================================*

coefplot ///
    (hex_1y, ///
        keep(2.tier_quartile#1.post ///
             3.tier_quartile#1.post ///
             4.tier_quartile#1.post) ///
        label("Hexavalent at 1 year")) ///
    (hex_2y, ///
        keep(2.tier_quartile#1.post ///
             3.tier_quartile#1.post ///
             4.tier_quartile#1.post) ///
        label("Hexavalent at 2 years")) ///
    (hex_5y, ///
        keep(2.tier_quartile#1.post ///
             3.tier_quartile#1.post ///
             4.tier_quartile#1.post) ///
        label("Hexavalent at 5 years")) ///
    (dtp_boost_5y, ///
        keep(2.tier_quartile#1.post ///
             3.tier_quartile#1.post ///
             4.tier_quartile#1.post) ///
        label("DTaP/IPV booster at 5 years")), ///
    vertical ///
    recast(connected) ///
    ciopts(recast(rcap)) ///
    yline(0, lpattern(dash)) ///
    xlabel(1 "Q2" 2 "Q3" 3 "Q4") ///
    xtitle("Cumulative tier exposure quartile") ///
   ytitle("Coverage Change Relative to Q1 (Percentage Points)") ///
    title("Association between cumulative tier exposure" ///
	"and hexavalent/booster coverage") ///
   legend(pos(3) ring(1) cols(1) size(small) ///
           region(lstyle(none))) ///
	ylabel(, grid glcolor(gs14) glpattern(solid)) ///
    graphregion(color(white))

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