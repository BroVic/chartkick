#
# This is a Shiny web application example for chartkick htmlwidget

library(shiny)
library(palmerpenguins)
library(chartkick)

# Define UI for application that draws a histogram
ui <- fluidPage(

    # Application title
    titlePanel("Shiny Web App based on Chartkick htmlwidget"),

    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
            chartkick::chartkickOutput(outputId = "ck1")),

        # Show a plot of the generated distribution
        mainPanel(
           plotOutput("distPlot")
        )
    )
)

# Define server logic required to draw a histogram
server <- function(input, output) {

    output$ck1 <- renderChartkick({

    })
}

# Run the application
shinyApp(ui = ui, server = server)
