####################################################################################
# Plot Australia vegetation maps from CMIP5 datasets 
# For each model and scenario, plot the dominate PFT at each grid over time
#                              plot the % coverage of the dominate PFT at each grid over time
Dominate_PFT_plot <- function(sourceDir, destDir) {
    
    dir.create(destDir, showWarnings = FALSE)
    DatFiles <- list.files(path = sourceDir, pattern = "\\.csv")
    inNames <- file.path(sourceDir, DatFiles, fsep = .Platform$file.sep)
    
    l <- length(inNames)
    j <- c(1:l)
    
    my.list <- list()
    
    for (i in 1:l) {
        nam <- paste0("myDF", i)
        
        ### read in all files in the directory
        mydat <- read.csv(inNames[i])
        mydat$avg <- rowMeans(mydat[,5:16])
        
        my.list[[i]] <- mydat[,c("CMIP_Site", "avg")]
    }
    
    # combine the columns
    myDF <- do.call(cbind.data.frame, my.list)
    
    l2 <- seq(2, dim(myDF)[2], 2)
    
    # get the PFT names
    nam.list <- gsub(".*210012_", "", DatFiles)
    nam.list <- gsub(".csv", "", nam.list)
    
    # generate pencent dataframe
    pcDF <- myDF[,l2]
    colnames(pcDF) <- nam.list
    
    gridDF <- read.csv(inNames[1])[,1:4]
    
    # combine dfs to generate PFT per grid
    pftDF <- cbind(gridDF, pcDF)
    
    
    
    
    
        
        # color range
        rg <- range(yr.data)
        
        if (rg[2] - rg[1] == 0) {
            brks <- seq(0, 1, length.out = 11)
            
            brks.lab <- brks
            
        }  else {
            brks <- seq(rg[1], rg[2], length.out = 11)
            
            # breaks labels
            t.n <- max(brks) - 10
            
            if (t.n < 0) {
                brks.lab <- round_any(seq(rg[1], rg[2], length.out = 11), 0.1, ceiling)
                
            } else {
                brks.lab <- round_any(seq(rg[1], rg[2], length.out = 11), 1, ceiling)
            }
        }
        
        col.list <- rev(topo.colors(10))
        
        # plotting
        pdf(outName)
        
        par(oma=c(1,1,2,2),
            mar=c(5,4,4,5),
            mgp = c(3, 1, 0))  
        
        for (j in year.list) {
            # subsetting df for each year
            p1 <- subset(dd, year == j)
            p1 <- data.frame(p1$lon, p1$lat, p1$yr_avg)
            colnames(p1) <- c("lon", "lat", "yr_avg")
            
            tl <- paste0("Year ", j)
            
            # plotting
            #quilt.plot(p1$lon, p1$lat, p1$yr_avg, xlim=c(110, 160), ylim=c(-50, -9),
            #           add.legend=T, breaks=brks, col=col.list,
            #           nx = 10, ny = 10, main = NA, bg="white")
            #legend("bottomleft", tl, cex = 2, bg="lightgrey")
            
            coordinates(p1)=~lon+lat
            gridded(p1) = TRUE
            r <- raster(p1)
            plot(r, xlim=c(110, 160), ylim=c(-50, -9),
                 breaks=brks, col=col.list,
                 main = NA, bg="white",lab.breaks=brks.lab)
            legend("bottomleft", tl, cex = 2, bg="lightgrey")
            
            # add world map
            world(add=T, col=adjustcolor("grey", 0.8))
            
        }   # j
        dev.off()

}