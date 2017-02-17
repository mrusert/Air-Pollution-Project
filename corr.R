corr <- function(directory, threshold = 0) {
    d <- dir(directory)                                   # Define directory
    crs <- numeric(0)                                     # Define correlation vector
    
    for(f in d) {
      con <- read.csv(paste("specdata/",f,sep = ""))      # create connection to file
      logexp <- complete.cases(con)                       # create logical expression for rows with NA values
      if (nrow(con[logexp,]) > threshold) {               # check if # of complete rows greater than threshold
        con_no_na <- con[logexp,]                         # get subset of complete rows
        nitrate <- con_no_na["nitrate"]                   # get subset of nitrate and sulfate values
        sulfate <- con_no_na["sulfate"]
        crs <- c(crs, cor(sulfate$sulfate, nitrate$nitrate)) # add correlation to correlation vector
      } else {
        next                                              # skip to next iteration 
      }
    }
    crs                                                   # return correlation vector
}