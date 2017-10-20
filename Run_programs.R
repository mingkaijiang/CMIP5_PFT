
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

dir.create("Data/Processed", showWarnings = FALSE)
# RCP 26
nc_to_csv(Datfile = "landCoverFrac_Lmon_MIROC-ESM_rcp26_r1i1p1_200601-210012", 
          sourceDir = "Data/Raw", destDir = "Data/Processed/MIROC-ESM_rcp26")

nc_to_csv_IPSL(Datfile = "landCoverFrac_Lmon_IPSL-CM5A-LR_rcp26_r1i1p1_200601-230012", 
               sourceDir = "Data/Raw", destDir = "Data/Processed/IPSL-CM5A-LR_rcp26")

nc_to_csv_IPSL(Datfile = "landCoverFrac_Lmon_IPSL-CM5A-MR_rcp26_r1i1p1_200601-210012", 
               sourceDir = "Data/Raw", destDir = "Data/Processed/IPSL-CM5A-MR_rcp26")

nc_to_csv(Datfile = "landCoverFrac_Lmon_MIROC-ESM-CHEM_rcp26_r1i1p1_200601-210012", 
          sourceDir = "Data/Raw", destDir = "Data/Processed/MIROC-ESM-CHEM_rcp26")

nc_to_csv(Datfile = "landCoverFrac_Lmon_MPI-ESM-LR_rcp26_r1i1p1_200601-210012", 
          sourceDir = "Data/Raw", destDir = "Data/Processed/MPI-ESM-LR_rcp26")

nc_to_csv(Datfile = "landCoverFrac_Lmon_MPI-ESM-MR_rcp26_r1i1p1_200601-210012", 
          sourceDir = "Data/Raw", destDir = "Data/Processed/MPI-ESM-MR_rcp26")


# RCP 45
nc_to_csv_ACCESS(Datfile = "landCoverFrac_Lmon_ACCESS1-0_rcp45_r1i1p1_200601-200601", 
                 sourceDir = "Data/Raw", destDir = "Data/Processed/ACCESS1-0_rcp45")

nc_to_csv_ACCESS(Datfile = "landCoverFrac_Lmon_ACCESS1-3_rcp45_r1i1p1_200601-200601", 
                 sourceDir = "Data/Raw", destDir = "Data/Processed/ACCESS1-3_rcp45")

nc_to_csv_IPSL(Datfile = "landCoverFrac_Lmon_IPSL-CM5A-LR_rcp45_r1i1p1_200601-230012", 
               sourceDir = "Data/Raw", destDir = "Data/Processed/IPSL-CM5A-LR_rcp45")

nc_to_csv_IPSL(Datfile = "landCoverFrac_Lmon_IPSL-CM5A-MR_rcp45_r1i1p1_200601-210012", 
               sourceDir = "Data/Raw", destDir = "Data/Processed/IPSL-CM5A-MR_rcp45")

nc_to_csv_IPSL(Datfile = "landCoverFrac_Lmon_IPSL-CM5B-LR_rcp45_r1i1p1_200601-210012", 
               sourceDir = "Data/Raw", destDir = "Data/Processed/IPSL-CM5B-LR_rcp45")

nc_to_csv(Datfile = "landCoverFrac_Lmon_MIROC-ESM_rcp45_r1i1p1_200601-210012", 
          sourceDir = "Data/Raw", destDir = "Data/Processed/MIROC-ESM_rcp45")

nc_to_csv(Datfile = "landCoverFrac_Lmon_MIROC-ESM-CHEM_rcp45_r1i1p1_200601-210012", 
          sourceDir = "Data/Raw", destDir = "Data/Processed/MIROC-ESM-CHEM_rcp45")

nc_to_csv(Datfile = "landCoverFrac_Lmon_MPI-ESM-LR_rcp45_r1i1p1_200601-210012", 
          sourceDir = "Data/Raw", destDir = "Data/Processed/MPI-ESM-LR_rcp45")

nc_to_csv(Datfile = "landCoverFrac_Lmon_MPI-ESM-MR_rcp45_r1i1p1_200601-210012", 
          sourceDir = "Data/Raw", destDir = "Data/Processed/MPI-ESM-MR_rcp45")


# RCP 60
nc_to_csv_IPSL(Datfile = "landCoverFrac_Lmon_IPSL-CM5A-LR_rcp60_r1i1p1_200601-210012", 
               sourceDir = "Data/Raw", destDir = "Data/Processed/IPSL-CM5A-LR_rcp60")

nc_to_csv_IPSL(Datfile = "landCoverFrac_Lmon_IPSL-CM5A-MR_rcp60_r1i1p1_200601-210012", 
               sourceDir = "Data/Raw", destDir = "Data/Processed/IPSL-CM5A-MR_rcp60")

nc_to_csv(Datfile = "landCoverFrac_Lmon_MIROC-ESM_rcp60_r1i1p1_200601-210012", 
          sourceDir = "Data/Raw", destDir = "Data/Processed/MIROC-ESM_rcp60")

nc_to_csv(Datfile = "landCoverFrac_Lmon_MIROC-ESM-CHEM_rcp60_r1i1p1_200601-210012", 
          sourceDir = "Data/Raw", destDir = "Data/Processed/MIROC-ESM-CHEM_rcp60")


# RCP 85
nc_to_csv_ACCESS(Datfile = "landCoverFrac_Lmon_ACCESS1-0_rcp85_r1i1p1_200601-200601", 
                 sourceDir = "Data/Raw", destDir = "Data/Processed/ACCESS1-0_rcp85")

nc_to_csv_ACCESS(Datfile = "landCoverFrac_Lmon_ACCESS1-3_rcp85_r1i1p1_200601-200601", 
                 sourceDir = "Data/Raw", destDir = "Data/Processed/ACCESS1-3_rcp85")

nc_to_csv_IPSL(Datfile = "landCoverFrac_Lmon_IPSL-CM5A-LR_rcp85_r1i1p1_200601-230012", 
               sourceDir = "Data/Raw", destDir = "Data/Processed/IPSL-CM5A-LR_rcp85")

nc_to_csv_IPSL(Datfile = "landCoverFrac_Lmon_IPSL-CM5A-MR_rcp85_r1i1p1_200601-210012", 
               sourceDir = "Data/Raw", destDir = "Data/Processed/IPSL-CM5A-MR_rcp85")

nc_to_csv_IPSL(Datfile = "landCoverFrac_Lmon_IPSL-CM5B-LR_rcp85_r1i1p1_200601-210012", 
               sourceDir = "Data/Raw", destDir = "Data/Processed/IPSL-CM5B-LR_rcp85")

nc_to_csv(Datfile = "landCoverFrac_Lmon_MIROC-ESM_rcp85_r1i1p1_200601-210012", 
          sourceDir = "Data/Raw", destDir = "Data/Processed/MIROC-ESM_rcp85")

nc_to_csv(Datfile = "landCoverFrac_Lmon_MIROC-ESM-CHEM_rcp85_r1i1p1_200601-210012", 
          sourceDir = "Data/Raw", destDir = "Data/Processed/MIROC-ESM-CHEM_rcp85")

nc_to_csv(Datfile = "landCoverFrac_Lmon_MPI-ESM-LR_rcp85_r1i1p1_200601-210012", 
          sourceDir = "Data/Raw", destDir = "Data/Processed/MPI-ESM-LR_rcp85")

nc_to_csv(Datfile = "landCoverFrac_Lmon_MPI-ESM-MR_rcp85_r1i1p1_200601-210012", 
          sourceDir = "Data/Raw", destDir = "Data/Processed/MPI-ESM-MR_rcp85")


##### ------------------------ Plotting ---------------------------- #####
### plot discret years to test
dir.create("Plots/Discret", showWarnings = FALSE)
Aus_Vegetation_Plot_Discret(sourceDir = "Data/Processed/MIROC-ESM_rcp26", 
                            destDir = "Plots/Discret/MIROC-ESM_rcp26")

### plot continuous year plots within the same pdf file
dir.create("Plots/Continuous", showWarnings = FALSE)

## RCP 26
Aus_Vegetation_Plot_Continuous(sourceDir = "Data/Processed/MIROC-ESM_rcp26",
                               destDir = "Plots/Continuous/MIROC-ESM_rcp26")

Aus_Vegetation_Plot_Continuous(sourceDir = "Data/Processed/IPSL-CM5A-LR_rcp26",
                               destDir = "Plots/Continuous/IPSL-CM5A-LR_rcp26")

Aus_Vegetation_Plot_Continuous(sourceDir = "Data/Processed/IPSL-CM5A-MR_rcp26",
                               destDir = "Plots/Continuous/IPSL-CM5A-MR_rcp26")

Aus_Vegetation_Plot_Continuous(sourceDir = "Data/Processed/MIROC-ESM-CHEM_rcp26",
                               destDir = "Plots/Continuous/MIROC-ESM-CHEM_rcp26")

Aus_Vegetation_Plot_Continuous(sourceDir = "Data/Processed/MPI-ESM-LR_rcp26",
                               destDir = "Plots/Continuous/MPI-ESM-LR_rcp26")

Aus_Vegetation_Plot_Continuous(sourceDir = "Data/Processed/MPI-ESM-MR_rcp26",
                               destDir = "Plots/Continuous/MPI-ESM-MR_rcp26")

## RCP 45
Aus_Vegetation_Plot_Continuous(sourceDir = "Data/Processed/ACCESS1-0_rcp45",
                               destDir = "Plots/Continuous/ACCESS1-0_rcp45")

Aus_Vegetation_Plot_Continuous(sourceDir = "Data/Processed/ACCESS1-3_rcp45",
                               destDir = "Plots/Continuous/ACCESS1-3_rcp45")

Aus_Vegetation_Plot_Continuous(sourceDir = "Data/Processed/IPSL-CM5A-LR_rcp45",
                               destDir = "Plots/Continuous/IPSL-CM5A-LR_rcp45")

Aus_Vegetation_Plot_Continuous(sourceDir = "Data/Processed/IPSL-CM5A-MR_rcp45",
                               destDir = "Plots/Continuous/IPSL-CM5A-MR_rcp45")

Aus_Vegetation_Plot_Continuous(sourceDir = "Data/Processed/IPSL-CM5B-LR_rcp45",
                               destDir = "Plots/Continuous/IPSL-CM5B-LR_rcp45")

Aus_Vegetation_Plot_Continuous(sourceDir = "Data/Processed/MIROC-ESM_rcp45",
                               destDir = "Plots/Continuous/MIROC-ESM_rcp45")

Aus_Vegetation_Plot_Continuous(sourceDir = "Data/Processed/MIROC-ESM-CHEM_rcp45",
                               destDir = "Plots/Continuous/MIROC-ESM-CHEM_rcp45")

Aus_Vegetation_Plot_Continuous(sourceDir = "Data/Processed/MPI-ESM-LR_rcp45",
                               destDir = "Plots/Continuous/MPI-ESM-LR_rcp45")

Aus_Vegetation_Plot_Continuous(sourceDir = "Data/Processed/MPI-ESM-MR_rcp45",
                               destDir = "Plots/Continuous/MPI-ESM-MR_rcp45")


## RCP 60
Aus_Vegetation_Plot_Continuous(sourceDir = "Data/Processed/IPSL-CM5A-LR_rcp60",
                               destDir = "Plots/Continuous/IPSL-CM5A-LR_rcp60")

Aus_Vegetation_Plot_Continuous(sourceDir = "Data/Processed/IPSL-CM5A-MR_rcp60",
                               destDir = "Plots/Continuous/IPSL-CM5A-MR_rcp60")

Aus_Vegetation_Plot_Continuous(sourceDir = "Data/Processed/MIROC-ESM_rcp60",
                               destDir = "Plots/Continuous/MIROC-ESM_rcp60")

Aus_Vegetation_Plot_Continuous(sourceDir = "Data/Processed/MIROC-ESM-CHEM_rcp60",
                               destDir = "Plots/Continuous/MIROC-ESM-CHEM_rcp60")


## RCP 85
Aus_Vegetation_Plot_Continuous(sourceDir = "Data/Processed/ACCESS1-0_rcp85",
                               destDir = "Plots/Continuous/ACCESS1-0_rcp85")

Aus_Vegetation_Plot_Continuous(sourceDir = "Data/Processed/ACCESS1-3_rcp85",
                               destDir = "Plots/Continuous/ACCESS1-3_rcp85")

Aus_Vegetation_Plot_Continuous(sourceDir = "Data/Processed/IPSL-CM5A-LR_rcp85",
                               destDir = "Plots/Continuous/IPSL-CM5A-LR_rcp85")

Aus_Vegetation_Plot_Continuous(sourceDir = "Data/Processed/IPSL-CM5A-MR_rcp85",
                               destDir = "Plots/Continuous/IPSL-CM5A-MR_rcp85")

Aus_Vegetation_Plot_Continuous(sourceDir = "Data/Processed/IPSL-CM5B-LR_rcp85",
                               destDir = "Plots/Continuous/IPSL-CM5B-LR_rcp85")

Aus_Vegetation_Plot_Continuous(sourceDir = "Data/Processed/MIROC-ESM_rcp85",
                               destDir = "Plots/Continuous/MIROC-ESM_rcp85")

Aus_Vegetation_Plot_Continuous(sourceDir = "Data/Processed/MIROC-ESM-CHEM_rcp85",
                               destDir = "Plots/Continuous/MIROC-ESM-CHEM_rcp85")

Aus_Vegetation_Plot_Continuous(sourceDir = "Data/Processed/MPI-ESM-LR_rcp85",
                               destDir = "Plots/Continuous/MPI-ESM-LR_rcp85")

Aus_Vegetation_Plot_Continuous(sourceDir = "Data/Processed/MPI-ESM-MR_rcp85",
                               destDir = "Plots/Continuous/MPI-ESM-MR_rcp85")

### plot continuous year plots within the same pdf file
dir.create("Plots/Annual", showWarnings = FALSE)

## RCP 26
Aus_Vegetation_Plot_Continuous_Annual(sourceDir = "Data/Processed/MIROC-ESM_rcp26",
                               destDir = "Plots/Annual/MIROC-ESM_rcp26")

Aus_Vegetation_Plot_Continuous_Annual(sourceDir = "Data/Processed/IPSL-CM5A-LR_rcp26",
                               destDir = "Plots/Annual/IPSL-CM5A-LR_rcp26")

Aus_Vegetation_Plot_Continuous_Annual(sourceDir = "Data/Processed/IPSL-CM5A-MR_rcp26",
                               destDir = "Plots/Annual/IPSL-CM5A-MR_rcp26")

Aus_Vegetation_Plot_Continuous_Annual(sourceDir = "Data/Processed/MIROC-ESM-CHEM_rcp26",
                               destDir = "Plots/Annual/MIROC-ESM-CHEM_rcp26")

Aus_Vegetation_Plot_Continuous_Annual(sourceDir = "Data/Processed/MPI-ESM-LR_rcp26",
                               destDir = "Plots/Annual/MPI-ESM-LR_rcp26")

Aus_Vegetation_Plot_Continuous_Annual(sourceDir = "Data/Processed/MPI-ESM-MR_rcp26",
                               destDir = "Plots/Annual/MPI-ESM-MR_rcp26")

## RCP 45
Aus_Vegetation_Plot_Continuous_Annual(sourceDir = "Data/Processed/ACCESS1-0_rcp45",
                               destDir = "Plots/Annual/ACCESS1-0_rcp45")

Aus_Vegetation_Plot_Continuous_Annual(sourceDir = "Data/Processed/ACCESS1-3_rcp45",
                               destDir = "Plots/Annual/ACCESS1-3_rcp45")

Aus_Vegetation_Plot_Continuous_Annual(sourceDir = "Data/Processed/IPSL-CM5A-LR_rcp45",
                               destDir = "Plots/Annual/IPSL-CM5A-LR_rcp45")

Aus_Vegetation_Plot_Continuous_Annual(sourceDir = "Data/Processed/IPSL-CM5A-MR_rcp45",
                               destDir = "Plots/Annual/IPSL-CM5A-MR_rcp45")

Aus_Vegetation_Plot_Continuous_Annual(sourceDir = "Data/Processed/IPSL-CM5B-LR_rcp45",
                               destDir = "Plots/Annual/IPSL-CM5B-LR_rcp45")

Aus_Vegetation_Plot_Continuous_Annual(sourceDir = "Data/Processed/MIROC-ESM_rcp45",
                               destDir = "Plots/Annual/MIROC-ESM_rcp45")

Aus_Vegetation_Plot_Continuous_Annual(sourceDir = "Data/Processed/MIROC-ESM-CHEM_rcp45",
                               destDir = "Plots/Annual/MIROC-ESM-CHEM_rcp45")

Aus_Vegetation_Plot_Continuous_Annual(sourceDir = "Data/Processed/MPI-ESM-LR_rcp45",
                               destDir = "Plots/Annual/MPI-ESM-LR_rcp45")

Aus_Vegetation_Plot_Continuous_Annual(sourceDir = "Data/Processed/MPI-ESM-MR_rcp45",
                               destDir = "Plots/Annual/MPI-ESM-MR_rcp45")


## RCP 60
Aus_Vegetation_Plot_Continuous_Annual(sourceDir = "Data/Processed/IPSL-CM5A-LR_rcp60",
                               destDir = "Plots/Annual/IPSL-CM5A-LR_rcp60")

Aus_Vegetation_Plot_Continuous_Annual(sourceDir = "Data/Processed/IPSL-CM5A-MR_rcp60",
                               destDir = "Plots/Annual/IPSL-CM5A-MR_rcp60")

Aus_Vegetation_Plot_Continuous_Annual(sourceDir = "Data/Processed/MIROC-ESM_rcp60",
                               destDir = "Plots/Annual/MIROC-ESM_rcp60")

Aus_Vegetation_Plot_Continuous_Annual(sourceDir = "Data/Processed/MIROC-ESM-CHEM_rcp60",
                               destDir = "Plots/Annual/MIROC-ESM-CHEM_rcp60")


## RCP 85
Aus_Vegetation_Plot_Continuous_Annual(sourceDir = "Data/Processed/ACCESS1-0_rcp85",
                               destDir = "Plots/Annual/ACCESS1-0_rcp85")

Aus_Vegetation_Plot_Continuous_Annual(sourceDir = "Data/Processed/ACCESS1-3_rcp85",
                               destDir = "Plots/Annual/ACCESS1-3_rcp85")

Aus_Vegetation_Plot_Continuous_Annual(sourceDir = "Data/Processed/IPSL-CM5A-LR_rcp85",
                               destDir = "Plots/Annual/IPSL-CM5A-LR_rcp85")

Aus_Vegetation_Plot_Continuous_Annual(sourceDir = "Data/Processed/IPSL-CM5A-MR_rcp85",
                               destDir = "Plots/Annual/IPSL-CM5A-MR_rcp85")

Aus_Vegetation_Plot_Continuous_Annual(sourceDir = "Data/Processed/IPSL-CM5B-LR_rcp85",
                               destDir = "Plots/Annual/IPSL-CM5B-LR_rcp85")

Aus_Vegetation_Plot_Continuous_Annual(sourceDir = "Data/Processed/MIROC-ESM_rcp85",
                               destDir = "Plots/Annual/MIROC-ESM_rcp85")

Aus_Vegetation_Plot_Continuous_Annual(sourceDir = "Data/Processed/MIROC-ESM-CHEM_rcp85",
                               destDir = "Plots/Annual/MIROC-ESM-CHEM_rcp85")

Aus_Vegetation_Plot_Continuous_Annual(sourceDir = "Data/Processed/MPI-ESM-LR_rcp85",
                               destDir = "Plots/Annual/MPI-ESM-LR_rcp85")

Aus_Vegetation_Plot_Continuous_Annual(sourceDir = "Data/Processed/MPI-ESM-MR_rcp85",
                               destDir = "Plots/Annual/MPI-ESM-MR_rcp85")


##### ------------------------ Animated plots ---------------------------- #####
dir.create("Plots/Animated", showWarnings = FALSE)

## RCP 26
animated_plot_command(sourceDir = "Plots/Annual/MIROC-ESM_rcp26",
                               destDir = "Plots/Animated/MIROC-ESM_rcp26")

animated_plot_command(sourceDir = "Plots/Annual/IPSL-CM5A-LR_rcp26",
                               destDir = "Plots/Animated/IPSL-CM5A-LR_rcp26")

animated_plot_command(sourceDir = "Plots/Annual/IPSL-CM5A-MR_rcp26",
                               destDir = "Plots/Animated/IPSL-CM5A-MR_rcp26")

animated_plot_command(sourceDir = "Plots/Annual/MIROC-ESM-CHEM_rcp26",
                               destDir = "Plots/Animated/MIROC-ESM-CHEM_rcp26")

animated_plot_command(sourceDir = "Plots/Annual/MPI-ESM-LR_rcp26",
                               destDir = "Plots/Animated/MPI-ESM-LR_rcp26")

animated_plot_command(sourceDir = "Plots/Annual/MPI-ESM-MR_rcp26",
                               destDir = "Plots/Animated/MPI-ESM-MR_rcp26")

## RCP 45
animated_plot_command(sourceDir = "Plots/Annual/ACCESS1-0_rcp45",
                               destDir = "Plots/Animated/ACCESS1-0_rcp45")

animated_plot_command(sourceDir = "Plots/Annual/ACCESS1-3_rcp45",
                               destDir = "Plots/Animated/ACCESS1-3_rcp45")

animated_plot_command(sourceDir = "Plots/Annual/IPSL-CM5A-LR_rcp45",
                               destDir = "Plots/Animated/IPSL-CM5A-LR_rcp45")

animated_plot_command(sourceDir = "Plots/Annual/IPSL-CM5A-MR_rcp45",
                               destDir = "Plots/Animated/IPSL-CM5A-MR_rcp45")

animated_plot_command(sourceDir = "Plots/Annual/IPSL-CM5B-LR_rcp45",
                               destDir = "Plots/Animated/IPSL-CM5B-LR_rcp45")

animated_plot_command(sourceDir = "Plots/Annual/MIROC-ESM_rcp45",
                               destDir = "Plots/Animated/MIROC-ESM_rcp45")

animated_plot_command(sourceDir = "Plots/Annual/MIROC-ESM-CHEM_rcp45",
                               destDir = "Plots/Animated/MIROC-ESM-CHEM_rcp45")

animated_plot_command(sourceDir = "Plots/Annual/MPI-ESM-LR_rcp45",
                               destDir = "Plots/Animated/MPI-ESM-LR_rcp45")

animated_plot_command(sourceDir = "Plots/Annual/MPI-ESM-MR_rcp45",
                               destDir = "Plots/Animated/MPI-ESM-MR_rcp45")


## RCP 60
animated_plot_command(sourceDir = "Plots/Annual/IPSL-CM5A-LR_rcp60",
                               destDir = "Plots/Animated/IPSL-CM5A-LR_rcp60")

animated_plot_command(sourceDir = "Plots/Annual/IPSL-CM5A-MR_rcp60",
                               destDir = "Plots/Animated/IPSL-CM5A-MR_rcp60")

animated_plot_command(sourceDir = "Plots/Annual/MIROC-ESM_rcp60",
                               destDir = "Plots/Animated/MIROC-ESM_rcp60")

animated_plot_command(sourceDir = "Plots/Annual/MIROC-ESM-CHEM_rcp60",
                               destDir = "Plots/Animated/MIROC-ESM-CHEM_rcp60")


## RCP 85
animated_plot_command(sourceDir = "Plots/Annual/ACCESS1-0_rcp85",
                               destDir = "Plots/Animated/ACCESS1-0_rcp85")

animated_plot_command(sourceDir = "Plots/Annual/ACCESS1-3_rcp85",
                               destDir = "Plots/Animated/ACCESS1-3_rcp85")

animated_plot_command(sourceDir = "Plots/Annual/IPSL-CM5A-LR_rcp85",
                               destDir = "Plots/Animated/IPSL-CM5A-LR_rcp85")

animated_plot_command(sourceDir = "Plots/Annual/IPSL-CM5A-MR_rcp85",
                               destDir = "Plots/Animated/IPSL-CM5A-MR_rcp85")

animated_plot_command(sourceDir = "Plots/Annual/IPSL-CM5B-LR_rcp85",
                               destDir = "Plots/Animated/IPSL-CM5B-LR_rcp85")

animated_plot_command(sourceDir = "Plots/Annual/MIROC-ESM_rcp85",
                               destDir = "Plots/Animated/MIROC-ESM_rcp85")

animated_plot_command(sourceDir = "Plots/Annual/MIROC-ESM-CHEM_rcp85",
                               destDir = "Plots/Animated/MIROC-ESM-CHEM_rcp85")

animated_plot_command(sourceDir = "Plots/Annual/MPI-ESM-LR_rcp85",
                               destDir = "Plots/Animated/MPI-ESM-LR_rcp85")

animated_plot_command(sourceDir = "Plots/Annual/MPI-ESM-MR_rcp85",
                               destDir = "Plots/Animated/MPI-ESM-MR_rcp85")


##### ---------------- Update PFT types for IPSL models -------------------- #####

## RCP 26
IPSL_PFT_assignment(sourceDir = "Plots/Animated/IPSL-CM5A-LR_rcp26")

IPSL_PFT_assignment(sourceDir = "Plots/Animated/IPSL-CM5A-MR_rcp26")

## RCP 45
IPSL_PFT_assignment(sourceDir = "Plots/Animated/IPSL-CM5A-LR_rcp45")

IPSL_PFT_assignment(sourceDir = "Plots/Animated/IPSL-CM5A-MR_rcp45")

IPSL_PFT_assignment(sourceDir = "Plots/Animated/IPSL-CM5B-LR_rcp45")

## RCP 60
IPSL_PFT_assignment(sourceDir = "Plots/Animated/IPSL-CM5A-LR_rcp60")

IPSL_PFT_assignment(sourceDir = "Plots/Animated/IPSL-CM5A-MR_rcp60")

## RCP 85
IPSL_PFT_assignment(sourceDir = "Plots/Animated/IPSL-CM5A-LR_rcp85")

IPSL_PFT_assignment(sourceDir = "Plots/Animated/IPSL-CM5A-MR_rcp85")

IPSL_PFT_assignment(sourceDir = "Plots/Animated/IPSL-CM5B-LR_rcp85")


##### ---------------- Obtain % of dominant vegetation for each grid -------------------- #####
#### To compute, for each model and scenario, a map of the dominant PFT and its percentage changes at decadal scale

### plot continuous year plots within the same pdf file
dir.create("Plots/Dominate", showWarnings = FALSE)

## RCP 26
Dominate_PFT_plot(sourceDir = "Data/Processed/MIROC-ESM_rcp26",
                  destDir = "Plots/Dominate/MIROC-ESM_rcp26")

Dominate_PFT_plot(sourceDir = "Data/Processed/IPSL-CM5A-LR_rcp26",
                               destDir = "Plots/Dominate/IPSL-CM5A-LR_rcp26")

Dominate_PFT_plot(sourceDir = "Data/Processed/IPSL-CM5A-MR_rcp26",
                               destDir = "Plots/Dominate/IPSL-CM5A-MR_rcp26")

Dominate_PFT_plot(sourceDir = "Data/Processed/MIROC-ESM-CHEM_rcp26",
                               destDir = "Plots/Dominate/MIROC-ESM-CHEM_rcp26")

Dominate_PFT_plot(sourceDir = "Data/Processed/MPI-ESM-LR_rcp26",
                               destDir = "Plots/Dominate/MPI-ESM-LR_rcp26")

Dominate_PFT_plot(sourceDir = "Data/Processed/MPI-ESM-MR_rcp26",
                               destDir = "Plots/Dominate/MPI-ESM-MR_rcp26")

## RCP 45
Dominate_PFT_plot_ACCESS(sourceDir = "Data/Processed/ACCESS1-0_rcp45",
                               destDir = "Plots/Dominate/ACCESS1-0_rcp45")

Dominate_PFT_plot_ACCESS(sourceDir = "Data/Processed/ACCESS1-3_rcp45",
                               destDir = "Plots/Dominate/ACCESS1-3_rcp45")

Dominate_PFT_plot(sourceDir = "Data/Processed/IPSL-CM5A-LR_rcp45",
                               destDir = "Plots/Dominate/IPSL-CM5A-LR_rcp45")

Dominate_PFT_plot(sourceDir = "Data/Processed/IPSL-CM5A-MR_rcp45",
                               destDir = "Plots/Dominate/IPSL-CM5A-MR_rcp45")

Dominate_PFT_plot(sourceDir = "Data/Processed/IPSL-CM5B-LR_rcp45",
                               destDir = "Plots/Dominate/IPSL-CM5B-LR_rcp45")

Dominate_PFT_plot(sourceDir = "Data/Processed/MIROC-ESM_rcp45",
                               destDir = "Plots/Dominate/MIROC-ESM_rcp45")

Dominate_PFT_plot(sourceDir = "Data/Processed/MIROC-ESM-CHEM_rcp45",
                               destDir = "Plots/Dominate/MIROC-ESM-CHEM_rcp45")

Dominate_PFT_plot(sourceDir = "Data/Processed/MPI-ESM-LR_rcp45",
                               destDir = "Plots/Dominate/MPI-ESM-LR_rcp45")

Dominate_PFT_plot(sourceDir = "Data/Processed/MPI-ESM-MR_rcp45",
                               destDir = "Plots/Dominate/MPI-ESM-MR_rcp45")


## RCP 60
Dominate_PFT_plot(sourceDir = "Data/Processed/IPSL-CM5A-LR_rcp60",
                               destDir = "Plots/Dominate/IPSL-CM5A-LR_rcp60")

Dominate_PFT_plot(sourceDir = "Data/Processed/IPSL-CM5A-MR_rcp60",
                               destDir = "Plots/Dominate/IPSL-CM5A-MR_rcp60")

Dominate_PFT_plot(sourceDir = "Data/Processed/MIROC-ESM_rcp60",
                               destDir = "Plots/Dominate/MIROC-ESM_rcp60")

Dominate_PFT_plot(sourceDir = "Data/Processed/MIROC-ESM-CHEM_rcp60",
                               destDir = "Plots/Dominate/MIROC-ESM-CHEM_rcp60")


## RCP 85
Dominate_PFT_plot_ACCESS(sourceDir = "Data/Processed/ACCESS1-0_rcp85",
                               destDir = "Plots/Dominate/ACCESS1-0_rcp85")

Dominate_PFT_plot_ACCESS(sourceDir = "Data/Processed/ACCESS1-3_rcp85",
                               destDir = "Plots/Dominate/ACCESS1-3_rcp85")

Dominate_PFT_plot(sourceDir = "Data/Processed/IPSL-CM5A-LR_rcp85",
                               destDir = "Plots/Dominate/IPSL-CM5A-LR_rcp85")

Dominate_PFT_plot(sourceDir = "Data/Processed/IPSL-CM5A-MR_rcp85",
                               destDir = "Plots/Dominate/IPSL-CM5A-MR_rcp85")

Dominate_PFT_plot(sourceDir = "Data/Processed/IPSL-CM5B-LR_rcp85",
                               destDir = "Plots/Dominate/IPSL-CM5B-LR_rcp85")

Dominate_PFT_plot(sourceDir = "Data/Processed/MIROC-ESM_rcp85",
                               destDir = "Plots/Dominate/MIROC-ESM_rcp85")

Dominate_PFT_plot(sourceDir = "Data/Processed/MIROC-ESM-CHEM_rcp85",
                               destDir = "Plots/Dominate/MIROC-ESM-CHEM_rcp85")

Dominate_PFT_plot(sourceDir = "Data/Processed/MPI-ESM-LR_rcp85",
                               destDir = "Plots/Dominate/MPI-ESM-LR_rcp85")

Dominate_PFT_plot(sourceDir = "Data/Processed/MPI-ESM-MR_rcp85",
                               destDir = "Plots/Dominate/MPI-ESM-MR_rcp85")

##### ------------------------ Clear workspace ---------------------------- #####
rm(list=ls(all=TRUE))

#### End


