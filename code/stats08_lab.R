pacman::p_load(tidyverse,
               patchwork,here)
# glm excercise -----------------------------------------------------------

url <- "https://raw.githubusercontent.com/aterui/public-proj_fish-richness-shubuto/master/data/data_vpart.csv"
df_fish <- read_csv(url)

m_fish <- glm(n_sp ~ distance + cat_area + hull_area,
              data = df_fish,
              family = "poisson")
summary(m_fish)

#mtcars data

m_am <- glm(cbind(am, 1-am)~ mpg+hp+wt,
            data = mtcars,
            family = "binomial")
summary(m_am)

plot(am ~wt,
     mtcars)
m_am_gau <- glm(am~mpg+hp+wt,
    data = mtcars,
    family = "gaussian") %>%
  summary()


# effect size -------------------------------------------------------------


# Standardize the explanatory variables
df_fish <- df_fish %>%
  mutate(
    std_dist = scale(distance),
    std_cat = scale(cat_area),
    std_hull = scale(hull_area)
  )

# Fit a Poisson GLM with standardized variables
glm_std <- glm(n_sp ~ std_dist + std_cat + std_hull, 
               data = df_fish, 
               family = "poisson")

summary(glm_std)

###compare coefs
coef(m_fish)
coef(glm_std)


# Offset ------------------------------------------------------------------


# Load the dataset
url <- "https://raw.githubusercontent.com/aterui/biostats/master/data_raw/data_offset.csv"
df_offset <- read_csv(url)

# Plot 1: Count vs Nitrate
g1 <- ggplot(df_offset, aes(x = nitrate, y = count)) +
  geom_point() 

# Plot 2: Count vs Area
g2 <- ggplot(df_offset, aes(x = area, y = count)) +
  geom_point() 

# Plot 3: Density vs Nitrate
g3<- df_offset %>% 
mutate(density = count/area) %>%
ggplot(aes(x = nitrate, y = density)) +
  geom_point()

# GLM without offset
glm_no_offset <- glm(count ~ nitrate, data = df_offset, family = poisson())
summary(glm_no_offset)

# GLM with offset
glm_with_offset <- glm(count ~ nitrate + offset(log(area)), data = df_offset, family = poisson())
summary(glm_with_offset)

##gaussian effect
df_offset <- df_offset %>% 
  mutate(density = count / area)

glm(density ~ nitrate,
    data = df_offset,
    family = "poisson")

## use offsetbterm with poisson distribution


# GLM without offset
glm_no_offset <- glm(count ~ nitrate,
                     data = df_offset, family = poisson())
summary(glm_no_offset)

# GLM with offset (log(area))
glm_with_offset <- glm(count ~ nitrate + offset(log(area)), 
                       data = df_offset, family = poisson())
summary(glm_with_offset)
# Load required libraries
library(readr)
library(ggplot2)

# Load the dataset
url <- "https://raw.githubusercontent.com/aterui/biostats/master/data_raw/data_tadpole.csv"
df_tadpole <- read_csv(url)

# Plot 1 Tadpole vs Aquatic Vegetation Cover
p1 <- ggplot(df_tadpole, aes(x = aqveg, y = tadpole)) +
  geom_point()

# Plot 2 Tadpole vs Pond Permanence
p2 <- ggplot(df_tadpole, aes(x = permanence, y = tadpole)) +
  geom_point() 
p1+p2

# Fit a Poisson GLM
glm_tadpole <- glm(tadpole ~ aqveg + permanence, data = df_tadpole, 
                   family = poisson())
summary(glm_tadpole)
mean(df_tadpole$tadpole)
var(df_tadpole$tadpole)

##negative binomial regression

m_nb <- MASS::glm.nb(tadpole ~aqveg + permanence,
             data = df_tadpole)
summary(m_nb)
