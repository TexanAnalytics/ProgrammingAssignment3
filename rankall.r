rankall <- function(outcome, rank="best"){
    ## Read outcome data
    ##Make sure library is loaded library(plyr)
    
    ##wd<-"G:\\Git\\datasciencecoursera\\ProgrammingAssignment3\\ProgrammingAssignment3\\"
    ##setwd(wd)
    source('G:/Git/datasciencecoursera/ProgrammingAssignment3/ProgrammingAssignment3/rankhospital.r')
    
    
    wd <- "G:\\Data\\"
    ##path <- paste(wd,directory, sep = "", collapse = NULL)
    ##print(path)
    
    setwd(wd)
    df.outcome <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
    
    ##names(df.outcome)
    
    
    
    
    ##check outcome and subset the dataframe with the appropriate column, pdf defines column content
    if(outcome == 'heart attack')
    {
        ##print("Test Heart Attack")
        deathrate <- df.outcome[,c(2,7,11)]
    }
    else if(outcome == 'heart failure')
    {
        ##print("Test Heart failure")
        deathrate <- df.outcome[,c(2,7,17)]
    }
    else if(outcome == 'pneumonia')
    {
        ##print("Test Heart pneumonia")
        deathrate <- df.outcome[,c(2,7,23)] 
    }   
    else
        ## Produce error if invalid outcome passed
    {print("Error : Invalid Outcome")}
    
    ##Push to 
    
    deathrate[,3] <- as.numeric(deathrate[,3])
    deathrate <- na.omit(deathrate)
    
    ##deathrate <- split(deathrate, deathrate$State, drop=FALSE)
    colnames(deathrate) <- c("Hospital", "State","Value")
    
    
    split.deathrate<-split(deathrate,deathrate$State)

    ##print(split.deathrate)
    
    
    ##df.ranks <- lapply(split.deathrate,rankHospital,rank)
    l<-names(split.deathrate)
    ##print(l)
    
    
    df.state <- character()
    df.hospital <- character()
    
    for(i in l){
        ##print(i)
        df.state[i]<-i
        df.hospital[i] <- suppressWarnings(rankhospital(i,outcome,rank))
    }

    df.answer <- data.frame(df.state, df.hospital, stringsAsFactors=FALSE)
    
    print(df.answer)
}