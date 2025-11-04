# load libraries
library("shiny")
library("bslib")


# load functions
source(file = "app_functions.R")


# Define the User Interface (Frontend)
source(file = "ui.R")


# Define the Server (Backend)
source(file = "server.R")


# Launch the shiny app
shinyApp(ui = ui, server = server)