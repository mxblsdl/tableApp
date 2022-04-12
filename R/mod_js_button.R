#' js_button UI Function
#'
#' @description Button that invokes a custom JS function call
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_js_button_ui <- function(id){
  ns <- NS(id)
  tagList(
    actionButton(ns("button"), "JS function")
  )
}

#' js_button Server Functions
#'
#' @noRd
mod_js_button_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
    observeEvent(input$button, {
      # Sends a message to object in 'type'
      # This example sends 'test' to the 'fun' function
      session$sendCustomMessage(type = "fun", message = "test")
    })

  })
}
