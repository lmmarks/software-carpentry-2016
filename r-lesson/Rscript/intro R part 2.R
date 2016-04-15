read.csv()
temp = 67

fahr_to_kelvin <- function(temp) {
  kelvin <- ((temp - 32) * (5 / 9)) + 273.15
  return(kelvin)
}

fahr_to_kelvin(67)
fahr_to_kelvin(temp)

kelvin_to_celsius <- function(temp) {
    celcius <- temp - 237.15
    return(celcius)
}

kelvin_to_celsius(0)

fahr_to_celsius <- function(temp) {
    temp_k <- fahr_to_kelvin(temp)
    result <- kelvin_to_celsius(temp_k)
}

fahr_to_celsius(32) #this isn't working

best_practice <- c("Write","programs","for", "people","not","computers")
asterisk <- "***"

length(best_practice)
length(asterisk)

fence<- join(best_practice, asterisk)
fence(best_practice,asterisk)

help(fence)
fence <- function(original, wrapper){
  # Comment about your function here
  return(c(wrapper, original, wrapper))
}

best_practice <- c("Write", "programs", "for", "people", "not", "computers")
asterisk <- "***"  # R interprets a variable with a single value as a vector
# with one element.
fence(best_practice, asterisk)

dat
min(dat)
max(dat[1,])
18 -> year

analyze <- function(filename) {
  # Plots the average, min, and max inflammation over time.
  # Input is character string of a csv file.
  
  dat <- read.csv(file = filename, header = FALSE)
  avg_day_inflammation <- apply(dat, 2, mean)
  plot(avg_day_inflammation)
  max_day_inflammation <- apply(dat, 2, max)
  plot(max_day_inflammation)
  min_day_inflammation <- apply(dat, 2, min)
  plot(min_day_inflammation)
}

analyze("inflammation-01.csv")

best_practice <- c("let", "the", "compputer", "do", "the", "work")
best_practice


print_words<- function(sentence) {
  #function prints a sentence
  print(sentence[1])
  print(sentence[2])
  print(sentence[3])
  print(sentence[4])
  print(sentence[5])
  print(sentence[6])
}

print_words(best_practice)
print_words(best_practice[-6])

print_words <- function(sentence) {
  for(word in sentence) {
    print(word)
  }
}

print_words(best_practice)
print_words(best_practice[-6])

len <- 0
vowels <- c("a", "e", "i", "o", "u")
for (v in vowels) {
  print(len)
  len <- len + 1
}

len

seq(3)

total <- function(vect){
  # Sums a vector
  tot = 0
  
  for(i in vect){
    tot = tot + i
  }
  return(tot)
}

ex_vec <- c(4, 8, 15, 16, 23, 42)
total(ex_vec)

2^4
expo <- function(base, exponent){
  tot = 1 # temporary holder variable
  
  # Accounts for exponent = 0. Don't worry about this for now
  if(exponent == 0){
    return(tot)
  }
  
  for(i in 1:exponent){
    tot = tot * base
  }
  return(tot)
}

expo(3, 0)
expo(3, 2)


seq(3)
print_N <- function(natural_number){
  container_of_numbers <- seq(natural_number)
  for(x in container_of_numbers){
    print(x)
  }
}

print_N(3)
print_N(10)


expo <- function(vase, exponent){
  temp <- baseenv(for(x in 1:exponent){
    temp <- temp * temp
  }
  return(temp)
}


#loop through files analysis
list.files()
Sys.glob("*.csv") #pulls out all files with ".csv" at end
Sys.glob("i*.csv") #pulls out all files starting with "i" and ending with ".csv"
filenames <- Sys.glob("i*.csv") #saving these as a variable

#run analysis on each file
for(file in filenames){
  print(file) #good practice to check for loop is doing what you think it's doing
  analyze(file) #analyze just prints plots
}

analyze <- function(filename) {
  # Plots the average, min, and max inflammation over time.
  # Input is character string of a csv file.
  dat <- read.csv(file = filename, header = FALSE)
  avg_day_inflammation <- apply(dat, 2, mean)
  plot(avg_day_inflammation)
  max_day_inflammation <- apply(dat, 2, max)
  plot(max_day_inflammation)
  min_day_inflammation <- apply(dat, 2, min)
  plot(min_day_inflammation)
}

analyze_all <- function(pattern) {
  # Runs the function analyze for each file in the current working directory
  # that contains the given pattern.
  filenames <- list.files(path = "data", pattern = pattern, full.names = TRUE)
  for (f in filenames) {
    analyze(f)
  }
}

pdf("inflammation-01.pdf") #identifies which file to use
analyze("inflammation-01.csv") #Performs analysis function specified earlier; can also add to function to specify destination for pdf file we're creating, and can alter specifications of the file
dev.off() #ends adding things to the same pdf

#Conditionals
num <- 37
if (num > 100) {
  print("greater")
} else {
  print("not greater")
}
print("done")
