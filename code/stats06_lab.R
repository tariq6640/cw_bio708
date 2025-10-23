
# Exercise 1 --------------------------------------------------------------

##Develop regression models for each species seperately

pacman::p_load(tidyverse,
               patchwork,
               here)


df_setosa <- iris %>% filter(Species == "setosa")
df_versicolor <- iris %>% filter(Species == "versicolor")
df_virginica <- iris %>% filter(Species == "virginica")

# Fit models manually
model_setosa <- lm(Sepal.Width ~ Petal.Width, data = df_setosa)
model_versicolor <- lm(Sepal.Width ~ Petal.Width, data = df_versicolor)
model_virginica <- lm(Sepal.Width ~ Petal.Width, data = df_virginica)

# View summaries
summary(model_setosa)
summary(model_versicolor)
summary(model_virginica)

# Loop approach ----------------------------------------------------------
species_list <- unique(iris$Species)
model_list <- list()

for (i in seq_along(species_list)) {
  species_data <- iris %>% filter(Species == species_list[i])
  model_list[[species_list[i]]] <- lm(Sepal.Width ~ Petal.Width, data = species_data)
}

# View summaries from loop
lapply(model_list, summary)

# exercise 2 --------------------------------------------------------------

## select one of the species in `iris`, and compare between:
## model 1: Petal.Width only
## model 2: Petal.Width and Petal.Length


# Filter data for versicolor
df_versicolor <- iris %>% filter(Species == "versicolor")

# Model 1: Sepal.Width ~ Petal.Width
model1 <- lm(Sepal.Width ~ Petal.Width, data = df_versicolor)

# Model 2: Sepal.Width ~ Petal.Width + Petal.Length
model2 <- lm(Sepal.Width ~ Petal.Width + Petal.Length, data = df_versicolor)

# Compare summaries
summary(model1)  
summary(model2)  

##Excercise 3 

##create a new random variable x
v_x <- rnorm(nrow(iris), mean = 0, sd = 1)
iris <- iris %>% 
  mutate(x = v_x)

## `x` is a random variable, so no relevance to iris data
## include this `x` in one of the models you developed in exercise 1
## then investigate whether x improves R^2 or not.

v_x <- rnorm(nrow(iris), mean = 0, sd = 1)

# Add x to the iris dataset
iris <- iris %>% mutate(x = v_x)

# Filter for versicolor species
df_versicolor <- iris %>% filter(Species == "versicolor")

# Model without x
model_without_x <- lm(Sepal.Width ~ Petal.Width, data = df_versicolor)

# Model with x
model_with_x <- lm(Sepal.Width ~ Petal.Width + x, data = df_versicolor)

# Compare summaries
summary(model_without_x) 
summary(model_with_x)    

# Visualize Sepal.Width vs x
plot(df_versicolor$x, df_versicolor$Sepal.Width,
     main = "Sepal.Width vs Random Variable x",
     xlab = "x (random)", ylab = "Sepal.Width",
     col = "darkgreen", pch = 19)










































# Load the iris dataset
data(iris)

# Split the dataset by species


setosa <- filter(iris, Species == "setosa")
versicolor <- filter(iris, Species == "versicolor")
virginica <- filter(iris, Species == "virginica")


# Perform linear regression for each species
model_setosa <- lm(Sepal.Length ~ Petal.Width, data = setosa)
model_versicolor <- lm(Sepal.Length ~ Petal.Width, data = versicolor)
model_virginica <- lm(Sepal.Length ~ Petal.Width, data = virginica)

# Display summaries of the models

print(summary(model_setosa))


print(summary(model_versicolor))


print(summary(model_virginica))



# excerise 2 --------------------------------------------------------------

##select one of the species in the iris and compare between:

##model 1: petal width only


# Load required package
library(dplyr)


# Filter for versicolor species using dplyr
versicolor <- iris %>% filter(Species == "versicolor")

# Model 1: Sepal.Length ~ Petal.Width
model1 <- lm(Sepal.Width ~ Petal.Width, data = versicolor)

# Model 2: Sepal.Length ~ Petal.Width + Petal.Length
model2 <- lm(Sepal.Width ~ Petal.Width + Petal.Length, data = versicolor)

# Display summaries

print(summary(model1))


print(summary(model2))


##compare the following
##regression estimate of the petal width
##R2 values (which model is better)


# Extract regression estimates for Petal.Width
coef_model1 <- coef(model1)["Petal.Width"]
coef_model2 <- coef(model2)["Petal.Width"]

# Extract R-squared values
r2_model1 <- summary(model1)$r.squared
r2_model2 <- summary(model2)$r.squared



# Excercise 3 -------------------------------------------------------------

v_x <- rnorm(nrow(iris), mean = 0, sd = 1)
iris <- iris %>% 
  mutate(x = v_x)

df_ver <- iris %>% 
  filter(Species == "versicolor")

m_ver <- lm(Sepal.Width ~ Petal.Width,
            df_ver)

m_ver_w_x <- lm(Sepal.Width ~ Petal.Width + x,
                df_ver)
summary(m_ver) 
summary(m_ver_w_x)

## x is a random variable
##include this x in one of the model you develop in excercise 1
##then investiagte whether x imrpoves R2 or not


# Add a random variable x
v_x <- rnorm(nrow(iris), mean = 0, sd = 1)
iris <- iris %>% mutate(x = v_x)

# Filter for versicolor species
versicolor <- filter(iris, Species == "versicolor")

# Original Model 2: Sepal.Length ~ Petal.Width + Petal.Length
model2 <- lm(Sepal.Length ~ Petal.Width + Petal.Length, data = versicolor)

# New Model with x included
model3 <- lm(Sepal.Length ~ Petal.Width + Petal.Length + x, data = versicolor)

# Compare R-squared values
r2_model2 <- summary(model2)$r.squared
r2_model3 <- summary(model3)$r.squared

# Print comparison
summary(r2_model2)
summary(r2_model3)



