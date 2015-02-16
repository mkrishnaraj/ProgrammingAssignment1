pollutantmean <- function(directory, pollutant, id) {
    ## 'directory' is a character vector of length 1 indicating
    ## the location of the CSV files

    old_wd <- getwd()
    new_wd <- paste(old_wd, directory, sep = "/")
    setwd(new_wd)

    ## 'pollutant' is a character vector of length 1 indicating
    ## the name of the pollutant for which we will calculate the
    ## mean; either "sulfate" or "nitrate".

    ## 'id' is an integer vector indicating the monitor ID numbers
    ## to be used

    dir_files <- list.files()
    all_val <- c()

    for(file in dir_files[id]) {
        file_data <- read.csv(file)
        all_val <- c(all_val, file_data[, pollutant])
    }
  
    ## Return the mean of the pollutant across all monitors list
    ## in the 'id' vector (ignoring NA values)

    setwd(old_wd)

    return (round(mean(all_val, na.rm = TRUE), digits = 3))
}
