library(tidyverse)

set.seed(123)

iris_sub <- as_tibble(iris) %>% 
  group_by(Species) %>% 
  sample_n(3) %>% 
  ungroup()

print(iris_sub)


# Group operation ---------------------------------------------------------



iris_sub %>% 
  group_by(Species)

##combine group_by() with summarize()

df_m_sd <- iris_sub %>% 
  group_by(Species) %>% 
  summarize(mean_sl = mean(Sepal.Length),
            sum_sl = sum(Sepal.Length))

# grouping by "Species", then take means "Speal.Length" for each species
df_eps <- iris_sub %>% 
  group_by(Species) %>% 
  mutate(mean_sl = mean(Sepal.Length)) %>% 
  ungroup() %>%
  mutate(eps = abs(Sepal.Length - mean_sl))

# Reshape -----------------------------------------------------------------

iris_sub <- iris %>% 
  mutate(id = rep(1:50, 3)) %>% # add an ID column
  select(id, Sepal.Length, Species) %>% 
 
  ##Reshape to wider format
   pivot_wider(id_cols = "id", # unique row ID based on
              values_from = "Sepal.Length", # values in each cell from
              names_from = "Species") # new column names from

print(iris_sub)

##Reshape to longer format

iris_l <- iris_sub %>% 
  pivot_longer(cols = c("setosa",
                        "versicolor",
                        "virginica"), # columns with values to be reshaped
               names_to = "Species", # column IDs move to "Species"
               values_to = "Sepal.Length") # column values move to "Sepal.Length"

print(iris_l)
