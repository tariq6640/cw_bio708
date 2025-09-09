library(tidyverse)

set.seed(123)

iris_sub <- as_tibble(iris) %>% 
  group_by(Species) %>% 
  sample_n(3) %>% 
  ungroup()

print(iris_sub)


# Refresher ---------------------------------------------------------------

#exercise 1
#filter iris_sub to those with Sepal.Length greater than 5
#assign to df_g5
#excercise 2
#select columns of Sepal.Length and Petal. Width from iris_sub
#assign to df_sp
#exercise 3
#arrange rows by Petal.Width in iris_sub
#assign to df_arrange
#exercise 4
#do exercise 1-3 at once with pipes
#assign to df_master


# Exercise 1 --------------------------------------------------------------

(df_g5<-filter(iris_sub, Sepal.Length>5))
(df_g5 <- iris %>%
  filter(Sepal.Length > 5))

# Exercise 2
df_sp <- iris_sub %>%
  select(Sepal.Length, Petal.Width)
print(df_sp)

# Exercise 3
df_arrange <- iris_sub %>%
  arrange(Petal.Width)
print(df_arrange)

# Combined Exercise 1–3
df_master <- iris %>%
  filter(Sepal.Length > 5) %>%         # Exercise 1
  select(Sepal.Length, Petal.Width) %>%# Exercise 2
  arrange(Petal.Width)                 # Exercise 3
print(df_master)

#extra
#calculate mean Petal.Width for each Species separately
#use group_by () and summarize () functions

# Calculate mean Petal.Width for each Species
iris %>%
  group_by(Species) %>%
  summarize(mean_petal_width = mean(Petal.Width))



# ggplot ------------------------------------------------------------------

(g_example <- ggplot(data = iris,
       mapping = aes(x = Sepal.Length,
                     y = Sepal.Width)) + geom_point())



## with pipe
(g_example <- iris %>% 
  ggplot(mapping = aes(x = Sepal.Length,
                       y = Sepal.Width)) + geom_point())

#color

iris %>% 
  ggplot(aes(x = Sepal.Length,
             y = Sepal.Width,
             color = Species)) +
  geom_point()

#pitfall, when ou color points or anything

#iris %>% 
 # ggplot(aes(x = Sepal.Length,
  #           y = Sepal.Width),
   #          color = Species) +
  #geom_point()

g_scol <- iris %>% 
  ggplot(aes(x = Sepal.Length,
             y = Sepal.Width))+
  geom_point(color = "salmon")

#line plot

# sample data
df0 <- tibble(x = rep(1:50, 3),
              y = x * 2)


df0 %>% 
  ggplot(aes(x = x,
             y = y)) +
  geom_line()

#histogram

# basic plot; bins = 30 by default
iris %>% 
  ggplot(aes(x = Sepal.Length)) +
  geom_histogram()

# Colored histogram by Species
iris %>%
  ggplot(aes(x = Sepal.Length, fill = Species)) +
  geom_histogram(position = "identity", alpha = 0.6, bins = 30)

# Colored histogram by Species
iris %>%
  ggplot(aes(x = Sepal.Length, fill = Species)) +
  geom_histogram()


#box plot

# basic plot
iris %>% 
  ggplot(aes(x = Species,
             y = Sepal.Length)) +
  geom_boxplot()

# change fill by "Species"
iris %>% 
  ggplot(aes(x = Species,
             y = Sepal.Length,
             fill = Species)) +
  geom_boxplot()

#use multiple layers
#example 1
iris %>% 
  ggplot(aes(x = Species,
             y = Sepal.Length,
             fill = Species)) +
  geom_boxplot() + geom_point()

#example 2

iris %>% 
  ggplot(aes(x = Species,
             y = Sepal.Length,
             fill = Species)) +
  geom_boxplot() + geom_jitter(alpha=0.25) +
  guides(fill = "none")
