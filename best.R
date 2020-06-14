## The purpose of this function is to identify the hospital with the best 30 day mortality
## rate based on the state and outcome
best <- function(state, outcome){
        ## "state" is a character vector identifying the state scope of hospitals
        ## "outcome" is a character vector for the outcome scope
        
        ## Function returns a character vector for the name of the hospital with the best mortality
        ## rate 30-day)
        
        hName <- character()
        
        ## check if outcome is valid 
        vOutcome <- c("heart attack", "heart failure", "pneumonia")
        if (!outcome %in% vOutcome){
                stop("invalid outcome")
        } ## end of if
        
        ## Read outcome data
        if (nchar(state)==2) {
                outData <- read.csv("outcome-of-care-measures.csv", na.strings = "Not Available")
        } else {
                stop("invalid state")
        } ## end of if
        
        ## Check that state is valid
        if (state %in% outData$State){
                if (outcome=="heart failure"){
                        ## mortality rate from heart failure is column 17
                        ds <- outData[,c(2,7,17)]
                } else if (outcome=="heart attack") {
                        ## mortality rate from heart attack is column 11
                        ds <- outData[,c(2,7,11)]
                } else {
                        ## mortality rate from pneumonia is column 23
                        ds <- outData[,c(2,7,23)]
                } ## end of if
                
                ## order dataframe
                ds <- ds[order(ds$State, ds[ ,3], ds$Hospital.Name), ]
        
                ## split data by state
                s <- split(ds, ds$State)
                
                ## get the list of hospitals
                h <- lapply(s, function(y) y[1,1])
                
                hName = as.character(h[state])
      
        }else {        
                stop("invalid state")
        } ## end of if
        
        ## Return hospital name in that state with lowest 30-day death rate
        hName
        
} ## end of best function

# > source("best.R")
# > best("TX", "heart attack")
# [1] "CYPRESS FAIRBANKS MEDICAL CENTER"
# > best("TX", "heart failure")
# [1] "FORT DUNCAN MEDICAL CENTER"
# > best("MD", "heart attack")
# [1] "JOHNS HOPKINS HOSPITAL, THE"
# > best("MD", "pneumonia")
# [1] "GREATER BALTIMORE MEDICAL CENTER"
# > best("BB", "heart attack")
# Error in best("BB", "heart attack") : invalid state
# > best("NY", "hert attack")
# Error in best("NY", "hert attack") : invalid outcome
