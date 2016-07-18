

shinyUI(bootstrapPage(
  h1("MY SHINY APP"),
  selectInput(inputId = "city_selection",

              label = "Select City:",
              choices = c("NewYork", "LosAngeles", "Chicago", "Houston", "Philadelphia"),
              selected = "NewYork"),


  checkboxInput(inputId = "legend",
                label = strong("Show legend"),
                value = FALSE),

  checkboxInput(inputId = "frequency_label",
                label = strong("Show frequency label"),
                value = FALSE),

  plotOutput(outputId = "main_plot", height = "500px"),
  p(strong("Note:")),
  p("1.  Large data set. Please wait a few minutes for datat to load."),
  p("2.  If App disconnects, reload and wait a few minutes for data to reload."),
  p("3.  Thank You!")



))

