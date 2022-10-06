## Initializing tidyverse, dplyr, DataExplorer library.
library(tidyverse, dplyr)
library(DataExplorer)

#installing janitor library and initialize it
install.packages("janitor", dependencies = TRUE)
library(janitor)

#installing here library
install.packages("here")

#Taking a look at the data, and add it to the environment.
read_csv("./data/menu.csv")
full_menu_data <- read_csv("./data/menu.csv")
menu_data <- read_csv("./data/menu.csv")
#Making EDA report.
create_report(menu_data, 
              output_file = "menu_EDA_r2.html", 
              output_dir = "~/Documents/individual-assignment-2-ibrahim-g7/src/")
#From the EDA report we note the following:

#1_260 observation, with 24 variable.

#2_No missing data.

#3_Calories, carbohydrates, and carbohydrates %daily value 
#  have symmetrical distributions.

#4_Calories from fat, cholesterol, sugars, total fat, protien, 
#  and their respective %daily values have right skewed distribution.


#Variables of interest are:
#1. Serving size    2.Calories    3.Total fat   4.Total fat %daily value
#5. Carbohydrates   6.Carbohydrates %daily value  7.Sugar   8.Protein 
#9. Category        10. item
#I think these variable could give us an insight on how impactful McDonald's meal on weight.


#cleaning the variable names
menu_data %>% 
  clean_names() -> menu_data

#selecting variable of interest 
menu_data %>% 
  select(category, item, serving_size,
         calories, total_fat, total_fat_percent_daily_value,
         carbohydrates, carbohydrates_percent_daily_value,
         sugars, protein) -> menu_data


#separating the data based on category 

#breakfast data
menu_data %>% 
  filter(category == "Breakfast") -> breakfast_menu

#beef and pork data
menu_data %>% 
  filter(category == "Beef & Pork") -> beef_pork_menu

#chicken and fish data
menu_data %>% 
  filter(category == "Chicken & Fish") -> chicken_fish_menu

#salads data
menu_data %>% 
  filter(category == "Salads") -> salads_menu

#snacks and sides data
menu_data %>% 
  filter(category == "Snacks & Sides") -> snacks_sides_menu

#desserts data
menu_data %>% 
  filter(category == "Desserts") -> desserts_menu

#beverages data
menu_data %>% 
  filter(category == "Beverages") -> beverages_menu

#coffee and tea menu
menu_data %>% 
  filter(category == "Coffee & Tea") -> coffee_tea_menu

#smoothies and shakes menu
menu_data %>% 
  filter(category == "Smoothies & Shakes") -> smoothies_shakes_menu

#########

ggplot(full_menu_data, aes(x=category, y))


summary(menu_df)

#Making EDA report.
create_report(menu_df, 
              output_file = "menu_EDA.html", 
              output_dir = "~/Documents/individual-assignment-2-ibrahim-g7/src/")



menu_df %>%
  keep(is.numeric) %>% 
  gather() %>% 
  ggplot(aes(value)) +
  facet_wrap(~ key, scales = "free") +
  geom_histogram(bins=30) 