This is a continually updated folder for my Project: Using Difference-in-Difference (DiD) to evaluate whether English local authorities that experienced more stringent lockdown restrictions during the 2020 COVID-19 pandemic have experienced a differential drop in MMR1 and MMR2 uptake in 2021 - 2025.

*** My STATA liscence has been revoked. I am in the process of getting it renewed but I have not been able to open do-files and update some of the models (new notation) and testings. You should still be able to view it ***

0. data_raw_excel: This has all the raw excel files that will be aggregated for the dataset. The COVER folder has all the vaccination data from NHS England, Lockdown data from the Insititue for Fiscal Stidues: 
https://ifs.org.uk/internal-datasets/covid-19-restrictions-dataset and NOMIS data for deprivation, ns-sec and religion. 

2. data_generation_descriptive: This is made up of 5 do-files:
     - Generating vaccine dataset: This is the primary datatset and sets the level of aggregation
     - Generating lockdown dataset: This has data has a value per day per LA
     - Generating NOMIS: Taken from the 2021 cencus. 
     - Generating usable dataset: This combines all the datasets made from 1-3 into a comptaible one aggregated dataset on LA
     - Descriptive Statistics: Once combined can do bivariate analysis
       
3. data_clean:
   - where all the mid-point and processed datasets are stored including the final dataset: FULL_DATASET
     
4. did_models:
   - "DiD Parallel Trends & Event Study"; this is where the graphs are generated and the event studies
   - "DiD Models (1.1 - 9.1) - All Regions"; this is not updated with the new names
     
5. output:
   - empty at the moment

