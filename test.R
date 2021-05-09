library(tictoc)
tic()
data <- get_measurements(100, 52.520008, 13.404954)
toc()

mapview::mapview(data)
