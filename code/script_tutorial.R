
# Example code ------------------------------------------------------------


x <- c(1, 2)
x

y <- c(3, 4)
y

## produce 100 random numbers that follows a normal distribution
x <- rnorm(100, mean = 0, sd = 1)

## estimate mean
mean(x)

## estimate SD
sd(x)
##quick coding
z <- c(1, 2, 3)


# excercise ---------------------------------------------------------------

#create a vector with length 10 and assign it to z

z <- c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10)
z <- 1:10
z <- seq(1, 10, length=10)
z <- letters[1:10]
#create a matrix with 2 rows x 2 columns and assign to m
data_values <- c(1, 2, 3, 4)

# Create the 2x2 matrix and assign it to 'm'
m <- matrix(data = data_values, nrow = 2, ncol = 2, byrow = TRUE)

# Print the matrix to verify
print(m)
m <-cbind(c(1,2),c(3,4))
m<-rbind(c(1,2),c(3,4))
#data frame
data.frame(name = c("smith", "john", "kate", "akira"), height = c(154, 170, 156, 175))



