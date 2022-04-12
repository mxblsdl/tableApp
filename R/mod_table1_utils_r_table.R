#' reactTable Template
#'
#' @param table
#' @param key
#' @param bg
#'
#' @return
#' @export
#'
#' @examples
r_table <- function(table, key, bg) {
  reactable(select(filter(table, Keyword == key), Details = Topic), wrap = T,
            theme = reactableTheme(backgroundColor = bg))
}



#' Create Data
#'
#' @param url
#'
#' @importFrom rvest read_html html_table
#' @import dplyr
#' @return
#' @export
#'
#' @examples
create_table_data <- function(url) {

  table <- read_html(url) %>%
    html_table() %>%
    as.data.frame()

  table <-
    table %>%
    select(Topic, Replies, Views, Activity) %>%
    filter(!grepl("Post Jobs", Topic)) %>%
    mutate(Topic = gsub("\n.*", "", Topic),
           Keyword = case_when(
             grepl("Shiny", Topic, ignore.case = T) ~ "Shiny",
             grepl("Data Scien.*", Topic, ignore.case = T) ~ "Data Scientist",
             grepl("Analyst", Topic, ignore.case = T) ~ "Analyst",
             grepl("database", Topic, ignore.case = T) ~ "Database",
             grepl("Engineer", Topic, ignore.case = T) ~ "Engineering",
             T ~ "Other"))
  return(table)
}
