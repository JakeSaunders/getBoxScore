***getBoxScore*** is an R function that when provide with the URL of a wikipeida page containing an Superbowl box score returns the scoring table. This function requires the rvest package which is loaded as part of the function 

***example***
> getBoxScore("https://en.wikipedia.org/wiki/Super_Bowl_50")
  Team Q1 Q2 Q3 Q4 Final
1  CAR  0  7  0  3    10
2  DEN 10  3  3  8    24