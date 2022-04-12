#' table1 UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_table1_ui <- function(id){
  ns <- NS(id)
  tagList(
    fluidRow(
      col_6("Snapshot of RStudio job postings by keywords"),
      col_6(actionButton(
        inputId = ns("job-link"),
        label = HTML("<a href = 'https://community.rstudio.com/c/jobs/20'>Job Board</a>"))
      )
    ),
    fluidRow(
      col_10(offset = 1,
             reactableOutput(ns("table"))
      )
    ),
    fluidRow(
      col_10("Gives an overview of what keywords are popular in the RStudio job postings board.")
    )

  )
}


#' table1 Server Functions
#'
#' @noRd
#' @import reactable
mod_table1_server <- function(id, dat, table_bg, full_table) {

  moduleServer(id, function(input, output, session) {
    ns <- session$ns

    output$table <- renderReactable({
      reactable(
        data = dat,
        details = function(index) {
          switch(
            dat[[index, "Keyword"]],
            "Other" = r_table(table = full_table, "Other", table_bg),
            "Shiny" = r_table(table = full_table, "Shiny", table_bg),
            "Analyst" = r_table(table = full_table,"Analyst", table_bg),
            "Data Scientist" = r_table(table = full_table, "Data Scientist", table_bg),
            "Engineering" = r_table(table = full_table, "Engineering", table_bg),
            "Database" = r_table(table = full_table, "Database", table_bg)
          )
        },
        highlight = T,
        borderless = T,
        showSortIcon = T,
        theme = reactableTheme(
          color = "black",
          backgroundColor = table_bg,
          style = list(fontFamily = "-apple-system, BlinkMacSystemFont, Segoe UI, Helvetica, Arial, sans-serif")
        )
      )
    })
  })
}

