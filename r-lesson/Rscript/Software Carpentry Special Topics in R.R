
# Software Carpentry
# April 15, 2016
# Special Topics in R with Umi

install.packages('dplyr')
library(dplyr)

# Importing data
dat = read.csv(file.choose()) # opens finder window to help find data file you want

# Looking at data
View(dat) # opens data file in separate tab
head(dat) #shows first few rows of data file
glimpse(dat) # shows one row for each column, it's name, the type of data that's in it, and shows the first few values (in dplyr package)
dim(dat) # returns dimensions of data file (rows and columns)

# Subsetting data
select(dat, order, species) # selects certain columns of dataset by column headers
select(dat, starts_with('adult')) #selects certain columns by condition that it starts with certain text
select(dat, -order) #selects all columns except those listed with "-" in front

filter(dat, order=="Carnivora") #selects only rows where Order is Carnivora
filter(dat, order=="Carnivora" & adult_body_mass_g<5000) #selects only rows meeting more than one condition (could also use | for 'or' rather than &)

# Sorting data
arrange(dat, adult_body_mass_g) #sorts by ascending values
arrange(dat, desc(adult_body_mass_g)) #sorts by descending values
arrange(dat, order, adult_body_mass_g) #sorts by Order alphabetically, and then by ascending values of body mass

# Saving manipulations to data
dat.1 <- arrange(dat, adult_body_mass_g) # best to use arrow here rather than equals sign when assigning a variable
head(dat.1)

# Finding average mass by Order
# use intermediate variable 'a'

a = group_by(dat, order) # says we want to look at the data separately by order. Could put more than one factor to separate by.
b = summarize(a, mean_mass = mean(adult_body_mass_g, na.rm=TRUE)) #summarizes data grouped by Order by making a new data frame with a column called 'mean mass' populated by mean mass for each group. na.rm = T needed to ignore NAs (REMEMBER TO CHANGE OTHER NOTATIONS FOR NAs TO NA, OR ELSE SPECIFY WHEN READING IN CSV WHAT VALUES SHOULD BE CONSIDERED NAs in na.strings="NA",".",""...)
c = mutate(a, mean_mass = mean(adult_body_mass_g, na.rm=TRUE)) #adds column to data frame with output requested associated with each row (does not alter the structure of the data frame)
head(a)
head(b)
head(c)
glimpse(c)

d = summarize(a, mean_mass=mean(adult_body_mass_g, na.rm = TRUE), 
              sd_mass = sd(adult_body_mass_g, na.rm = TRUE))

#CAN USE THIS CODE TO WRITE FUNCTION, SAY, TO FIT MODEL TO EACH GROUP, or make other comparisons

# Making comparisons between group and global averages

e = mutate(a, mean_mass = mean(adult_body_mass_g, na.rm = TRUE),
           norm_mass = adult_body_mass_g / mean_mass) # can't use arrow here because R will try to assign norm_mass as variable, rather than performing a calculation
nrow(a)
nrow(dat)
head(dat)
head(a)

# Shorthand for subsetting and summarizing/mutating - using %>%  makes it less messy by reducing the number of variables:

e <- dat %>% #take our data
    group_by(order) %>% #split up by order
    mutate(mean_mass = mean(adult_body_mass_g, na.rm = TRUE), 
    norm_mass = adult_body_mass_g / mean_mass) %>% #%>% indicates we're working with the most recent assignment for %>%, dat grouped by order
    arrange(desc(norm_mass)) # lists output according to descending mean mass by order
  
  View(e)
    
  #Exercise: Which order has the most species?
  f <- dat %>%
    group_by(order) %>%
    summarize(num_spp = nrow(species)) %>% #either nrow or length works
    arrange(desc(num_spp))
  head(f)
  
  size_range <- dat %>%
    group_by(order) %>%
    summarize(range = max(adult_body_mass_g, na.rm = TRUE) - min(adult_body_mass_g, na.rm = TRUE)) %>%
    arrange(desc(range))
View(size_range)
  