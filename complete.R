complete <- function(directory, id = 1:332) {
    d <- dir(directory)[id]                               # Define directory subset
    df <- data.frame()                                    # instantiate data frame
    for(f in d) {                                         # loop through directory subset
      con <- read.csv(paste("specdata/",f,sep = ""))      # create connection to file
      logexp <- complete.cases(con)                       # create logical expression for rows with NA values
      fn <- tools::file_path_sans_ext(f)                  # remove file extension from file name
      df <- rbind(df, data.frame(id = as.numeric(fn), nobs = nrow(con[logexp,]))) # bind values to data frame
    }
    df                                                    # return date frame
}