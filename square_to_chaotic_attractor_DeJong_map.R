# Square into a chaotic attractor using the Peter De Jong iterator setup
library(ggplot2)

# parameters of De Jong
a <- 1.4
b <- -2.3
c <- 2.4
d <- -2.1

# 2nd common parameter choice
#a <- 2.01
#b <- -2.53
#c <- 1.61
#d <- -0.33

# plot params and time steps
time_steps <- 1000
plot_every <- 100

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
  x_new  <- sin(a*y_init) - cos(b*x_init)
  y_new <- sin(c*x_init) - cos(d*y_init)
  
  x_init <- x_new
  y_init <- y_new
  
  if (t %% plot_every == 0) {
    # new plot
    square <- data.frame(x = x_init, y = y_init)
    
    p1 <- ggplot(
      data = square
    ) + geom_point(aes(x = x, y = y), colour = "blue") + ggtitle("Morphed data for De Jong maps")
    
    print(p1)
    
    Sys.sleep(3) # so we can see it
  }
}






