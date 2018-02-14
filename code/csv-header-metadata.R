## Using cat and writeLines to export a Metadata header

## Create some sandbox data ####
out <- data.frame(plot = 1:20, 
                  trt = sample(LETTERS[1:4], 20, replace = T),
                  sampled = rep(seq.Date(as.Date('2018-02-02'), as.Date('2018-02-06'), length.out = 5), 4),
                  response = rnorm(n = 20, mean = 50, sd = 20)
)
str(out)

## Create a header and short description ####
header1 <- c('METADATA',
             'This file contains measurements of experimental plots at Research Garden in Feburary 2018')
cat(header1,sep='\n')

## Create detailed column descriptions ("data dictionary")
names(out)
unlist(lapply(out, class))

header2 <- data.frame(COLUMN = names(out),
                      TYPE = unlist(lapply(out, class)),
                      DEFINITION = c('plot identifier',
                                   'treatment code; one of (A = control), (B = +5 mg PO4), (C = +5 mg NH4NO3), (D = +5 mg PO4 and +5 mg NH4NO3)',
                                   'date sampled',
                                   'dried plant mass (g)'))

# concat to file
datestamp <- Sys.Date()
datafile <- file(paste0('FebBiomass-',datestamp,'.csv'), open = 'wt')
writeLines(header1, con = datafile)
write.csv(header2, datafile, row.names = F)
writeLines('DATA', con = datafile)
write.csv(out, datafile, row.names = F)
close(datafile)

