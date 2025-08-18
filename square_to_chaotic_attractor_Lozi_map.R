# Square into a chaotic attractor using Lozi maps
library(ggplot2)

# parameters of Henon
a <- 1.7
b <- 0.5

# plot params and time steps
time_steps <- 100
plot_every <- 10

#initial data params
square_length <- 0.1

# initial square 

x_seq <- seq(0, square_length, by = 0.001)
y_seq <- x_seq

initial_square <- expand.grid(x_seq, y_seq)

colnames(initial_square) <- c("x", "y")

#initial plot
ggplot(
  data = initial_square
) + geom_point(aes(x = x, y = y), colour = "red")

Sys.sleep(3)
# Simple Henon map with the usual contrtacting conditions a = 1.4, b = 0.3
# x_n+1 = 1 - a*x_n*x_n + y_n
# y_n+1 = b*x_n

x_init <- initial_square$x
y_init <- initial_square$y

for (t in 1:time_steps) {
  cat(t, "\n")
  x_new  <- 1.0 - a*abs(x_init) + y_init
  y_new <- b*x_init
  
  x_init <- x_new
  y_init <- y_new
  
  if (t %% plot_every == 0) {
    # new plot
    square <- data.frame(x = x_init, y = y_init)
    
    p1 <- ggplot(
      data = square
    ) + geom_point(aes(x = x, y = y), colour = "blue") + ggtitle("Morphed data for Lozi maps")
    
    print(p1)
    
    Sys.sleep(3) # so we can see it
  }
}






