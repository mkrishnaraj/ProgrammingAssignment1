complete <- function(directory, id = 1:332) {
    ## 'directory' is a character vector of length 1 indicating
    ## the location of the CSV files

    old_wd <- getwd()
    new_wd <- paste(old_wd, directory, sep = "/")
    setwd(new_wd)

    ## 'id' is an integer vector indicating the monitor ID numbers
    ## to be used
    dir_files <- list.files()
    ids  <- id
    nobs <- c()

    for(i in seq_along(id)) {
        j <- ids[i]
        file_data <- read.csv(dir_files[j])
        obs <- complete.cases(file_data)
        nobs[i] <- sum(obs, na.rm = TRUE)
    }
    setwd(old_wd)
        
    ## Return a data frame of the form:
    ## id nobs
    ## 1  117
    ## 2  1041
    ## ...
    ## where 'id' is the monitor ID number and 'nobs' is the
    ## number of complete cases

    tab <- data.frame(ids, nobs)

    return(tab)
}
