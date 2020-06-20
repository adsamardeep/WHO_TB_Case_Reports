library(readr)
library(tidyr)
library(dplyr)
library(outliers)
#Read WHO Data
#The WHO Data has been read in and displayed below.

setwd("C:/Users/Amar/Documents/GitHub/WHO_TB_Case_Reports/data")
WHO <- read_csv("WHO.csv")
## Parsed with column specification:
## cols(
##   .default = col_double(),
##   country = col_character(),
##   iso2 = col_character(),
##   iso3 = col_character()
## )
## See spec(...) for full column specifications.
WHO
#Tidy Task 1:
 # After investigating the original dimensions, the WHO data has been reshaped as requested below.

dim(WHO)
WHO <- WHO %>% gather(new_sp_m014:newrel_f65, key = "code", value = "value")
WHO

#Tidy Task 2:
 # The WHO data has been reshaped as requested below.

WHO <- WHO %>% separate(col = code , into = c("new","var","sex/age"), sep = "_")  %>% separate(col = "sex/age", into = c("sex","age"), sep = 1)
WHO

#Tidy Task 3:
  #The WHO data has been reshaped as requested below.

WHO <- WHO %>% spread(key = "var", value = "value")
WHO

#Tidy Task 4:
  #The variables age and sex have been factorised below using mutate(). Labels have also been added to the age variable.

WHO <- WHO %>% mutate(sex = factor(sex, levels = c("f", "m")), age = factor(age, levels = c("014", "1524", "2534", "3544", "4554", "5564", "65"),
                                                                            labels = c("<15","15-24","25-34","35-44","45-54","55-64","65>="), ordered = TRUE))
str(WHO$sex)
str(WHO$age)
WHO

#Task 5: Filter & Select
#The variables iso2 and new have been removed from the data, the data has then been subset to include only three countries (Chad, Albania and Japan).

WHO_subset <- WHO %>% select(-iso2, -new) %>% filter(WHO$country == "Chad" | WHO$country == "Albania" | WHO$country == "Japan")
WHO_subset









