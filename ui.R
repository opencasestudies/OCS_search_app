#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(shinythemes)

# library(bootstraplib)
# 
# 
# fluidPage(
#   bootstrap(),
#   titlePanel("Hello world!")
# )


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

# availableCases <- data.frame(
#   "Subject" = c("Politics"),
#   "Topic" = c("2020 Presidential Election?"), 
#   "Data" = 
#     c("U.S. Opinion polls from 2012, 2016 Presidential election, 2020 Presidential Primaries"), 
#   "Programming" = c("R"), 
#   "Statistics" = c("Bayesian"),
#   "Language options" =c("English, Español"),
#   "URL" =c("https://opencasestudies.github.io/ocs-healthexpenditure/ocs-healthexpenditure.html")
# )
# 
# availableCases<-OCS

fluidPage(
  #theme = shinytheme("cerulean"),
  theme = shinytheme("flatly"),
  
  titlePanel("Welcome to OpenCaseStudies!"), #openDataCases
  sidebarLayout(
    sidebarPanel(
     selectizeInput(
        'e0', '1. Select a subject matter', choices = c('Public Health', 'Politics', 
                                               'Sports', 'Biology', 'Economics',
                                               'Engineering'), multiple = TRUE
      ),
      selectizeInput(
        'e1', '2. Select a programming language',
        choices = c('R', 'Python', 'C++'), multiple = TRUE
      ),
     
     
      selectizeInput(
        'e2', '3. Select a statistical or data analysis concept', 
        choices = c('Exploratory data analysis', 'Probability', 
                    'Random Variables', 'Distributions',
                    'Statistical Inference', 't-test', 'ANVOVA', 
                    'Bayesian', 'Regression', 'Linear models',
                    'Logistic Regression', 'Support Vector Machines', 
                    'Data Wrangling', 'Data Import', 'Visualization'), multiple = TRUE
      ),
     
     
     selectizeInput(
       'e3', '4. Select a written language', 
       choices = c('English', 'Español', '中文'), multiple = TRUE
     )
    ),
    mainPanel(
      helpText('Available case studies in the OCS repository:'),
      tabsetPanel(
        id = 'dataset',
        tabPanel("availableCases", DT::dataTableOutput("mytable1"))
      ) 
      #img(src='https://raw.githubusercontent.com/datasciencelabs/2016/master/lectures/inference/pics/nate-silver-1.png', align = "center")
      )
      )
      )

# bs_theme_new()
