#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
urls <- c("https://opencasestudies.github.io/ocs-healthexpenditure/ocs-healthexpenditure.html", "https://opencasestudies.github.io/ocs-police-shootings-firearm-legislation/ocs-police-shootings-firearm-legislation.html")

urls <- c("https://opencasestudies.github.io/ocs-healthexpenditure/ocs-healthexpenditure.html",
          "https://opencasestudies.github.io/ocs-police-shootings-firearm-legislation/ocs-police-shootings-firearm-legislation.html", 
          "https://opencasestudies.github.io//ocs-hypertension-diet/ocs-hypertension-diet.html",
          "https://opencasestudies.github.io//ocs-hypertension-diet/ocs-hypertension-diet.html")


OCS <-matrix(nrow = 4, ncol = 8) # modify nrows!
colnames(OCS)<-c("Subject", "Topic","Data","Programming Language", "Methods", "Analyses", "Language", "URL")

OCS[1,]<-c("Public Health",
           "Health Expenditure",
           "csv",
           "R",
           "Import, Wrangling, Visualization", 
           "Exploratory trends",
           "English",
           urls[1])


OCS[2,]<-c("Public Health",
           "Fatal Police Shootings & Firearm legislation", 
           "csv, excel, website", 
           "R",
           "Import, Wrangling, Visualization, Exploration, Analysis, Interpretation",
           "generalized linear model, poisson model, negative bionomial model, Sobel-Goodman mediation test",
           "English",
           urls[2])





OCS[3,]<-c("Public Health", 
           "Opioids and Medicare",
           "csv", 
           "R",
           "Import, Wrangling, Visualization, Exploration, Analysis, Interpretation", 
           "linear mixed effect modeling",
           "English",
           urls[3])

OCS[4,]<-c("Public Health",
           "Hypertension diet",
           "csv",
           "R",
           "Import, Wrangling, Visualization, Exploration, Analysis, Interpretation",
           "logistic regression, survey-weighting, confidence intervals, bionomial model, quisibinomial model", 
           "English",
           urls[4])

OCS<-data.frame(OCS)
function(input, output) {
  output$mytable1 <- DT::renderDataTable({
    DT::datatable(OCS)
  })
  
  output$markdown <- renderUI({
    HTML(markdown::markdownToHTML(knit('https://raw.githubusercontent.com/datasciencelabs/2016/master/lectures/inference/probability.Rmd', quiet = TRUE)))
  })
  # You can access the value of the widget with input$checkbox, e.g.
  output$value <- renderPrint({ input$checkbox })
  
  
}