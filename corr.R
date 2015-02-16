corr <- function(directory, threshold = 0) {
    ## 'directory' is a character vector of length 1 indicating
    ## the location of the CSV files

    ## 'id' is an integer vector indicating the monitor ID numbers
    ## to be used
    obs <- complete(directory)
    corrs <- numeric(0)

    obs <- obs[obs$nobs > threshold, ]
    old_wd <- getwd()
    new_wd <- paste(old_wd, directory, sep = "/")

    setwd(new_wd)
    print(new_wd)
    dir_files <- list.files()

    for(i in obs$id) {
       file_data <- read.csv(dir_files[i])
       corrs <- c(corrs, cor(file_data$sulfate, file_data$nitrate, use = "pairwise.complete.obs"))
    }
    setwd(old_wd)
    
    ## 'threshold' is a numeric vector of length 1 indicating the
    ## number of completely observed observations (on all
    ## variables) required to compute the correlation between
    ## nitrate and sulfate; the default is 0
    return(corrs)
}
