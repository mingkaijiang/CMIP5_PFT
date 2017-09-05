
#### Main program
###
### To process CMIP5 vegetation data for australia
###
### Author: Mingkai Jiang (m.jiang@westernsydney.edu.au)
### 
#### ------------------------ General system stuffs ------------------------ #####
### Make sure everything is clear
rm(list=ls(all=TRUE))

### read in all R packages
source("R/prepare_R.R")

#### ------------------------ Process raw data nc files ------------------------ #####
inFile <- "Data/Raw/landCoverFrac_Lmon_MIROC-ESM_rcp26_r1i1p1_200601-210012.nc"
outFile <- "Data/Processed/MIROC-ESM_rcp26_r1i1p1_200601-210012.csv"

nc_to_csv(Datfile = "landCoverFrac_Lmon_MIROC-ESM_rcp26_r1i1p1_200601-210012", sourceDir = "Data/Raw", destDir = "Data/Processed")


##### ------------------------ Clear workspace ---------------------------- #####
rm(list=ls(all=TRUE))

#### End


