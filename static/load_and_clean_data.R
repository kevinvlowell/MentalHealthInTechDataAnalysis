source(
  here::here("static", "load_and_clean_data.R"),
  echo = FALSE # Use echo=FALSE or omit it to avoid code output  
)

suppressPackageStartupMessages(library(tidyverse))

## Load in the datasets
data2016_original <- suppressWarnings(read_csv(here::here("dataset", "2016_mh_data_original.csv")))
data2018_original <- suppressWarnings(read_csv(here::here("dataset", "2018_mh_data_original.csv")))


## Rename 2016 variables
data2016_recode <- data2016_original %>% rename(c(
  "self_employed" = "Are you self-employed?",
  
  "company_size"	= "How many employees does your company or organization have?",
  
  "tech_company"	= "Is your employer primarily a tech company/organization?",
  
  "has_tech_role_in_company"	= "Is your primary role within your company related to tech/IT?",
  
  "employer_provides_mh_coverage"	="Does your employer provide mental health benefits as part of healthcare coverage?",
  
  "knows_employer_mh_coverage_options" = "Do you know the options for mental health care available under your employer-provided coverage?",
  
  "employer_has_discussed_mh_formally"="Has your employer ever formally discussed mental health (for example, as part of a wellness campaign or other official communication)?",
  
  "employer_has_mh_resources_and_options" = "Does your employer offer resources to learn more about mental health concerns and options for seeking help?",
  
  "anonymity_guaranteed" = "Is your anonymity protected if you choose to take advantage of mental health or substance abuse treatment resources provided by your employer?",
  
  "difficulty_asking_for_mh_related_medical_leave"="If a mental health issue prompted you to request a medical leave from work, asking for that leave would be:",
  
  "would_discussing_mh_w_employer_have_negative_effects"	= "Do you think that discussing a mental health disorder with your employer would have negative consequences?",
  
  "would_discussing_ph_w_employer_have_negative_effects"="Do you think that discussing a physical health issue with your employer would have negative consequences?",
  
  "comfortable_discussing_mh_with_coworkers"="Would you feel comfortable discussing a mental health disorder with your coworkers?",
  
  "comfortable_discussing_mh_with_supervisors" =  "Would you feel comfortable discussing a mental health disorder with your direct supervisor(s)?",
  
  "employer_takes_mh_as_seriously_as_ph"	= "Do you feel that your employer takes mental health as seriously as physical health?",
  
  "has_heard_of_or_observed_negative_effects_of_opennes"	="Have you heard of or observed negative consequences for co-workers who have been open about mental health issues in your workplace?",
  
  "has_medical_coverage_mhd_included" = "Do you have medical coverage (private insurance or state-provided) which includes treatment of  mental health issues?",
  
  "knows_local_or_online_mhd_resources"="Do you know local or online resources to seek help for a mental health disorder?",
  
  "revealed_mhd_to_clients_or_business_contacts"="If you have been diagnosed or treated for a mental health disorder, do you ever reveal this to clients or business contacts?",
  
  "negative_impact_of_revealing_mhd_to_clients_contacts"= "If you have revealed a mental health issue to a client or business contact, do you believe this has impacted you negatively?",
  
  "has_reaveled_mhd_to_coworkers"	= "If you have been diagnosed or treated for a mental health disorder, do you ever reveal this to coworkers or employees?",
  
  "negative_impact_of_revealing_mhd_to_coworkers"	="If you have revealed a mental health issue to a coworker or employee, do you believe this has impacted you negatively?",
  
  "productivity_affected_by_mh"	= "Do you believe your productivity is ever affected by a mental health issue?",
  
  "percentage_of_work_time_affected_by_mh" = "If yes, what percentage of your work time (time performing primary or secondary job functions) is affected by a mental health issue?",
  
  "previous_employers"="Do you have previous employers?",
  
  "prev_employer_provided_mh_coverage"="Have your previous employers provided mental health benefits?",
  
  "knew_prev_employer_mh_coverage_options" ="Were you aware of the options for mental health care provided by your previous employers?",
  
  "prev_employer_discussed_mh_formally"	= "Did your previous employers ever formally discuss mental health (as part of a wellness campaign or other official communication)?",
  
  "prev_employer_had_mh_resources_and_options"	= "Did your previous employers provide resources to learn more about mental health issues and how to seek help?",
  
  "prev_employer_anonymity_guaranteed" = "Was your anonymity protected if you chose to take advantage of mental health or substance abuse treatment resources with previous employers?",
  
  "would_discussing_mh_w_prev_employer_have_negative_effects"	= "Do you think that discussing a mental health disorder with previous employers would have negative consequences?",
  
  "would_discussing_ph_w_prev_employer_have_negative_effects"	= "Do you think that discussing a physical health issue with previous employers would have negative consequences?",
  
  "comfortable_discussing_mh_with_prev_coworkers"	= "Would you have been willing to discuss a mental health issue with your previous co-workers?",
  
  "comfortable_discussing_mh_with_prev_supervisors"	= "Would you have been willing to discuss a mental health issue with your direct supervisor(s)?",
  
  "prev_employer_took_mh_as_seriously_as_ph"	= "Did you feel that your previous employers took mental health as seriously as physical health?",
  
  "heard_of_or_observed_negative_effects_of_openness_prev_employer" = "Did you hear of or observe negative consequences for co-workers with mental health issues in your previous workplaces?",
  
  "willing_to_bring_up_ph_in_interview_y_n"	= "Would you be willing to bring up a physical health issue with a potential employer in an interview?",
  
  "willing_to_bring_up_ph_in_interview_y_n_reason"	= "Why or why not?",
  
  "willing_to_bring_up_mh_in_interview_y_n"= "Would you bring up a mental health issue with a potential employer in an interview?",
  
  "willing_to_bring_up_mh_in_interview_y_n_reason" = "Why or why not?_1",
  
  "would_identifying_w_mhd_hurt_career"	= "Do you feel that being identified as a person with a mental health issue would hurt your career?",
  
  "would_coworkers_view_you_more_negatively_if_mhd"	= "Do you think that team members/co-workers would view you more negatively if they knew you suffered from a mental health issue?",
  
  "openness_about_mhd_w_friends_family"="How willing would you be to share with friends and family that you have a mental illness?",
  
  "observed_or_experienced_unsupportiveness_or_bad_response"	= "Have you observed or experienced an unsupportive or badly handled response to a mental health issue in your current or previous workplace?",
  
  "observations_of_response_to_mhd_of_others_made_less_likely_to_reveal"= "Have your observations of how another individual who discussed a mental health disorder made you less likely to reveal a mental health issue yourself in your current workplace?",
  
  "family_history_of_mhd"	= "Do you have a family history of mental illness?",
  
  "had_mhd_past"	= "Have you had a mental health disorder in the past?",
  
  "has_mhd_now"	= "Do you currently have a mental health disorder?",
  
  "yes_had_mhd_condition_diagnosed"	= "If yes, what condition(s) have you been diagnosed with?",
  
  "maybe_had_mhd_condition_diagnosed"	= "If maybe, what condition(s) do you believe you have?",
  
  "had_mhd_diagnosed_by_professional"	= "Have you been diagnosed with a mental health condition by a medical professional?",
  
  "had_mhd_diagnosed_by_professional_condition_diagnosed"	= "If so, what condition(s) were you diagnosed with?",
  
  "has_sought_treatment_from_professional"	= "Have you ever sought treatment for a mental health issue from a mental health professional?",
  
  "mhd_interferes_with_work_when_effectively_treated"	= "If you have a mental health issue, do you feel that it interferes with your work when being treated effectively?",
  
  "mhd_interferes_with_work_when_not_effectively_treated"	= "If you have a mental health issue, do you feel that it interferes with your work when NOT being treated effectively?",
  
  "age"	= "What is your age?",
  
  "gender"	= "What is your gender?",
  
  "country_of_residence" = "What country do you live in?",
  
  "state_of_residence"	= "What US state or territory do you live in?",
  
  "country_of_work"	= "What country do you work in?",
  
  "state_of_work"	= "What US state or territory do you work in?",
  
  "work_position"	= "Which of the following best describes your work position?",
  
  "remote_work"	= "Do you work remotely?")
)


## Rearrange 2016 variables, placing demographic variables first
data2016_recode <- data2016_recode %>%  select(
  self_employed,
  company_size,
  tech_company,
  has_tech_role_in_company,
  employer_provides_mh_coverage,
  knows_employer_mh_coverage_options,
  previous_employers,
  age,
  gender,
  country_of_residence,
  state_of_residence,
  country_of_work,
  state_of_work,
  work_position,
  remote_work,
  family_history_of_mhd,
  had_mhd_past,
  has_mhd_now,
  yes_had_mhd_condition_diagnosed,
  maybe_had_mhd_condition_diagnosed,
  had_mhd_diagnosed_by_professional,
  had_mhd_diagnosed_by_professional_condition_diagnosed,
  has_sought_treatment_from_professional,
  mhd_interferes_with_work_when_effectively_treated,
  mhd_interferes_with_work_when_not_effectively_treated,
  everything()
)


## Rename 2018 variables to match the names in 2016
data2018_recode <- data2018_original %>% rename(c(
  "self_employed" = "<strong>Are you self-employed?</strong>",
  
  "company_size"	= "How many employees does your company or organization have?",
  
  "tech_company"	= "Is your employer primarily a tech company/organization?",
  
  "has_tech_role_in_company"	= "Is your primary role within your company related to tech/IT?",
  
  "employer_provides_mh_coverage"	="Does your employer provide mental health benefits as part of healthcare coverage?",
  
  "knows_employer_mh_coverage_options" = "Do you know the options for mental health care available under your employer-provided health coverage?",
  
  "employer_has_discussed_mh_formally"="Has your employer ever formally discussed mental health (for example, as part of a wellness campaign or other official communication)?",
  
  "employer_has_mh_resources_and_options" = "Does your employer offer resources to learn more about mental health disorders and options for seeking help?",
  
  "anonymity_guaranteed" = "Is your anonymity protected if you choose to take advantage of mental health or substance abuse treatment resources provided by your employer?",
  
  "difficulty_asking_for_mh_related_medical_leave" = "If a mental health issue prompted you to request a medical leave from work, how easy or difficult would it be to ask for that leave?",
  
  "comfortable_discussing_mh_with_coworkers"="Would you feel comfortable discussing a mental health issue with your coworkers?",
  
  "comfortable_discussing_mh_with_supervisors" =  "Would you feel comfortable discussing a mental health issue with your direct supervisor(s)?",
  
  "has_medical_coverage_mhd_included" = "Do you have medical coverage (private insurance or state-provided) that includes treatment of mental health disorders?",
  
  "knows_local_or_online_mhd_resources"="Do you know local or online resources to seek help for a mental health issue?",
  
  "revealed_mhd_to_clients_or_business_contacts"="<strong>If you have been diagnosed or treated for a mental health disorder, do you ever reveal this to clients or business contacts?</strong>",
  
  "negative_impact_of_revealing_mhd_to_clients_contacts"= "If you have revealed a mental health disorder to a client or business contact, how has this affected you or the relationship?",
  
  "productivity_affected_by_mh"	= "Do you believe your productivity is ever affected by a mental health issue?",
  
  "percentage_of_work_time_affected_by_mh" = "If yes, what percentage of your work time (time performing primary or secondary job functions) is affected by a mental health issue?",
  
  "previous_employers"="<strong>Do you have previous employers?</strong>",
  
  "prev_employer_provided_mh_coverage"="<strong>Have your previous employers provided mental health benefits?</strong>",
  
  "knew_prev_employer_mh_coverage_options" ="<strong>Were you aware of the options for mental health care provided by your previous employers?</strong>",
  
  "prev_employer_discussed_mh_formally"	= "Did your previous employers ever formally discuss mental health (as part of a wellness campaign or other official communication)?",
  
  "prev_employer_had_mh_resources_and_options"	= "Did your previous employers provide resources to learn more about mental health disorders and how to seek help?",
  
  "prev_employer_anonymity_guaranteed" = "Was your anonymity protected if you chose to take advantage of mental health or substance abuse treatment resources with previous employers?",
  
  "comfortable_discussing_mh_with_prev_coworkers"	= "<strong>Would you have been willing to discuss your mental health with your coworkers at previous employers?</strong>",
  
  "comfortable_discussing_mh_with_prev_supervisors"	= "Would you have been willing to discuss your mental health with your direct supervisor(s)?",
  
  "willing_to_bring_up_ph_in_interview_y_n"	= "Would you be willing to bring up a physical health issue with a potential employer in an interview?",
  
  "willing_to_bring_up_ph_in_interview_y_n_reason"	= "Why or why not?",
  
  "willing_to_bring_up_mh_in_interview_y_n"= "Would you bring up your mental health with a potential employer in an interview?",
  
  "willing_to_bring_up_mh_in_interview_y_n_reason" = "Why or why not?_1",
  
  "observed_or_experienced_unsupportiveness_or_bad_response"	= "<strong>Have you observed or experienced an unsupportive or badly handled response to a mental health issue in your current or previous workplace?</strong>",
  
  "observations_of_response_to_mhd_of_others_made_less_likely_to_reveal"= "Have your observations of how another individual who discussed a mental health issue made you less likely to reveal a mental health issue yourself in your current workplace?",
  
  "family_history_of_mhd"	= "Do you have a family history of mental illness?",
  
  "had_mhd_past"	= "Have you had a mental health disorder in the past?",
  
  "has_mhd_now"	= "Do you currently have a mental health disorder?",
  
  "had_mhd_diagnosed_by_professional"	= "Have you ever been diagnosed with a mental health disorder?",
  
  "has_sought_treatment_from_professional"	= "Have you ever sought treatment for a mental health disorder from a mental health professional?",
  
  "mhd_interferes_with_work_when_effectively_treated"	= "If you have a mental health disorder, how often do you feel that it interferes with your work <strong>when being treated effectively?</strong>",
  
  "mhd_interferes_with_work_when_not_effectively_treated"	= "If you have a mental health disorder, how often do you feel that it interferes with your work <strong>when</strong> <em><strong>NOT</strong></em><strong> being treated effectively (i.e., when you are experiencing symptoms)?</strong>",
  
  "age"	= "What is your age?",
  
  "gender"	= "What is your gender?",
  
  "country_of_residence" = "What country do you <strong>live</strong> in?",
  
  "state_of_residence"	= "What US state or territory do you <strong>live</strong> in?",
  
  "country_of_work"	= "What country do you <strong>work</strong> in?",
  
  "state_of_work"	= "What US state or territory do you <strong>work</strong> in?")
)


## Remove 2018 variables not included in 2016 survey, and rearrange variables to place demographic variables first
data2018_recode <- data2018_recode %>% transmute(
  self_employed,
  company_size,
  tech_company,
  has_tech_role_in_company,
  employer_provides_mh_coverage,
  knows_employer_mh_coverage_options,
  previous_employers,
  age,
  gender,
  country_of_residence,
  state_of_residence,
  country_of_work,
  state_of_work,
  family_history_of_mhd,
  had_mhd_past,
  has_mhd_now,
  had_mhd_diagnosed_by_professional,
  has_sought_treatment_from_professional,
  mhd_interferes_with_work_when_effectively_treated,
  mhd_interferes_with_work_when_not_effectively_treated,
  employer_has_discussed_mh_formally,
  employer_has_mh_resources_and_options,
  anonymity_guaranteed,
  difficulty_asking_for_mh_related_medical_leave,
  comfortable_discussing_mh_with_coworkers,
  comfortable_discussing_mh_with_supervisors,
  has_medical_coverage_mhd_included,
  knows_local_or_online_mhd_resources,
  revealed_mhd_to_clients_or_business_contacts,
  negative_impact_of_revealing_mhd_to_clients_contacts,
  productivity_affected_by_mh,
  percentage_of_work_time_affected_by_mh,
  prev_employer_provided_mh_coverage,
  knew_prev_employer_mh_coverage_options,
  prev_employer_discussed_mh_formally,
  prev_employer_had_mh_resources_and_options,
  prev_employer_anonymity_guaranteed,
  comfortable_discussing_mh_with_prev_coworkers,
  comfortable_discussing_mh_with_prev_supervisors,
  willing_to_bring_up_ph_in_interview_y_n,
  willing_to_bring_up_ph_in_interview_y_n_reason,
  willing_to_bring_up_mh_in_interview_y_n,
  willing_to_bring_up_mh_in_interview_y_n_reason,
  observed_or_experienced_unsupportiveness_or_bad_response,
  observations_of_response_to_mhd_of_others_made_less_likely_to_reveal)


## Recode relevant variables in both datasets for response format consistency

#change the response values in negative_impact_of_revealing_mhd_to_clients_contacts to match those in 2016

data2018_recode$negative_impact_of_revealing_mhd_to_clients_contacts <- 
  recode(data2018_recode$negative_impact_of_revealing_mhd_to_clients_contacts,
                                                                               "Negatively" = "Yes", 
                                                                               "Positively" = "No", 
                                                                               "No change" = "No")
#gender recode

male_list <- c("Cis male" = "M", "cis male" = "M", "Cis Male" = "M", "cis man" = "M",
               "Cis-male" = "M", "cisdude" = "M", "Cisgender male" = "M", "Dude" = "M",
               "I'm a man why didn't you make this a drop down question. You should of asked sex? And I would of answered yes please. Seriously how much text can this take?" = "M",
               "m" = "M", "M" = "M", "M|" = "M", "mail" = "M", "male" = "M", "Male" = "M",
               "MALE" = "M", "Male (cis)" = "M", "male, born with xy chromosoms" = "M", 
               "Male." = "M", "Malel" = "M", "Malr" = "M", "man" = "M", "Man" = "M",  
               "mtf" = "M", "Sex is male" = "M")

female_list <- c("*shrug emoji* (F)" = "F", "Cis female" = "F", "Cis woman" = "F", 
                 "Cis-Female" = "F", "Cis-woman" = "F", "cisgender female" = "F",
                 "Cisgender Female" = "F", "Cisgendered woman" = "F", "f" = "F", "F" = "F",
                 "fem" = "F", "female" = "F", "Female" = "F", "Female (cisgender)" = "F",
                 "Female (props for making this a freeform field, though)" = "F", 
                 "Female assigned at birth" = "F", "Female or Multi-Gender Femme" = "F", 
                 "female-bodied; no feelings about gender" = "F", "female/woman" = "F", 
                 "fm" = "F", "I identify as female" = "F", "I identify as female." = "F", 
                 "woman" = "F", "Woman" = "F")

non_binary_list <- c("AFAB" = "GQ","Agender" = "GQ","Androgynous" = "GQ", "Bigender" = "GQ",
                     "Demiguy" = "GQ", "Enby" = "GQ", "Female/gender non-binary." = "GQ",
                     "Fluid" = "GQ", "genderfluid" = "GQ", "gender non-conforming woman" = "GQ",
                     "Genderfluid" = "GQ", "Genderfluid (born female)" = "GQ",
                     "Genderflux demi-girl" = "GQ", "genderqueer" = "GQ", "Genderqueer" = "GQ",
                     "genderqueer woman" = "GQ", "human" = "GQ", "Human" = "GQ", 
                     "Male (or female, or both)" = "GQ", "Male (trans, FtM)" = "GQ", 
                     "male 9:1 female, roughly" = "GQ", "Male/genderqueer" = "GQ", 
                     "N/A" = "GQ", "NB" = "GQ", "nb masculine" = "GQ", "non binary" = "GQ",
                     "non-binary" = "GQ", "Nonbinary" = "GQ", "Nonbinary/femme" = "GQ", 
                     "none" = "GQ", "none of your business" = "GQ", "Ostensibly Male" = "GQ", 
                     "Other" = "GQ", "Other/Transfeminine" = "GQ", "Queer" = "GQ", 
                     "She/her/they/them" = "GQ", "SWM" = "GQ", "Trans female" = "GQ", 
                     "Trans man" = "GQ", "Trans woman" = "GQ", "transgender" = "GQ",
                     "Transgender woman" = "GQ", "Transitioned, M2F" = "GQ", "Unicorn" = "GQ")

data2016_recode$gender <- recode(data2016_recode$gender, !!!male_list, !!!female_list, !!!non_binary_list)

data2018_recode$gender <- recode(data2018_recode$gender, !!!male_list, !!!female_list, !!!non_binary_list)


## Add year data to both data sets
data2016_recode <- data2016_recode %>% 
  mutate("year" = "2016") %>% 
  select(year, everything())

data2018_recode <- data2018_recode %>% 
  mutate("year" = "2018") %>% 
  select(year, everything())


## Split datasets into demographic and survey sets
data2016_demographics <- data2016_recode %>% select(1:26)
data2016_survey <- data2016_recode %>% select(1, 27:64)

data2018_demographics <- data2018_recode %>% select(1:21)
data2018_survey <- data2018_recode %>% select(1, 22:46)


## Combine full, recoded datasets based on shared variables
all_common_variables <- intersect(colnames(data2016_recode), colnames(data2018_recode))
combined_data <- rbind(data2016_recode[, all_common_variables], data2018_recode[, all_common_variables])

## Combine survey and demographic datasets based on shared variables
common_demographic_variables <- intersect(colnames(data2016_demographics), colnames(data2018_demographics))
combined_demographic_data <- rbind(data2016_demographics[, common_demographic_variables], data2018_demographics[, common_demographic_variables])

common_survey_variables <- intersect(colnames(data2016_survey), colnames(data2018_survey))
combined_survey_data <- rbind(data2016_survey[, common_survey_variables], data2018_survey[, common_survey_variables])


## Write finished data to .csv files
write_csv(data2016_recode, "2016_mental_health_in_tech_names_recoded.csv")

write_csv(data2016_demographics, "2016_demographics_names_recoded.csv")

write_csv(data2016_survey, "2016_survey_names_recoded.csv")

write_csv(data2018_recode, "2018_mental_health_in_tech_names_recoded.csv")

write_csv(data2018_demographics, "2018_demographics_names_recoded.csv")

write_csv(data2018_survey, "2018_survey_names_recoded.csv")
