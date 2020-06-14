# Write a function called rankhospital that takes three arguments: the 2-character abbreviated name of a
# state (state), an outcome (outcome), and the ranking of a hospital in that state for that outcome (num).
# The function reads the outcome-of-care-measures.csv file and returns a character vector with the name
# of the hospital that has the ranking specified by the num argument. For example, the call

## Function identifies the hospital that matches the mortality rate rank provided for 
## a given outcome
## for the defined state
rankhospital <- function(state, outcome, num = "best") {
        ## "state" is a character vector identifying the state scope of hospitals
        ## "outcome" is a character vector for the outcome scope
        
        ## "num" is the character vector identifying the rank that should be returned. 
        ## default is "best"
        
        ## Function returns a character vector for the name of the hospital with the 
        ## defined mortality rate ranking
        
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
        }else {        
                stop("invalid state")
        } ## end of if

        ## order dataframe
        ds <- na.omit(ds[order(ds$State, ds[ ,3], ds$Hospital.Name), ])
        
        ## split data by state
        s <- split(ds, ds$State)
        
        ## set rank number
        if(num=="worst"){
                n <- nrow(s[[state]])                 
        } else if (num=="best") {
                n <- 1  
        } else {
                n <- as.numeric(num)        
        } ## end of if
        ## get the list of hospitals
        
        h <- lapply(s, function(y) y[n,1])
        
        hName = as.character(h[state])        
                
        ## Return hospital name in that state with lowest 30-day death rate
        hName

}
