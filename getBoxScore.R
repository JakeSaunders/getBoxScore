# Fuction which extracts box score from any superbowl wikipedia page
getBoxScore <- function(x) {
    
    # install and load rvest
    if (!require("rvest",character.only = T)) {install.packages(x,dep=TRUE)}    
    library(rvest)
    
    
    # parse html from superbowl wikipedia page with source x (= url or file name) into a data frame 
    table = 
        html_table(
            html_node(
                read_html(x),
                xpath = '//*[@id="mw-content-text"]/table[1]'
            ),
            fill = TRUE
        )
    # if statement to determine if wikipedia page has needs improvement message at top of page which interferes with finding summary table 
    if (nrow(table) == 1 && ncol(table) == 2) {
        
        # assign summary table df to variable
        table2 = 
            html_table(
                html_node(
                    read_html(x),
                    xpath = '//*[@id="mw-content-text"]/table[2]'
                ),
                fill = TRUE
            )
        
        # pulls box score from summary table df
        table.out = table2[7:8, 1:6]
        # renames col and row names
        colnames(table.out) = c("Team", "1st", "2nd", "3rd", "4th", "Total")
        rownames(table.out) = c("1","2")
        #outputs boxscore df
        print(table.out)
        
        # else statement assumes summary table will be first table in wikipedia page, should really change this to confirm correct dim (nrow = 27, ncol =20) in future  
    }else{
        
        # pulls box score from summary table df
        table.out = table[7:8, 1:6]
        # renames col and row names
        colnames(table.out) = c("Team", "Q1", "Q2", "Q3", "Q4", "Final")
        rownames(table.out) = c("1","2")
        #outputs boxscore df
        print(table.out)
    }
}