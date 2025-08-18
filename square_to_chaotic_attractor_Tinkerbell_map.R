# Square into a chaotic attractor using the Tinkerbell iterator setup
library(ggplot2)

# parameters of Henon
a <- 0.9
b <- -0.6013
c <- 2.0
d <- 0.5

# 2nd common parameter choice
#a <- -0.3
#b <- -0.6
#c <- 2.0
#d <- 0.27

# plot params and time steps
time_steps <- 100
plot_every <- 10

#initial data params
square_length <- 0.01

# initial square 

x_seq <- seq(0, square_length, by = 0.0001)
y_seq <- x_seq

initial_square <- expand.grid(x_seq, y_seq)

colnames(initial_square) <- c("x", "y")

#initial plot
ggplot(
  data = initial_square
) + geom_point(aes(x = x, y = y), colour = "red")

Sys.sleep(3)

x_init <- initial_square$x
y_init <- initial_square$y

for (t in 1:time_steps) {
  cat(t, "\n")
  x_new  <- x_init*x_init - y_init*y_init + a*x_init + b * y_init
  y_new <- 2*x_init*y_init + c*x_init + d*y_init
  
  x_init <- x_new
  y_init <- y_new
  
  if (t %% plot_every == 0) {
    # new plot
    square <- data.frame(x = x_init, y = y_init)
    
    p1 <- ggplot(
      data = square
    ) + geom_point(aes(x = x, y = y), colour = "blue") + ggtitle("Morphed data for Tinkerbell maps")
    
    print(p1)
    
    Sys.sleep(3) # so we can see it
  }
}






