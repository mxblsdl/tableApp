#' The application server-side
#'
#' @param input,output,session Internal parameters for {shiny}.
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_server <- function(input, output, session) {

  session$allowReconnect(TRUE)

  full_table <- create_table_data("https://community.rstudio.com/c/jobs/20")

  # Create inter mediate table here
  tbl <-
    full_table %>%
    group_by(Keyword) %>%
    summarize(Replies = sum(Replies),
              Views = sum(Views),
              Count = n()) %>%
    arrange(desc(Views)) %>%
    mutate(`Avg. Views` = round(Views / Count, 1))

  # browser()
  mod_table1_server("table1_1",
                    dat = tbl,
                    table_bg = "rgb(240, 240, 240)",
                    full_table = full_table)

  mod_js_button_server("js_button_1")
}
