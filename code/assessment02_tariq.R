library(tidyverse)
df_iris <- as_tibble(iris)
nrow(df_iris) # return 150
df_iris %>% 
  group_by(Species) %>% 
  summarize(n_sample = n())
df_s3 <- df_iris %>% 
  filter(Species == "versicolor") %>% 
  sample_n(size = 3)
df_s3 %>% 
  pull(Petal.Width) %>% 
  mean()

#Q1. Create a `for` loop (with loop index `i`) to perform the following steps for 100 iterations:
#    a. Randomly sample 5 individuals of "versicolor".
#    b. Calculate the mean of their "Petal.Width" values.
#    c. Assign the result to `mu5[i]`. 
#       (Hint: initialize an empty object `mu5` before starting the loop.)
#    This procedure will yield 100 estimates of the mean Petal.Width from 5 individuals.

#Answer: 

# Load the iris dataset
data(iris)

# Filter for "versicolor" species
versicolor_data <- iris %>% filter(Species == "versicolor")

# Initialize empty vector to store means
mu5 <- numeric(100)

# Loop to sample and calculate mean Petal.Width
for (i in 1:100) {
  sampled <- versicolor_data %>% sample_n(5)
  mu5[i] <- mean(sampled$Petal.Width)}

mu5

#Q2. Calculate the standard deviation of `mu5` and assign it to `s_mu5`.

# standard deviation of mu5
s_mu5 <- sd(mu5)

# print
s_mu5

#Q3:Repeat step 1 but sample 20 individuals in each iteration, and assign the results to `mu20`. 

# Filter for "versicolor" species
versicolor_data <- iris %>% filter(Species == "versicolor")

# Initialize empty vector to store means
mu20 <- numeric(100)

# mean Petal.Width from 20 individuals
for (i in 1:100) {
  sampled <- versicolor_data %>% sample_n(20)
  mu20[i] <- mean(sampled$Petal.Width)
}

# Print
mu20

# Q4. Calculate the standard deviation of `mu20` and assign it to `s_mu20`.
#    Verify that `s_mu20` is smaller than `s_mu5` by printing the comparison (`s_mu20 < s_mu5`)
# standard deviation of mu20
s_mu20 <- sd(mu20)

# Compare s_mu20 with s_mu5
s_mu20 < s_mu5

# Questions:
# 1. Calculate the probability that 0 < x <= 10 for a normal distribution with mean = 5 and sd = 3.
#    Hint: Use `pnorm()` function and subtract P(x <= 0) from P(x <= 10).
# Calculate cumulative probabilities
p_10 <- pnorm(q = 10, mean = 5, sd = 3)
p_0  <- pnorm(q = 0, mean = 5, sd = 3)

# Calculate the probability that 0 < x <= 10
prob_0_to_10 <- p_10 - p_0

# print
prob_0_to_10

#Q2. Calculate the probability that 0 < x <= 10 for a normal distribution with mean = -5 and sd = 3.
# Calculate cumulative probabilities
p_10 <- pnorm(q = 10, mean = -5, sd = 3)
p_0  <- pnorm(q = 0, mean = -5, sd = 3)

# Calculate the probability that 0 < x <= 10
prob_0_to_10 <- p_10 - p_0

# print
prob_0_to_10

# Questions:
# 1. Using the `df_iris` dataset, calculate the variance of "Petal.Length" for each species.
#    (Hint: use `group_by()` and `summarize()` from dplyr.)

# Calculate variance of Petal.Length for each species
df_iris %>%
  group_by(Species) %>%
  summarize(variance_petal_length = var(Petal.Length))

#Q2. Perform a t-test comparing "Petal.Length" between "setosa" and "versicolor".
#    Choose the appropriate `var.equal` option depending on whether the SDs appear equal.

# Use iris dataset
df_iris <- iris

# Calculate variance of Petal.Length for each species
df_iris %>%
  group_by(Species) %>%
  summarize(variance = var(Petal.Length))

# Extract Petal.Length for setosa and versicolor
setosa <- df_iris %>% 
  filter(Species == "setosa") %>% pull(Petal.Length)
versicolor <- df_iris %>% 
  filter(Species == "versicolor") %>% pull(Petal.Length)

# Compare variances
var_ratio <- max(var(setosa), var(versicolor)) / min(var(setosa), 
                var(versicolor))
var_equal <- var_ratio < 2

# Perform t-test with appropriate var.equal
t_test_result <- t.test(setosa, versicolor, var.equal = var_equal)

# Print results
t_test_result

# Questions:
# 1. Using the `df_insect` dataset, create a plot to visualize the distribution of insect counts for each spray type.
#    - Use a violin plot to show the distribution and include the median (y = count, x = spray).
#    - Add individual data points with a small horizontal jitter for clarity.


# Load the dataset
df_insect <- as_tibble(InsectSprays)

# Create violin plot with jittered points and median
ggplot(df_insect, aes(x = spray, y = count)) +
  geom_violin(trim = FALSE, fill = "salmon") +
  geom_jitter(width = 0.2, alpha = 0.6, color = "darkblue") +
  stat_summary(fun = median, 
               geom = "point", shape = 23, size = 3, fill = "green") +
  labs(title = "Distribution of Insect Counts by Spray Type",
       x = "Spray Type", y = "Insect Count") +
  theme_minimal()

# Question:
# 2. Using the `df_insect` dataset, perform a one-way ANOVA to test whether insect counts differ among spray types.
#    - Use the `aov()` function and display the summary of the model with `summary()`.
#    - Report if there was a significant difference between spray groups.


# Load the dataset
df_insect <- as_tibble(InsectSprays)

# Perform one-way ANOVA
anova <- aov(count ~ spray, data = df_insect)

# Display summary of the model
summary(anova)
