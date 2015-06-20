# get-clean-data
Repo containing files associated with the Getting and Cleaning Data Coursera class project.

## Files
<b> run_analysis.R: </b> Data processing script which takes the raw data provided by the UCI Machine Learning Repository
and creates an independent tidy dataset, tidydata.txt. User only needs to download the original data and use 
run_analysis.R to create tidydata.txt.

<b> tidydata.txt: </b> Final tidydataset which contains 180 observations of 68 variables. The dataset provides the mean by
subject id and activity of two sets of 33 variables, one set measuring the mean and the other the standard deviation, 
of raw signal data from an accelerometer contained within a Samsung Galaxy S phone. For a more detailed description
of the data and the processing steps please see CodeBook.md.

<b> CodeBook.md: </b> Provides a detailed description of the original study design as well as the data processing steps
contained within run_analysis.R. A full list of all 68 variables within tidydata.txt is also provided.
