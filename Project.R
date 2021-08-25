#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(plotly)

# Define UI for application that draws a histogram
ui <- fluidPage(

    # Application title
    titlePanel("Using mtcars dataset"),

    # Sidebar with a slider input for number of bins 
    sidebarLayout(
        sidebarPanel(
            selectInput("Please Select", "Variable:", 
                        c("Cylinders" = "cyl",
                          "Transmission" = "am",
                          "Gears" = "gear"))
        ),

        # Show a plot of the generated distribution
        mainPanel(
           plotOutput("plot_mpg")
        )
    )
)

# Define server logic required to draw a histogram
server <- function(input, output) {
    
    text_on_top <- reactive({
        paste("Compairing mpg with  ", input$variable)
    })

    output$caption <- renderText({
        text_on_top()
    })
    output$plot_mpg <- renderPlot({
        ggplot(mtcars, aes_string(y=input$variable, x="mpg")) + geom_point()
    })
}

# Run the application 
shinyApp(ui = ui, server = server)
