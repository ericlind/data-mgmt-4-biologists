---
layout: page
element: notes
title: Scripting Data QC
language: R
---

# import data
```
dat <- read.csv('data/raw/wma_QAQC.csv')
```

# data structure & field types
#### most basic: how many rows? 
```
nrow(dat)
# how many columns?
ncol(dat)
# in R, it is always [rows, columns] for indexing
dim(dat)
dim(dat)[1] == nrow(dat) # test
```
#### are the types as expected? 
```
str(dat) # also always available in the "Environment" tab of RStudio
```
#### char v factor

#### + factors +: 
easy unique list:
```
levels(dat$common_name)
```
constrain valid entries
```
dat$common_name[1]
dat$common_name[1] <- 'Superb Owl' # what happened?
```

#### - factors - :
constrain valid entries - makes editing cumbersome
```
dat$common_name <- factor(dat$common_name, levels = c('Superb Owl', levels(dat$common_name)))
dat$common_name[1] <- 'Superb Owl'
```

sorting doesn't happen the way you think it might
```
levels(dat$sample_date)
unique(dat[order(dat$sample_date), c('WMA', 'sample_date')])
```

**BIGGEST** problem: auto-factorized integers that look and act like numbers when factors!
```
hist(dat$records) # Error in hist.default(dat$records) : 'x' must be numeric
hist(as.numeric(dat$records)) # works! those look like numbers
hist(as.numeric(as.character(dat$records))) #uhh
```

Find the culprit:
```
bad_record <- which(is.na(as.numeric(as.character(dat$records))))
dat[bad_record, ]
```

avoid the auto-factorization with stringsAsFactors = F
```
datstr <- read.csv('data/raw/wma_QAQC.csv', stringsAsFactors = F)
str(datstr)
```

# unique()  and table() to check levels
### what are the unique levels in each column?
```
unique(dat$WMA)
unique(dat$common_name)
```

#### instead of typing & repeating, apply
```
names(dat)
apply(dat[, 2:5], 2, unique)

# or, equivalent and better (specifying column names b/c positions can change)
uniqlist <- apply(dat[, c('WMA', 'common_name', 'status', 'habitat')], 2, unique)
```

### table: how many of each type?
```
table(dat$WMA)
table(dat$sample_date)

# can sort then just look at the top 9
sort(table(dat$common_name), decreasing = T)[1:9]
```

### Crosstabs: how many by multple factors?
```
table(dat$WMA, dat$common_name)[, 1:11]
```

# summary function gives overview of data
```
summary(dat)
```

#### overall check: do numbers look like the right scale?
do the right fields appear to be there?

#### for each column: NAs v blanks
are blank rows ok? should they be 0? NA? something else?

### how many NAs are there? is that a reasonable number? 
```
which(is.na(dat$count)) # indexed answer to the question
# use the index in the subset or data selector
sel <- which(is.na(dat$count))
dat[sel, ]
# or
subset(dat, is.na(dat$count))
```

# Quantitative Field QC: range & plots
### what is the range of the data?
```
range(dat$count) # NA?
range(dat$count, na.rm = T) # are both ends plausible?
```

### what is the distribution of values?
```
summary(dat$count)
quantile(dat$count, na.rm = T, c(0.025, 0.975))
# flag some outliers? 
high_counts <- which(dat$count > quantile(dat$count, na.rm = T, 0.975))
dat[high_counts, ]
```

## Graph your data! 
```
plot(dat$count) # in order of occurrence, can be helpful if there is a data entry pattern
boxplot(dat$count) # first check for outliers: outside the lines? 
# replot without by squeezing axis
boxplot(dat$count, ylim = c(0, 50))

# "Cleveland dotplot":
dotchart(dat$count)
# arrange data points in order of value, plot value versus order
dotchart(sort(dat$count))

# histogram
hist(dat$count)
# breaks make the histogram
hist(dat$count, breaks = 30)


# drop the clear outliers for the histogram
hist(dat[dat$count < 50, 'count'], freq = F)

# related: density plot (not as applicable to counts)
lines(density(dat[dat$count < 50, 'count'], na.rm = T))
```

# Correlations and trends among variables
## *not yet analyzing* - data checking
#### numeric/integer by factor
```
plot(dat$count ~ dat$WMA, ylim = c(0, 50)) # does on site look particularly off?
# correlation among variables
dat$countscale <- dat$count^(1-exp(0.3))
?pairs
pairs(dat[!is.na(dat$records), c('records', 'count', 'countscale')])
```

# Standardize field names & ordering
#### can dump extraneous columns (remember they will still exist in the original RAW data!)
```
col2drop <- which(names(dat) == 'countscale')
dat <- dat[, -col2drop]
```

#### names function can be modified directly
```
names(dat)
names(dat)[names(dat) == 'trt'] <- 'treatment'
head(dat)
```

#### columns can be combined sensibly for derived use
```
dat$latin_name <- paste(dat$genus, dat$species)
head(dat)
```

#### columns can be re-arranged in order to fit how other similar datasets are set up
```
dat_out <- dat[, c('WMA', 'treatment', 'sample_date', 'latin_name', 'count')]
head(dat_out)
```

# check species against standard lists
```
birds_aou <- read.csv("instructors/week3/birds_aou.csv")
head(birds_aou)
birds_aou$latin_name <- paste(birds_aou$genus, birds_aou$species)
```

### using %in% for matching
```
dat$latin_name %in% birds_aou$latin_name
# some don't match - which ones though?
subset(dat, !(latin_name %in% birds_aou$latin_name))
```

### reciprocal setdiff
```
setdiff(dat$latin_name, birds_aou$latin_name) # in dat, not birds_aou
setdiff(birds_aou$latin_name, dat$latin_name) # in birds_aou, not dat
```

### finding the right name...  manual for now (there are packages!)
### world of "regular expressions"
```
birds_aou[grep('Grus', birds_aou$latin_name), ]
birds_aou[grep('canad', birds_aou$latin_name), ]
```

### troublesome white space
```
dat[grep(' ', dat$latin_name), ] # all the latin names have a space, but some have at end
?trimws
setdiff(trimws(dat$latin_name), birds_aou$latin_name) # in dat, not birds_aou
```

# writing data out with date or other variable
```
datestamp <- Sys.Date()
write.csv(dat, file = paste0('data/fromR/wma-cleaned-', datestamp, '.csv'))
```