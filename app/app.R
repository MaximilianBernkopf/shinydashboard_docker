#############################################################
# Basic shiny dashboard app taken from                      #
# https://rstudio.github.io/shinydashboard/get_started.html #
#############################################################

library(shiny)
library(shinydashboard)
Sys.sleep(10)

ui <- dashboardPage(
    dashboardHeader(title = "Basic dashboard"),
    ## Sidebar content
    dashboardSidebar(
        sidebarMenu(
            menuItem("Dashboard", tabName = "dashboard", icon = icon("tachometer-alt")),
            menuItem("Widgets", tabName = "widgets", icon = icon("th"))
        )
    ),
    ## Body content
    dashboardBody(
        tabItems(
            # First tab content
            tabItem(tabName = "dashboard",
                    fluidRow(
                        box(plotOutput("plot1", height = 250)),

                        box(
                            title = "Controls",
                            sliderInput("slider", "Number of observations:", 1, 100, 50)
                        )
                    )
            ),

            # Second tab content
            tabItem(tabName = "widgets",
                    h2("Widgets tab content")
            )
        )
    )
)

server <- function(input, output) {
    set.seed(122)
    histdata <- rnorm(500)

    output$plot1 <- renderPlot({
        data <- histdata[seq_len(input$slider)]
        hist(data)
    })
}

shinyApp(ui, server)
