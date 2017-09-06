
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


#### ------------------------ Process raw nc files ------------------------ #####

# RCP 26

nc_to_csv(Datfile = "landCoverFrac_Lmon_MIROC-ESM_rcp26_r1i1p1_200601-210012", 
          sourceDir = "Data/Raw", destDir = "Data/Processed/MIROC-ESM_rcp26")

nc_to_csv(Datfile = "landCoverFrac_Lmon_IPSL-CM5A-LR_rcp26_r1i1p1_200601-230012", 
          sourceDir = "Data/Raw", destDir = "Data/Processed/IPSL-CM5A-LR_rcp26")

nc_to_csv(Datfile = "landCoverFrac_Lmon_IPSL-CM5A-MR_rcp26_r1i1p1_200601-210012", 
          sourceDir = "Data/Raw", destDir = "Data/Processed/IPSL-CM5A-MR_rcp26")

nc_to_csv(Datfile = "landCoverFrac_Lmon_MIROC-ESM-CHEM_rcp26_r1i1p1_200601-210012", 
          sourceDir = "Data/Raw", destDir = "Data/Processed/MIROC-ESM-CHEM_rcp26")

nc_to_csv(Datfile = "landCoverFrac_Lmon_MPI-ESM-LR_rcp26_r1i1p1_200601-210012", 
          sourceDir = "Data/Raw", destDir = "Data/Processed/MPI-ESM-LR_rcp26")

nc_to_csv(Datfile = "landCoverFrac_Lmon_MPI-ESM-MR_rcp26_r1i1p1_200601-210012", 
          sourceDir = "Data/Raw", destDir = "Data/Processed/MPI-ESM-MR_rcp26")


# RCP 45
nc_to_csv(Datfile = "landCoverFrac_Lmon_ACCESS1-0_rcp45_r1i1p1_200601-200601", 
          sourceDir = "Data/Raw", destDir = "Data/Processed/ACCESS1-0_rcp45")

nc_to_csv(Datfile = "landCoverFrac_Lmon_ACCESS1-3_rcp45_r1i1p1_200601-200601", 
          sourceDir = "Data/Raw", destDir = "Data/Processed/ACCESS1-3_rcp45")

nc_to_csv(Datfile = "landCoverFrac_Lmon_IPSL-CM5A-LR_rcp45_r1i1p1_200601-230012", 
          sourceDir = "Data/Raw", destDir = "Data/Processed/IPSL-CM5A-LR_rcp45")

nc_to_csv(Datfile = "landCoverFrac_Lmon_IPSL-CM5A-MR_rcp45_r1i1p1_200601-210012", 
          sourceDir = "Data/Raw", destDir = "Data/Processed/IPSL-CM5A-MR_rcp45")

nc_to_csv(Datfile = "landCoverFrac_Lmon_IPSL-CM5B-LR_rcp45_r1i1p1_200601-210012", 
          sourceDir = "Data/Raw", destDir = "Data/Processed/IPSL-CM5B-LR_rcp45")

nc_to_csv(Datfile = "landCoverFrac_Lmon_MIROC-ESM_rcp45_r1i1p1_200601-210012", 
          sourceDir = "Data/Raw", destDir = "Data/Processed/MIROC-ESM_rcp45")

nc_to_csv(Datfile = "landCoverFrac_Lmon_MIROC-ESM-CHEM_rcp45_r1i1p1_200601-210012", 
          sourceDir = "Data/Raw", destDir = "Data/Processed/MIROC-ESM-CHEM_rcp45")

nc_to_csv(Datfile = "landCoverFrac_Lmon_MPI-ESM-LR_rcp45_r1i1p1_200601-210012", 
          sourceDir = "Data/Raw", destDir = "Data/Processed/MPI-ESM-LR_rcp45")

nc_to_csv(Datfile = "landCoverFrac_Lmon_MPI-ESM-MR_rcp45_r1i1p1_200601-210012.nc", 
          sourceDir = "Data/Raw", destDir = "Data/Processed/MPI-ESM-MR_rcp45")

# RCP 60
nc_to_csv(Datfile = "landCoverFrac_Lmon_IPSL-CM5A-LR_rcp60_r1i1p1_200601-210012", 
          sourceDir = "Data/Raw", destDir = "Data/Processed/IPSL-CM5A-LR_rcp60")

nc_to_csv(Datfile = "landCoverFrac_Lmon_IPSL-CM5A-MR_rcp60_r1i1p1_200601-210012", 
          sourceDir = "Data/Raw", destDir = "Data/Processed/IPSL-CM5A-MR_rcp60")

nc_to_csv(Datfile = "landCoverFrac_Lmon_MIROC-ESM_rcp60_r1i1p1_200601-210012", 
          sourceDir = "Data/Raw", destDir = "Data/Processed/MIROC-ESM_rcp60")

nc_to_csv(Datfile = "landCoverFrac_Lmon_MIROC-ESM-CHEM_rcp60_r1i1p1_200601-210012", 
          sourceDir = "Data/Raw", destDir = "Data/Processed/MIROC-ESM-CHEM_rcp60")


# RCP 85
nc_to_csv(Datfile = "landCoverFrac_Lmon_ACCESS1-0_rcp85_r1i1p1_200601-200601", 
          sourceDir = "Data/Raw", destDir = "Data/Processed/ACCESS1-0_rcp85")

nc_to_csv(Datfile = "landCoverFrac_Lmon_ACCESS1-3_rcp85_r1i1p1_200601-200601", 
          sourceDir = "Data/Raw", destDir = "Data/Processed/ACCESS1-3_rcp85")

nc_to_csv(Datfile = "landCoverFrac_Lmon_IPSL-CM5A-LR_rcp85_r1i1p1_200601-230012", 
          sourceDir = "Data/Raw", destDir = "Data/Processed/IPSL-CM5A-LR_rcp85")

nc_to_csv(Datfile = "landCoverFrac_Lmon_IPSL-CM5A-MR_rcp85_r1i1p1_200601-210012", 
          sourceDir = "Data/Raw", destDir = "Data/Processed/IPSL-CM5A-MR_rcp85")

nc_to_csv(Datfile = "landCoverFrac_Lmon_IPSL-CM5B-LR_rcp85_r1i1p1_200601-210012", 
          sourceDir = "Data/Raw", destDir = "Data/Processed/IPSL-CM5B-LR_rcp85")

nc_to_csv(Datfile = "landCoverFrac_Lmon_MIROC-ESM_rcp85_r1i1p1_200601-210012", 
          sourceDir = "Data/Raw", destDir = "Data/Processed/MIROC-ESM_rcp85")

nc_to_csv(Datfile = "landCoverFrac_Lmon_MIROC-ESM-CHEM_rcp85_r1i1p1_200601-210012", 
          sourceDir = "Data/Raw", destDir = "Data/Processed/MIROC-ESM-CHEM_rcp85")

nc_to_csv(Datfile = "landCoverFrac_Lmon_MPI-ESM-LR_rcp85_r1i1p1_200601-210012", 
          sourceDir = "Data/Raw", destDir = "Data/Processed/MPI-ESM-LR_rcp85")

nc_to_csv(Datfile = "landCoverFrac_Lmon_MPI-ESM-MR_rcp85_r1i1p1_200601-210012", 
          sourceDir = "Data/Raw", destDir = "Data/Processed/MPI-ESM-MR_rcp85")

nc_to_csv(Datfile = "landCoverFrac_Lmon_MRI-ESM1_rcp85_r1i1p1_200601-210012", 
          sourceDir = "Data/Raw", destDir = "Data/Processed/MRI-ESM1_rcp85")


##### ------------------------ Plotting ---------------------------- #####
# plot discret years
Aus_Vegetation_Plot(sourceDir = "Data/Processed/MIROC-ESM_rcp26", 
                    destDir = "Plots/Discret/MIROC-ESM_rcp26")



##### ------------------------ Clear workspace ---------------------------- #####
rm(list=ls(all=TRUE))

#### End


