# Welcome to RStudio!
# Anything after the # sign is a comment.
# It get ignored when R executes commands.
# Use this fact to write notes to yourself about your code.

# The command below loads the mosaic library.
# You need to install it once (Packages tab > Install),
# and then load it at the beginning of each R session.
# Easiest way: put the 'library' command at the top of your script.
library(mosaic)

# Let read in some data from the class site: heights.csv 
# Go download this first.
# Then under the Environment tab, click on "Import Dataset".
# Choose "From Text (base)" from the dropdown menu.
# Then navigate on your hard drive to where you saved heights.csv
# and follow the prompts.

# This gives you the mean and five-number summary
# of each variable in the data set
summary(heights)

# Just the mean of the SHGT variable
mean(heights$SHGT)
mu = mean(heights$SHGT)

# Accessing help files for functions
?mean
?sd
?mu  # this gives an error -- mu is something you defined, not an R function

# A simple scatter plot
# We'll learn about data vis later!
# Note: if this command gives you an error,
# make sure you loaded the mosaic library
plot(SHGT ~ MHGT, data=heights)


