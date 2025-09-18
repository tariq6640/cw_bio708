

# Load required libraries
library(tidyverse)

# Load the dataset
df_h0 <- read_csv(here::here("data_raw/data_plant_height.csv"))

# Step 1: Random sampling from full dataset
set.seed(123)  # for reproducibility

generate_stats <- function(data, n, reps = 100) {
  tibble(
    mean = replicate(reps, mean(sample(data$height, n, replace = TRUE))),
    variance = replicate(reps, var(sample(data$height, n, replace = TRUE)))
  )
}

stats_50_h0 <- generate_stats(df_h0, 50)
stats_100_h0 <- generate_stats(df_h0, 100)

# Step 2: Filter out plants < 10 cm
df_h10 <- df_h0 %>% filter(height >= 10)

# Step 3: Repeat sampling with filtered data
stats_50_h10 <- generate_stats(df_h10, 50)
stats_100_h10 <- generate_stats(df_h10, 100)

# Step 4: Plot histograms
plot_histograms <- function(stats, sample_size, label) {
  p1 <- ggplot(stats, aes(x = mean)) +
    geom_histogram(binwidth = 0.5, fill = "skyblue", color = "white") +
    ggtitle(paste("Sample Means (n =", sample_size, ",", label, ")"))+
    theme_minimal()
  
  p2 <- ggplot(stats, aes(x = variance)) +
    geom_histogram(binwidth = 1, fill = "salmon", color = "white") +
    ggtitle(paste("Sample Variances (n =", sample_size, ",", label, ")")) +
    theme_minimal()
  
  list(mean_plot = p1, variance_plot = p2)
}

# Plot all
plots_50_h0 <- plot_histograms(stats_50_h0, 50, "Random")
plots_100_h0 <- plot_histograms(stats_100_h0, 100, "Random")
plots_50_h10 <- plot_histograms(stats_50_h10, 50, "Non-Random")
plots_100_h10 <- plot_histograms(stats_100_h10, 100, "Non-Random")

# Patch graphs
library(patchwork)
(plots_50_h0$mean_plot | plots_50_h0$variance_plot) /
  (plots_100_h0$mean_plot | plots_100_h0$variance_plot) /
  (plots_50_h10$mean_plot | plots_50_h10$variance_plot) /
  (plots_100_h10$mean_plot | plots_100_h10$variance_plot)






