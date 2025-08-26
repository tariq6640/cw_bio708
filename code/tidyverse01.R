library(tidyverse)

set.seed(123)

iris_sub <- as_tibble(iris) %>% 
  group_by(Species) %>% 
  sample_n(3) %>% 
  ungroup()

print(iris_sub)


# Row manipulation --------------------------------------------------------


filter(iris_sub, Species == "virginica")

filter(iris_sub, Species %in% c("virginica", "versicolor"))
filter(iris_sub, Species != "virginica")
filter(iris_sub, !(Species %in% c("virginica", "versicolor")))
filter(iris_sub, Sepal.Length > 5)
filter(iris_sub, Sepal.Length >= 5)
filter(iris_sub, Sepal.Length < 5)

filter(iris_sub, Sepal.Length <= 5)
# Sepal.Length is less than 5 AND Species equals "setosa"
filter(iris_sub,
       Sepal.Length < 5 & Species == "setosa")
# same; "," works like "&"
filter(iris_sub,
       Sepal.Length < 5, Species == "setosa")
# Either Sepal.Length is less than 5 OR Species equals "setosa"
filter(iris_sub,
       Sepal.Length < 5 | Species == "setosa")
arrange(iris_sub, Sepal.Length)
arrange(iris_sub, desc(Sepal.Length))


# Column manipulation -----------------------------------------------------


select(iris_sub, Sepal.Length)
select(iris_sub, c(Sepal.Length, Sepal.Width))
select(iris_sub, -Sepal.Length)
select(iris_sub, -c(Sepal.Length, Sepal.Width))
# select columns starting with "Sepal"
select(iris_sub, starts_with("Sepal"))
# remove columns starting with "Sepal"
select(iris_sub, -starts_with("Sepal"))
# select columns ending with "Sepal"
select(iris_sub, ends_with("Width"))
# remove columns ending with "Sepal"
select(iris_sub, -ends_with("Width"))
# nrow() returns the number of rows of the dataframe
(x_max <- nrow(iris_sub))
# create a vector from 1 to x_max
x <- 1:x_max

# add as a new column
# named `x` as `row_id` when added
mutate(iris_sub, row_id = x)
# twice `Sepal.Length` and add as a new column
mutate(iris_sub, sl_two_times = 2 * Sepal.Length)


# Piping ------------------------------------------------------------------

df_sl <- select(iris_sub, sepal.length)
df_vir <- filter(iris_sub, Species == "virginica")
df_vir_sl <- select(df_vir, Sepal.Length)

print(df_vir_sl)
df_vir_sl <- iris_sub %>% 
  filter(Species == "virginica") %>% 
  select(Sepal.Length)

print(df_vir_sl)


# Grouping ----------------------------------------------------------------

print(iris_sub)
iris_sub %>% 
  group_by(Species)
iris_sub %>% 
  group_by(Species) %>% 
  summarize(mu_sl = mean(Sepal.Length))
iris_sub %>% 
  group_by(Species) %>% 
  summarize(mu_sl = mean(Sepal.Length), sum_sl = sum(Sepal.Length))
# grouping by "Species", then take means "Speal.Length" for each species
iris_sub %>% 
  group_by(Species) %>% mutate(mu_sl = mean(Sepal.Length)) %>% ungroup()


# Reshape -----------------------------------------------------------------

iris_w <- iris %>% mutate(id = rep(1:50, 3)) %>%select(id, Sepal.Length, Species) %>% 
pivot_wider(id_cols = "id", values_from = "Sepal.Length", names_from = "Species")

print(iris_w)

iris_l <- iris_w %>% pivot_longer(cols = c("setosa","versicolor","virginica"),names_to = "Species", values_to = "Sepal.Length") 

print(iris_l)



# Join --------------------------------------------------------------------

df1 <- tibble(Species = c("A", "B", "C"),x = c(1, 2, 3))

df2 <- tibble(Species = c("A", "B", "C"),y = c(4, 5, 6))

left_join(x = df1,y = df2,by = "Species")


df3 <- tibble(Species = c("A", "A", "B", "C"),y = c(4, 5, 6, 7))

left_join(x = df1,y = df3,by = "Species")


df4 <- tibble(Species = c("A", "A", "C"),y = c(4, 5, 7))

left_join(x = df1,y = df4,by = "Species")


df5 <- tibble(Species = c("A", "B", "C"),x = c(1, 2, 3), z = c("cool", "awesome", "magical"))

left_join(x = df1,y = df5,by = c("Species", "x"))


df6 <- tibble(Species = c("A", "A", "B", "C"),x = c(1, 1, 2, 3),z = c("cool", "cool", "awesome", "magical"))

left_join(x = df1,y = df6,by = c("Species", "x"))


df6 <- tibble(Species = c("A", "B", "C"),x = c(1, 2, 4),z = c("cool", "awesome", "magical"))

left_join(x = df1, y = df6,by = c("Species", "x"))
