# To complete the following exercises, you must use either base R or tidyverse functions.  
# Manual searching or hard-coding answers will not be graded.

# base R ------------------------------------------------------------------

# 1: Create a vector with three elements. Assign it to `v_three`.

# 2: Create a vector containing 20 "a", 30 "b", and 50 "c" (total length = 100).  
# Assign it to `v_abc100`.

# 3: The script below creates a vector `v_x` with 100 random numbers from a normal distribution.  
# Select only the positive numbers (> 0) from `v_x`, calculate their mean, and assign it to `mu_x_plus`.
set.seed(100)
v_x <- rnorm(100)

# 4: Create a numeric matrix with the numbers 1 through 9 arranged in 3 rows × 3 columns.  
# Assign it to `m_num`.

# 5: Create a base R data frame (`data.frame()` function) using `v_x` and `v_abc100`.  
# Name the columns `"x"` for `v_x` and `"group"` for `v_abc`, and assign it to `df_sample`.


# tidyverse ---------------------------------------------------------------

# 6: Load the `tidyverse` package.

# 7: The `mtcars` dataset is a built-in base R data frame.  
# Convert it to a tibble using `as_tibble()` and assign it to `df_mtcars`.  
# Use `?as_tibble()` to read the documentation before doing so.

# 8: `mtcars` has the following columns:
#
# mpg   - Miles per gallon  
# cyl   - Number of cylinders  
# disp  - Engine displacement (cu. in.)  
# hp    - Gross horsepower  
# drat  - Rear axle ratio  
# wt    - Weight (1,000 lbs)  
# qsec  - 1/4 mile time (seconds)  
# vs    - Engine shape (0 = V-shaped, 1 = straight)  
# am    - Transmission (0 = automatic, 1 = manual)  
# gear  - Number of forward gears  
# carb  - Number of carburetors  
#
# Display the column names of `df_mtcars` using `colnames()`.  
# Do NOT assign the result to a new object.

# 9: Extract the row names of the `mtcars` dataset using `rownames()`.  
# Assign the result to `v_make`.

# 10: Add `v_make` as a new column to `df_mtcars` and name the column `"make"`.

# 11: Filter `df_mtcars` to include only rows where:  
# - `mpg` is less than 20 AND  
# - `disp` is greater than 200  
# Assign the result to `df_subset`.

# 12: Count how many car makes meet the above conditions (Q11).
# Apply `nrow()` to `df_subset`.

# 13: Repeat Q11 and Q12 in a single pipeline (with %>%), and assign the result to `n_make`.

# 14: Convert the `cyl` column from numeric to factor using `factor()`.  
# Add it to `df_mtcars` as a new column named `f_cyl` using `mutate()` function.

# 15: Draw a box plot showing car weight (`wt`) for each number of cylinders (`f_cyl`).

# 16: Calculate the average car weight (`wt`) separately for each number of cylinders (`cyl`).

# 17: Identify the heaviest car make (`wt`) among cars with 6 cylinders (`cyl`).

# 18: Create a histogram showing the distribution of 1/4 mile time (`qsec`).

# 19: The following script creates two tibbles:  
# `df_length` (body length) and `df_weight` (body weight),  
# each with a species code (`sp_code` column).  
# Combine these two data frames based on `sp_code` and assign the result to `df_fish`.

set.seed(123)
v_l <- runif(150, 60, 150)
v_w <- rnorm(n = length(v_l),
             mean = 0.1 * v_l^1.5,
             sd = 10)

v_sp <- sample(c("bhc", "rbs", "gsf"),
       size = length(v_l),
       replace = TRUE)

df_length <- tibble(length = v_l,
                    sp_code = v_sp)

df_weight <- tibble(weight = v_w,
                    sp_code = sample(c("bhc", "rbs", "gsf"),
                                     size = length(v_l),
                                     replace = TRUE))

# 20: Draw a scatter plot (point plot) of `length` vs. `weight` from `df_fish`,  
# coloring the points by species code (`sp_code`).



# Assessment 01 -----------------------------------------------------------

# 1: Create a vector with three elements. Assign it to `v_three`.

v_three <- c(10, 20, 30)
print(v_three)

# 2: Create a vector containing 20 "a", 30 "b", and 50 "c" (total length = 100).  
# Assign it to `v_abc100`.

v_abc100 <- c(rep("a", 20), rep("b", 30), rep("c", 50))

print(v_abc100)

# 3: The script below creates a vector `v_x` with 100 random numbers from a normal distribution.  
# Select only the positive numbers (> 0) from `v_x`, calculate their mean, and assign it to `mu_x_plus`.
set.seed(100)
v_x <- rnorm(100)

set.seed(100)
v_x <- rnorm(100)

# Select only the positive numbers
v_x_plus <- v_x[v_x > 0]

# Calculate the mean of the positive numbers
mu_x_plus <- mean(v_x_plus)

# Display the result
print(mu_x_plus)

# 4: Create a numeric matrix with the numbers 1 through 9 arranged in 3 rows × 3 columns.  
# Assign it to `m_num`.

m_num <- matrix(1:9, nrow = 3, ncol = 3)

print(m_num)

# 5: Create a base R data frame (`data.frame()` function) using `v_x` and `v_abc100`.  
# Name the columns `"x"` for `v_x` and `"group"` for `v_abc`, and assign it to `df_sample`.

set.seed(100)
v_abc100 <- sample(c("A", "B", "C"), size = 100, replace = TRUE)

# Create the data frame
df_sample <- data.frame(x = v_x, group = v_abc100)

head(df_sample) 

# 6: Load the `tidyverse` package.

library(tidyverse)

# 7: The `mtcars` dataset is a built-in base R data frame.  
# Convert it to a tibble using `as_tibble()` and assign it to `df_mtcars`.  
# Use `?as_tibble()` to read the documentation before doing so.

library(tibble)

df_mtcars <- as_tibble(mtcars)

# View the tibble
df_mtcars


# 8: `mtcars` has the following columns:
#
# mpg   - Miles per gallon  
# cyl   - Number of cylinders  
# disp  - Engine displacement (cu. in.)  
# hp    - Gross horsepower  
# drat  - Rear axle ratio  
# wt    - Weight (1,000 lbs)  
# qsec  - 1/4 mile time (seconds)  
# vs    - Engine shape (0 = V-shaped, 1 = straight)  
# am    - Transmission (0 = automatic, 1 = manual)  
# gear  - Number of forward gears  
# carb  - Number of carburetors  
#
# Display the column names of `df_mtcars` using `colnames()`.  
# Do NOT assign the result to a new object.

colnames(df_mtcars)

# 9: Extract the row names of the `mtcars` dataset using `rownames()`.  
# Assign the result to `v_make`.

v_make <- rownames(mtcars)

head(v_make)

# 10: Add `v_make` as a new column to `df_mtcars` and name the column `"make"`.

# Load dplyr for the pipe and mutate functions
library(dplyr)
# Add the 'make' column to df_mtcars
df_mtcars_make <- df_mtcars %>%
  mutate(make = v_make)

# View the first few rows
head(df_mtcars_make)

# 11: Filter `df_mtcars` to include only rows where:  
# - `mpg` is less than 20 AND  
# - `disp` is greater than 200  
# Assign the result to `df_subset`.

# Load dplyr for tidyverse functions
library(dplyr)

# Use filter() to subset the data
df_subset <- df_mtcars %>%
  filter(mpg < 20, disp > 200)

# View the first few rows
head(df_subset)

# 12: Count how many car makes meet the above conditions (Q11).
# Apply `nrow()` to `df_subset`.

nrow(df_subset)

# 13: Repeat Q11 and Q12 in a single pipeline (with %>%), and assign the result to `n_make`.
library(dplyr)

# Filter the dataframe first
filtered_df <- df_mtcars %>%
  filter(cyl == 4, am == 1)

# Get the number of columns
n_make <- ncol(filtered_df)

# View the result
n_make

# 14: Convert the `cyl` column from numeric to factor using `factor()`.  
# Add it to `df_mtcars` as a new column named `f_cyl` using `mutate()` function.

df_mtcars <- df_mtcars %>%
  mutate(f_cyl = factor(cyl))
head(df_mtcars)

# 15: Draw a box plot showing car weight (`wt`) for each number of cylinders (`f_cyl`).

library(ggplot2)

ggplot(df_mtcars, aes(x = f_cyl, y = wt)) +
  geom_boxplot(fill = "skyblue", color = "darkblue") +
  labs(title = "Car Weight",
       x = "Number of Cylinders",
       y = "Weight (1000 lbs)") +
  theme_minimal()

# 16: Calculate the average car weight (`wt`) separately for each number of cylinders (`cyl`).

df_mtcars %>%
  group_by(cyl) %>%
  summarise(avg_wt = mean(wt)) 

# 17: Identify the heaviest car make (`wt`) among cars with 6 cylinders (`cyl`).

df_mtcars$make <- rownames(mtcars)

df_mtcars %>% filter(cyl == 6) %>% arrange(desc(wt)) %>% slice(1) %>%
  select(make, wt)


# 18: Create a histogram showing the distribution of 1/4 mile time (`qsec`).

ggplot(df_mtcars, aes(x = qsec)) +
  geom_histogram(binwidth = 1, fill = "salmon", color = "white") +
  labs(title = "Distribution of 1/4 Mile Time (qsec)",
       x = "1/4 Mile Time (seconds)",
       y = "Frequency") +
  theme_minimal()

# 19: The following script creates two tibbles:  
# `df_length` (body length) and `df_weight` (body weight),  
# each with a species code (`sp_code` column).  
# Combine these two data frames based on `sp_code` and assign the result to `df_fish`.


set.seed(123)
v_l <- runif(150, 60, 150)
v_w <- rnorm(n = length(v_l),
             mean = 0.1 * v_l^1.5,
             sd = 10)

v_sp <- sample(c("bhc", "rbs", "gsf"),
               size = length(v_l),
               replace = TRUE)

df_length <- tibble(length = v_l,
                    sp_code = v_sp)

df_weight <- tibble(weight = v_w,
                    sp_code = sample(c("bhc", "rbs", "gsf"),
                                     size = length(v_l),
                                     replace = TRUE))
##My code

set.seed(123)
v_l <- runif(150, 60, 150)
v_w <- rnorm(n = length(v_l),
             mean = 0.1 * v_l^1.5,
             sd = 10)

v_sp <- sample(c("bhc", "rbs", "gsf"),
               size = length(v_l),
               replace = TRUE)

# Tibbles creation
df_length <- tibble(length = v_l,
                    sp_code = v_sp)

df_weight <- tibble(weight = v_w,
                    sp_code = sample(c("bhc", "rbs", "gsf"),
                                     size = length(v_l),
                                     replace = TRUE))

# Joining by sp_code
df_fish <- inner_join(df_length, df_weight, by = "sp_code")

# 20: Draw a scatter plot (point plot) of `length` vs. `weight` from `df_fish`,  
# coloring the points by species code (`sp_code`).

library(ggplot2)

ggplot(df_fish, aes(x = length, y = weight, color = sp_code)) +
  geom_point(alpha = 0.7, size = 2) +
  labs(title = "Fish Length vs. Weight by Species Code",
       x = "Length (mm)",
       y = "Weight (g)",
       color = "Species Code") +
  theme_minimal()