# import library
library(dplyr)
library(readr)

# load dataset
pop_data <- read.csv("dataset/population_dataset/pop_data_cleaned.csv")
pop_data <- pop_data %>% 
   select(location_id, location_name, Age, year, popsize)



# define path amr
path_amr <- "C:/Users/symou/Desktop/Global_Burden_of_Antimicrobial_Resistance/dataset/amr_dataset"

amr_files <- list.files(path_amr, pattern = "\\.csv$", 
                        full.names = TRUE, recursive = TRUE)

amr_data <- bind_rows(lapply(amr_files, read_csv))

# run very fast this code
#library (data.table)
#amr_data_1 <- rbindlist(
 #  lapply(amr_files, fread),
  # fill = TRUE
#)

df <- amr_data %>% left_join(
   pop_data, by = c("Location" = "location_name", "Age", "Year" = "year")
) %>%
   mutate(bug_drug = paste(Pathogen, `Antibiotic class`, sep = "_")) %>%
   mutate(metric = paste(Counterfactual, Measure, sep = "_")) %>%
   select(-c(3:8), -c(11:13)) %>%
   
   # creating a priority group for a data
   mutate(priority_group = case_when(
      # Critical priority
      bug_drug %in% c(
         "Klebsiella pneumoniae_Carbapenems",
         "Escherichia coli_Third-generation cephalosporins",
         "Acinetobacter baumannii_Carbapenems",
         "Mycobacterium tuberculosis_Resistance to one or more antibiotics",
         "Mycobacterium tuberculosis_Extensive drug resistance in TB",
         "Mycobacterium tuberculosis_Multi-drug resistance excluding extensive drug resistance in TB",
         "Escherichia coli_Carbapenems",
         "Klebsiella pneumoniae_Third-generation cephalosporins",
         "Enterobacter spp._Carbapenems",
         "Citrobacter spp._Third-generation cephalosporins",
         "Proteus spp._Third-generation cephalosporins",
         "Serratia spp._Third-generation cephalosporins",
         "Morganella spp._Third-generation cephalosporins"
      ) ~ "Critical",
      
      # High priority
      bug_drug %in% c(
         "Salmonella enterica serovar Typhi_Fluoroquinolones",
         "Shigella spp._Fluoroquinolones",
         "Enterococcus faecium_Vancomycin",
         "Pseudomonas aeruginosa_Carbapenems",
         "Non-typhoidal Salmonella_Fluoroquinolones",
         "Neisseria gonorrhoeae_Fluoroquinolones",
         "Staphylococcus aureus_Methicillin",
         "Neisseria gonorrhoeae_Third-generation cephalosporins"
      ) ~ "High",
      
      # Medium priority
      bug_drug %in% c(
         "Group A Streptococcus_Macrolides",
         "Streptococcus pneumoniae_Macrolides",
         "Haemophilus influenzae_Aminopenicillin",
         "Group B Streptococcus_Penicillin"
      ) ~ "Medium",
      
      # Default if no match
      TRUE ~ "Not priority"
   ))



library(dplyr)

df_agg <- df %>%
   mutate(
      Age_new = case_when(
         Age %in% c("1-5 months",
                    "6-11 months",
                    "12 to 23 months",
                    "2 to 4") ~ "0-4",
         TRUE ~ Age
      )
   ) %>%
   group_by(Location, Year, bug_drug, metric, priority_group, Age_new) %>%
   summarise(
      deaths = sum(Value),
      population = sum(popsize),
      .groups = "drop"
   ) %>%
   mutate(
      rate = deaths / population   # age-specific rate
   ) %>%
   rename(Age = Age_new)
