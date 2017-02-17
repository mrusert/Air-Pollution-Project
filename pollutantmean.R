pollutantmean <- function(directory, pollutant, id = 1:332) {
    d <- dir(directory)[id]                        # Define directory subset
    totalavg <- 0
    rowcount <- 0
    for(f in d) {                                  # loop through directory subset
      csv <- read.csv(paste("specdata/",f,sep="")) # load csv file into data frame
      c <- csv[pollutant]                          # subset data frame for pollutant column of interest
      bad <- is.na(c)                              # create logic operator for NA values
      totalavg <- totalavg + sum(c[!bad])          # add to total 
      rowcount <- rowcount + length(c[!bad])       # add to row count
    }
    totalavg / rowcount                            # return totalavg divided by rowcount
    
}