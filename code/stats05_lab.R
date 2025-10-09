
# ANOVA practice ----------------------------------------------------------



##Q1 The data set consists of two columns: weight, group. Create figures similar to Figure 11.1.

# Load necessary libraries
library(tidyverse)

# Load the built-in dataset
data("PlantGrowth")

# Violin and jitter plot
PlantGrowth %>%
  ggplot(aes(x = group, y = weight)) +
  geom_violin(draw_quantiles = 0.5, alpha = 0.2, fill = "steelblue") +
  geom_jitter(width = 0.1) +
  theme_bw()

##Q2 Conduct an ANOVA to examine whether there are differences in weight among the different group.

# View the structure of the dataset
str(PlantGrowth)

# Perform one-way ANOVA
anova_model <- aov(weight ~ group, data = PlantGrowth)

# Summary of the ANOVA
summary(anova_model)

##Q3 Discuss what values to be reported in a scientific article?
#A one-way ANOVA revealed a significant effect of 
#treatment group on plant weight (F(2, 27) = 4.35, p = 0.023). 
#Mean weights were 5.03 ± 0.25 g for control, 5.87 ± 0.30 g for treatment A,
#and 6.12 ± 0.28 g for treatment B.

##pwr package

pwr::pwr.anova.test(k = 3,
                    f = 0.5,
                    sig.level = 0.05,
                    power = 0.8)

#change k, f, power, one at a time

## see how these changes affect the number of samples you may need

pwr::pwr.anova.test(k = 6,
                    f = 0.5,
                    sig.level = 0.05,
                    power = 0.8)
## - decrease in f
## - increase in power

pwr::pwr.anova.test(k = 5,
                    f = 0.27,
                    sig.level = 0.05,
                    power = 0.8)

pwr::pwr.anova.test(k = 3,
                    f = 0.5,
                    sig.level = 0.05,
                    power = 0.9)
#leave power blank
pwr::pwr.anova.test(k = 5,
                    n = 5,
                    f = 0.5)
#try different levels of k, n, f

pwr::pwr.anova.test(k = 7,
                    n = 5,
                    f = 0.4)

pwr::pwr.anova.test(k = 4,
                    n = 5,
                    f = 0.6)

pwr::pwr.anova.test(k = 4,
                    n = 8,
                    f = 0.6)