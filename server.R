library(ggplot2)

# Set working directory to where data files are
#setwd("C:/data_science/data-products/project_shiny")

# Read data
NEI <- readRDS("./summarySCC_PM25.rds")
SCC <- readRDS("./Source_Classification_Code.rds")

shinyServer(function(input, output) {

  output$main_plot <- renderPlot({

    colours <- c("red", "orange", "blue", "yellow", "green")

    if (input$city_selection == "NewYork") {
      subsetNEI <- NEI[NEI$fips=="36061", ]
      aggrData <- aggregate(Emissions ~ year, subsetNEI, sum)
      xx <- barplot(height=aggrData$Emissions, names.arg=aggrData$year, ylim=c(0,6e+03), col=colours, xlab="Year", ylab="Total PM2.5 Emissions (Tons)", main="Total New York City PM2.5 Emissions (All Sources)")
    }

    if (input$city_selection == "LosAngeles") {
      subsetNEI <- NEI[NEI$fips=="06037", ]
      aggrData <- aggregate(Emissions ~ year, subsetNEI, sum)
      xx <- barplot(height=aggrData$Emissions, names.arg=aggrData$year, ylim=c(0,6e+04), col=colours, xlab="Year", ylab="Total PM2.5 Emissions (Tons)", main="Total LOS Angeles California PM2.5 Emissions (All Sources)")
    }

    if (input$city_selection == "Chicago") {
      subsetNEI <- NEI[NEI$fips=="17031", ]
      aggrData <- aggregate(Emissions ~ year, subsetNEI, sum)
      xx <- barplot(height=aggrData$Emissions, names.arg=aggrData$year, ylim=c(0,3e+04), col=colours, xlab="Year", ylab="Total PM2.5 Emissions (Tons)", main="Total Chicago Illinois City PM2.5 Emissions (All Sources)")
    }

    if (input$city_selection == "Houston") {
      subsetNEI <- NEI[NEI$fips=="48225", ]
      aggrData <- aggregate(Emissions ~ year, subsetNEI, sum)
      xx <- barplot(height=aggrData$Emissions, names.arg=aggrData$year, ylim=c(0,3e+03), col=colours, xlab="Year", ylab="Total PM2.5 Emissions (Tons)", main="Total Houston Texas City PM2.5 Emissions (All Sources)")
    }

    if (input$city_selection == "Philadelphia") {
      subsetNEI <- NEI[NEI$fips=="42101", ]
      aggrData <- aggregate(Emissions ~ year, subsetNEI, sum)
      xx <- barplot(height=aggrData$Emissions, names.arg=aggrData$year, ylim=c(0,8e+03), col=colours, xlab="Year", ylab="Total PM2.5 Emissions (Tons)", main="Total Philadelphia Pennsylvania PM2.5 Emissions (All Sources)")
    }




    if (input$legend) {
      legend("topright", c("1999","2002","2005","2008"), cex=1.3, bty="n", fill=colours)
    }
    # Display the frequecy data label at the top of each bar plot
    if (input$frequency_label) {
      text(x = xx, y = aggrData$Emissions, label = aggrData$Emissions, pos = 3, cex = 0.8, col = "black")

    }

  })
})

