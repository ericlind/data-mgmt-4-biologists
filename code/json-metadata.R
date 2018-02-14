# exploring JSON metadata as stand-alone file (great for web API building)
#install.packages('jsonlite')
library(jsonlite)
?jsonlite

## read in a json schema ####
template <- fromJSON('https://ericlind.github.io/data/oo_99336.json')
str(template)
template$CameraTrapMetadataStandard

## combining datasets to match schema definitions ####
myImages <- list(Project = data.frame(ProjectID = 'thelindyardproject.org',
                       ProjectName = 'Lind backyard Summer 2017', 
                       ProjectObjectives = 'Find out who has been eating my lettuces'),
                 Deployment = data.frame(CameraDeploymentID = c(1:3),
                                         CameraDeploymentBeginDate = c('2017-06-01', 
                                                                       '2017-06-07',
                                                                       '2017-06-10'),
                                         DeploymentLocationID = 'Shed wall'
                                         ),
                 Images = data.frame(imageID = 1:10,
                                      dateTimeCaptured = sample(seq.Date(from = as.Date('2017-06-01'),
                                                                         to = as.Date('2017-07-01'),
                                                                         by = 1), 10, replace = T),
                                      photoType = c('Staff', rep('Animal', 4), 'Unidentifiable', 
                                                    rep('Animal', 4)),
                                      photoTypeIdentifiedBy = 'Eric Lind'),
                 ImageAnimal = data.frame(imageID = c(rep(2, 2), 3, 4, 6:10),
                                          imageCount = 1,
                                          speciesScientificName = c('Vulpes vulpes', rep('Sylvilagus floridanus', 8)))
                       )
myImages

toJSON(myImages, pretty = T)
toJSON(template, pretty = T)
