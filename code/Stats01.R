#Ctril +shift + N is hot key for creating a new script file

library(tidyverse)


# central tendency --------------------------------------------------------

#arithematic mean
#calculate the arthematic mean of v_x using length () and sum()
v_x <- rnorm(10)
head(v_x)

mu_x <- sum(v_x) / length(v_x)
 print(mu_x)
 
#geometric mean
 #use prod(), length(), 
v_y <- runif(10, min = 10, max = 20)
print(v_y)

prod(v_y)^(1 / length(v_y))
exp(mean(log(v_y)))

#median

v_z <- runif(9, min = 10, max = 20)
v_z <- sort (v_z)
sort(v_z)
index <- (length(v_z) + 1)/2
v_z[index]
median(v_z)


# variance measures -------------------------------------------------------

#variance (square root = standard deviation)
#use sum() and length() to define variance
v_a <- rnorm(100)

# Generate 100 random values from a normal distribution
v_a <- rnorm(100)

# Calculate the mean
mean_v <- sum(v_a) / length(v_a)

# Calculate variance manually
variance_v <- sum((v_a - mean_v)^2) / length(v_a)

# Print the result
variance_v

s<- sqrt(variance_v)

#interquantile range

a_l <- quantile(v_a, probs = 0.25)
a_h <- quantile(v_a, probs = 0.75)
iqr <- abs(a_h-a_l)
print(iqr)

#MAD
median(abs(v_a-median(v_a)))

#coeeficient of variation 
#use s and mean() of v_a to define CV
v_b <- runif(100, min = 10, max = 20)
s2 <- sum((v_b - mean(v_b))^2) / length(v_b)
s <- sqrt(s2)
(cv <- s/mean(v_b))

#MAD/median
# Generate 100 random values between 10 and 20
v_b <- runif(100, min = 10, max = 20)

mad <- median(abs(v_b-median(v_b)))
med <- median(v_b)
mad2med <- mad / med



