outcomehistory <- function (){
##Write a function that reads a directory full of files and reports the number of completely observed cases in each data file. The function should return a data frame where the first column is the name of the file and the second column is the number of complete cases. A prototype of this function follows
    
    
    wd <- "G:\\Data\\"
    ##path <- paste(wd,directory, sep = "", collapse = NULL)
    
    ##print(path)
    
    setwd(wd)

    outcome <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
    ##head(outcome)
    ##class(outcome)
    ##names(outcome)
    outcome[, 11] <- as.numeric(outcome[, 11])
    hist(outcome[, 11])
    
    
}