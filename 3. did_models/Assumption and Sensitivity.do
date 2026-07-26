
**#0 GitHub Setup
use "https://raw.githubusercontent.com/jubo-git/Project/main/2.%20data_clean/full_dataset.dta", clear

**# Sensitivity/Robustness Check 

	**# Multi-Tier Model (1/2/3/4)
	xtreg dtp_12m c.total_tier1##i.post c.total_tier2##i.post c.total_tier3##i.post c.total_tier4##i.post, fe vce(cluster onscode)

	*Findings wording: total_tier3#1.post is significantly more negative than total_tier1#1.post, you can ///
	"While each day in Tier 1 reduced uptake by $0.01\%$, each day in Tier 3 reduced uptake by ///
	$0.05\%$, proving that restriction severity amplifies disruption
		
	**# Mechanism Analysis: Specific Retail Sub-Policy Sensitivty Check 
		
		*This is a cumlative days of non-essential retail closure. Non-essential retail shutdowns