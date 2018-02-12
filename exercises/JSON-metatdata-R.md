---
layout: exercise
topic: Metadata
title: JSON Metadata
language: R
---

1. Access the [open standard for camera trap data](https://bdj.pensoft.net/article/10197/element/5/3500059/)
and download Supplementary Material 3, the JSON template. Save the file
to your project directory.

2. Install and explore the `jsonlite` package. There is much more
about the relationship between data representation in R and JSON 
in the [accompanying paper.](https://arxiv.org/abs/1403.2805v1)
```r
install.packages('jsonlite')
library(jsonlite)
?jsonlite
```

3. Read in the JSON template you downloaded. 
```r
## read in a json schema ####
template <- fromJSON('oo_99336.json')
str(template)
template$CameraTrapMetadataStandard
````

4. From the JSON organization and the open standard paper, the
data structure can be recreated. Existing records from a table
of images and identifications can be re-arranged and placed into 
a list to mimic the JSON schema.
```r
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
```

5. Once the structures are named and nested correctly, the export
to shareable, findable JSON data is straightforward:
```r
toJSON(myImages, pretty = T)
toJSON(template, pretty = T)
```
