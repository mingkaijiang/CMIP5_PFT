####################################################################################
# Plot Australia vegetation maps from CMIP5 datasets 
# For each model and scenario, plot the dominate PFT at each grid over time
#                              plot the % coverage of the dominate PFT at each grid over time
# Specifically for IPSL models as there's no pft information
Dominate_PFT_plot_IPSL <- function(sourceDir, destDir) {
    
    dir.create(destDir, showWarnings = FALSE)
    DatFiles <- list.files(path = sourceDir, pattern = "\\.csv")
    inNames <- file.path(sourceDir, DatFiles, fsep = .Platform$file.sep)
    
    model.name <- gsub(".*Processed/", "", sourceDir)
    outName <- paste0(destDir, "/", model.name, ".pdf")
    
    l <- length(inNames)
    j <- c(1:l)
    
    my.list <- list()
    
    for (i in 1:l) {
        nam <- paste0("myDF", i)
        
        ### read in all files in the directory
        mydat <- read.csv(inNames[i])
        mydat$avg <- rowMeans(mydat[,5:16])
        
        #my.list[[i]] <- mydat[,c("CMIP_Site", "lon", "lat", "year", "avg")]
        my.list[[i]] <- mydat[,c("CMIP_Site", "avg")]
        
    }
    
    # combine the columns
    myDF <- do.call(cbind.data.frame, my.list)
    
    l2 <- seq(2, dim(myDF)[2], 2)
    
    # get the PFT names
    nam.list <- gsub(".*210012_", "", DatFiles)
    nam.list <- gsub(".*230012_", "", nam.list)
    
    nam.list <- gsub(".csv", "", nam.list)
    nam.order <- gsub("_.*", "", nam.list)
    namDF <- data.frame(nam.order, nam.list)
    namDF$nam.order <- as.numeric(as.character(namDF$nam.order))
    namDF <- namDF[order(namDF$nam.order),]
    
    # create pft list
    # reference: Lathiere et al., 2006, ACP, 6, 2129-2146, Figure 1
    pft.list <- c("Bare soil",
                  "Tropical broadleaf evergreen tree",
                  "Tropical broadleaf raingreen tree",
                  "Temperate needleleaf evergreen tree",
                  "Temperate broadleaf evergreen tree",
                  "Temperate broadleaf summergreen tree",
                  "Boreal needleleaf evergreen tree",
                  "Boreal broadleaf summergreen tree",
                  "Boreal needleleaf summergreen tree",
                  "C3 grass",
                  "C4 grass",
                  "C3 agriculture",
                  "C4 agriculture")
    
    namDF$nam.list <- pft.list
    
    # generate pencent dataframe
    pcDF <- myDF[,l2]
    colnames(pcDF) <- nam.list
    
    gridDF <- read.csv(inNames[1])[,1:4]
    
    # combine dfs to generate PFT per grid
    pftDF <- cbind(gridDF, pcDF)
    
    # trying to generate
    # 1: DF with dominant species information
    # 2. DF with percent coverage of dominant species
    
    colmax <- colnames(pcDF)[apply(pcDF,1,which.max)]
    maxpftDF <- cbind(gridDF, colmax)
    maxpc <- apply(pcDF, 1, max)
    maxpftDF$percent <- maxpc
    names(maxpftDF) <- c("CMIP_Site", "lon", "lat", "year", "PFT", "percent")
    maxpftDF$pft_factor <- as.numeric(gsub("_.*", "", maxpftDF$PFT))
    
    # generate year list
    year.list <- unique(maxpftDF$year)
    
    col.list <- rainbow(l+1)
    brks.lab <- namDF$nam.list
    brks <- j
    
    lab.at1 <- brks
    my.at1 <- c(0.5, brks+0.5)
    myColorkey1 <- list(at=my.at1, labels=list(at=lab.at1, labels = brks.lab))
    
    my.at2 <- seq(0, 100, by = 10)
    myColorkey2 <- list(at=my.at2, labels=list(at=my.at2)) 
    
        # plotting
        pdf(outName)
        
        for (n in year.list) {
            # plotting dominant pft
            p1 <- subset(maxpftDF, year == n)
            p1 <- data.frame(p1$lon, p1$lat, p1$pft_factor)
            colnames(p1) <- c("lon", "lat", "PFT")
            
            #r <- rasterFromXYZ(p1)

            tl <- paste0("Year ", n)
            coordinates(p1)=~lon+lat
            gridded(p1) = TRUE
            r <- raster(p1)
            
            plot1 <- levelplot(r, at=my.at1, colorkey=myColorkey1,par.settings=RdBuTheme(), 
                               margin=F,main=tl)
            
            # plotting percent coverage
            # plotting dominant pft
            p2 <- subset(maxpftDF, year == n)
            p2 <- data.frame(p2$lon, p2$lat, p2$percent)
            colnames(p2) <- c("lon", "lat", "percent")
            
            tl <- paste0("Year ", n)
            coordinates(p2)=~lon+lat
            gridded(p2) = TRUE
            r <- raster(p2)
            
            plot2 <- levelplot(r, at=my.at2, colorkey=myColorkey2,par.settings=RdBuTheme(), 
                               margin=F,main=tl)

            grid.arrange(plot1,plot2, ncol=1)
            
            
        }   
        
        dev.off()

}