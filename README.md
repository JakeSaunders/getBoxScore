***getBoxScore*** is an R function that when provide with the URL of a wikipedia page containing a Superbowl box score returns the scoring table. This function requires the rvest package which is loaded as part of the function 

*example:*

getBoxScore("https://en.wikipedia.org/wiki/Super_Bowl_50")

*returns dataframe containing:*

Team Q1 Q2 Q3 Q4 Final

CAR  0  7  0  3    10

DEN 10  3  3  8    24
