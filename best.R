## The purpose of this function is to identify the hospital with the best 30 day mortality
## rate based on the state and outcome
best <- function(state, outcome){
        ## "state" is a character vector identifying the state scope of hospitals
        ## "outcome" is a character vector for the outcome scope
        
        ## Function returns a character vector for the name of the hospital with the best mortality
        ## rate 30-day)
        
        ## Read outcome data
        od <- read.csv("outcome-of-care-measures.csv")
        od
         
        ## Check that state and outcome are valid
        
        ## Return hospital name in that state with lowest 30-day death
        ## rate      
} ## end of best function


# The function should check the validity of its arguments. If an invalid state value is passed to best, the
# function should throw an error via the stop function with the exact message “invalid state”. If an invalid
# outcome value is passed to best, the function should throw an error via the stop function with the exact
# message “invalid outcome”.
# Here is some sample output from the function.
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
# >
        