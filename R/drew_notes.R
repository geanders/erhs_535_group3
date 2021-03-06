library(tidyverse)
library(readxl)
?ggplot
cmax <- read_excel("data/DRUG_CLASS_I_Mean_Cmax_Trough_Efficacy_R_DATA_ANALYSIS.xlsx",
                   sheet = "Mean_PK_Efficacy_In vitro", skip = 1, n_max = 12)

trough <- read_excel("data/DRUG_CLASS_I_Mean_Cmax_Trough_Efficacy_R_DATA_ANALYSIS.xlsx",
                     sheet = "Mean_PK_Efficacy_In vitro", skip = 16, n_max = 12)
# grouping by ELU
cmax_group <- gather(cmax, key= outcome, value = value_outcome, ELU:ESP)

group_test <- gather(cmax_group, key = variable, value = value_variable, PLA:SLE)

group_test%>% 
  #filter(outcome =="ESP") %>% 
  mutate(value_variable = as.numeric(value_variable)) %>% 
  ggplot()+
  geom_histogram(aes( x = value_variable))+
  facet_wrap(~variable)

?arrange
?geom_histogram()
str(group_test)
?facet_wrap
