rankhospital <- function(state, outcome, rank="best"){
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

        ##Push to a normalized structure
        deathrate[,3] <- suppressWarnings(as.numeric(deathrate[,3]))
        ##supress warnings and get rid of NA values
        deathrate <- na.omit(deathrate)
        
        ##Standardize names of normalized structure
        colnames(deathrate) <- c("Hospital", "State","Value")
        ##filter to state
        staterate <- deathrate[deathrate$State == state,]
        
        ##print(names(statedeathrate))
        ##print(class(statedeathrate))
        
        ##Set Rank
        if(rank=="Best"){Rank<-1}
        else if(rank=="Worst"){Rank<-NROW(staterate)}
        else{Rank<-rank}
        
        ##Order by Value/Hospital asc
        staterate <- staterate[order(staterate$Value,staterate$Hospital),]
        ##Grab Hospital for specific state/rank
        Hospital <- staterate[Rank,]
        print(Hospital$Hospital)
        
}