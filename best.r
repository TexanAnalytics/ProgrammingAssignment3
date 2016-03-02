best <- function(state, outcome){
    ## Read outcome data
    
        mydf <- data.frame()
        wd <- "G:\\Data\\"
        ##path <- paste(wd,directory, sep = "", collapse = NULL)
        
        ##print(path)
        
        setwd(wd)
        
        df.outcome <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
        
        ##names(df.outcome)
        
        
        ##Check to make sure valid state, upper() would make this better
        if(NROW(df.outcome[df.outcome$State == state,])==0){
            print("Error : Invalid State")
        }
        

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
        staterate <- deathrate[deathrate$State == state,]
        
        ##print(names(statedeathrate))
        ##print(class(statedeathrate))
        
        
        
        staterate <- staterate[order(staterate$Value,staterate$Hospital),]
        TopHospital <- staterate[1,]
        print(TopHospital$Hospital)
    ## Check that state and outcome are valid
    ## 
    ## Return hospital name in that state with lowest 30-day death
    ## 
    ## rate

}