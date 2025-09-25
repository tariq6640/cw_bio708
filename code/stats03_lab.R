#Probability lab

library(tidyverse)
library(patchwork)

#Normal distribution



##The function rnorm() produces a random variable that follows a Normal distribution with a specified mean and SD. Using this function,

##Generate a variable with 50 observations.

# Load required library
library(ggplot2)


v <- rnorm(n=50, mean = 100, sd = 3)
bin <- seq(floor(min(v)), ceiling(max(v)), by = 1)

p <- NULL # empty object for probability
for (i in 1:(length(bin) - 1)) {
  p[i] <- pnorm(bin[i+1], mean = mean(v), sd = sd(v)) - pnorm(bin[i], mean = mean(v), sd = sd(v))
}

df_prob <- tibble(bin = bin[-length(bin)]+ 0.5,
                  prob = p) %>%
  mutate(freq = length(v)*prob)


df_v <- tibble(v = v)
df_v %>%
  ggplot(aes(x = v))+
  geom_histogram()+
  geom_point(data = df_prob,
             aes(x = bin,
                 y = freq),
                 color = "salmon")+
  geom_line(data = df_prob,
            aes(x = bin,
                y = freq), 
            color = "salmon")

#poisson distribution

x <- rpois(n = 1000, lambda = 12)


library(tidyverse)

# Generate Poisson-distributed data

x <- rpois(n = 1000, lambda = 12)
df_count <- tibble(count = x)

# Estimate lambda from data
lambda_hat <- mean(df_count$count)

# Create theoretical Poisson probabilities
x_vals <- seq(min(x), max(x), by = 1)
pm <- rpois(x_vals, lambda = lambda_hat)

# Create data frame for Poisson probabilities
df_prob <- tibble(x = x_vals, y = pm) %>%
  mutate(freq = y * nrow(df_count))

# Plot histogram 
df_count %>%
  ggplot(aes(x = count)) + 
  geom_histogram(binwidth = 0.5, fill = "gray", color = "black") +
  geom_line(data = df_prob,
            aes(x = x, y = freq),
            linetype = "dashed", color = "red") +
  geom_point(data = df_prob,
             aes(x = x, y = freq),
             color = "red")



