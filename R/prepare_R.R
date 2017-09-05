
#### Prepare folder structure and libraries
####
#### 
################################################################################

#### Install libraries
if(!require(pacman))install.packages("pacman")
pacman::p_load(scatterplot3d, 
               data.table, 
               lattice, 
               plyr,
               rPython,
               grid,
               gridBase,
               ini,
               ncdf4,
               maptools,
               raster,
               spatstat,
               fields) # add other packages needed to this list


#### Sourcing all R files in the function subdirectory
sourcefiles <- dir("modules", pattern="[.]R$", recursive = TRUE, full.names = TRUE)
for(z in sourcefiles)source(z)


op <- par()
