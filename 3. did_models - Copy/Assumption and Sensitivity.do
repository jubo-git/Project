**#0 GitHub Setup
use "https://raw.githubusercontent.com/jubo-git/Project/main/2.%20data_clean/full_dataset.dta", clear

**# Sensitivity/Robustness Check 

	**# Multi-Tier Model (Threshold Effects: Tier 1/2/3/4)
	xtreg dtp_12m c.total_tier1##i.post c.total_tier2##i.post c.total_tier3##i.post c.total_tier4##i.post, fe vce(cluster onscode)
	xtreg dtp_24m c.total_tier1##i.post c.total_tier2##i.post c.total_tier3##i.post c.total_tier4##i.post, fe vce(cluster onscode)
	xtreg mmr1_24m c.total_tier1##i.post c.total_tier2##i.post c.total_tier3##i.post c.total_tier4##i.post, fe vce(cluster onscode)
	xtreg dtp_5y c.total_tier1##i.post c.total_tier2##i.post c.total_tier3##i.post c.total_tier4##i.post, fe vce(cluster onscode)
	xtreg dtp_boost_5y c.total_tier1##i.post c.total_tier2##i.post c.total_tier3##i.post c.total_tier4##i.post, fe vce(cluster onscode)
	xtreg mmr1_5y c.total_tier1##i.post c.total_tier2##i.post c.total_tier3##i.post c.total_tier4##i.post, fe vce(cluster onscode)
	xtreg mmr2_5y c.total_tier1##i.post c.total_tier2##i.post c.total_tier3##i.post c.total_tier4##i.post, fe vce(cluster onscode)

	*Findings wording: total_tier3#1.post is significantly more negative than total_tier1#1.post, you can ///
	"While each day in Tier 1 reduced uptake by $0.01\%$, each day in Tier 3 reduced uptake by ///
	$0.05\%$, proving that restriction severity amplifies disruption
		
	**# Mechanism Analysis: Specific Retail Sub-Policy Sensitivity Check 
		
		*This is a cumulative days of non-essential retail closure. Non-essential retail shutdowns
		*were only mandated at Tier 4, so this checks whether the primary total_tier result is 
		*driven specifically by the most severe restriction level, or reflects a broader dose-response.

	xtreg dtp_12m c.total_retail##i.post, fe vce(cluster onscode)
	xtreg dtp_24m c.total_retail##i.post, fe vce(cluster onscode)
	xtreg mmr1_24m c.total_retail##i.post, fe vce(cluster onscode)
	xtreg dtp_5y c.total_retail##i.post, fe vce(cluster onscode)
	xtreg dtp_boost_5y c.total_retail##i.post, fe vce(cluster onscode)
	xtreg mmr1_5y c.total_retail##i.post, fe vce(cluster onscode)
	xtreg mmr2_5y c.total_retail##i.post, fe vce(cluster onscode)