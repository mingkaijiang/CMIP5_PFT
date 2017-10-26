####################################################################################
# Plot Australia maps for RCP8.5 scenario
# 2100 PFT and % coverage across RCP8.5 models

All_RCP85_plot <- function(sourceDir, destDir) {
    
    # create destination directory
    dir.create(destDir, showWarnings = FALSE)
    
    # RCP 8.5 files
    file.list <- c("ACCESS1-3_rcp85",
                   "IPSL-CM5A-MR_rcp85",
                   "MIROC-ESM-CHEM_rcp85",
                   "MPI-ESM-LR_rcp85")
    
    # output lists
    model.list <- list()
    my.at1.list <- list()
    my.at2.list <- list()
    myColorkey1.list <- list()
    myColorkey2.list <- list()
    
    
    for (i in 1:length(file.list)) {
        # create file paths
        source <- paste0(sourceDir, "/", file.list[i])
        DatFiles <- list.files(path = source, pattern = "\\.csv")
        inNames <- file.path(source, DatFiles, fsep = .Platform$file.sep)

        # get file properties
        l <- length(inNames)
        j <- c(1:l)
        
        my.list <- list()
        
        for (k in 1:l) {
            ### read in all files in the directory
            mydat <- read.csv(inNames[k])
            d_2 <- dim(mydat)[2]
            
            if (d_2 == 5) {
                test <- mydat[,5]
            } else {
                test <- rowMeans(mydat[,5:d_2])
            }
            
            mydat$avg <- test
            
            my.list[[k]] <- mydat[,c("CMIP_Site", "avg")]
            
        }
        
        # combine the columns
        myDF <- do.call(cbind.data.frame, my.list)
        
        l2 <- seq(2, dim(myDF)[2], 2)
        
        # get the PFT names
        nam.list <- gsub(".*210012_", "", DatFiles)
        nam.list <- gsub(".*230012_", "", nam.list)
        nam.list <- gsub(".*200601_", "", nam.list)
        nam.list <- gsub(".csv", "", nam.list)
        nam.order <- gsub("_.*", "", nam.list)
        namDF <- data.frame(nam.order, nam.list)
        namDF$nam.order <- as.numeric(as.character(namDF$nam.order))
        namDF <- namDF[order(namDF$nam.order),]
        
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
        
        if(i == 1) {
            maxpftDF <- subset(maxpftDF, percent > 0)
        }
        
        # assign the dataframe to the model list
        model.list[[i]] <- maxpftDF
        brks.lab <- namDF$nam.list
        brks <- j
        lab.at1 <- brks
        my.at1 <- c(0.5, brks+0.5)
        myColorkey1 <- list(at=my.at1, labels=list(at=lab.at1, labels = brks.lab))
        
        my.at2 <- seq(0, 100, by = 10)
        myColorkey2 <- list(at=my.at2, labels=list(at=my.at2)) 
        
        my.at1.list[[i]] <- my.at1
        my.at2.list[[i]] <- my.at2
        myColorkey1.list[[i]] <- myColorkey1
        myColorkey2.list[[i]] <- myColorkey2
        
    }
    
    # 4 models
    acDF <- model.list[[1]]
    ipDF <- model.list[[2]]
    ipDF <- subset(ipDF, year == 2100)
    mrDF <- model.list[[3]]
    mrDF <- subset(mrDF, year == 2100)
    mxDF <- model.list[[4]]
    mxDF <- subset(mxDF, year == 2100)
    
    # create pft list for IPSL
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
    
    myColorkey1.list[[2]]$labels$labels <- pft.list
    
    outName <- paste0(destDir, "/RCP85_2100_PFT_coverage.pdf")


    # plotting
    pdf(outName, width = 24, height = 10)
    
    par(mar = c(5, 4, 4, 2))
    
    # plotting dominant pft  ACCESS
    p1 <- data.frame(acDF$lon, acDF$lat, acDF$pft_factor)
    colnames(p1) <- c("lon", "lat", "PFT")
    
    coordinates(p1)=~lon+lat
    gridded(p1) = TRUE
    r <- raster(p1)
    
    plot1 <- levelplot(r, at=my.at1.list[[1]], colorkey=myColorkey1.list[[1]],
                       par.settings=custom.theme(symbol=brewer.pal(12, "Paired"),
                                                 fill=brewer.pal(12, "Paired"),
                                                 region = brewer.pal(12, "Paired")), 
                       margin=F,main=file.list[1])
    
    # plotting dominant pft IPSL
    p1 <- data.frame(ipDF$lon, ipDF$lat, ipDF$pft_factor)
    colnames(p1) <- c("lon", "lat", "PFT")
    
    coordinates(p1)=~lon+lat
    gridded(p1) = TRUE
    r <- raster(p1)
    
    plot2 <- levelplot(r, at=my.at1.list[[2]], colorkey=myColorkey1.list[[2]],
                       par.settings=custom.theme(symbol=brewer.pal(12, "Paired"),
                                                 fill=brewer.pal(12, "Paired"),
                                                 region = brewer.pal(12, "Paired")), 
                       margin=F,main=file.list[2])
    
    # plotting dominant pft MIROC
    p1 <- data.frame(mrDF$lon, mrDF$lat, mrDF$pft_factor)
    colnames(p1) <- c("lon", "lat", "PFT")
    
    coordinates(p1)=~lon+lat
    gridded(p1) = TRUE
    r <- raster(p1)
    
    plot3 <- levelplot(r, at=my.at1.list[[3]], colorkey=myColorkey1.list[[3]],
                       par.settings=custom.theme(symbol=brewer.pal(12, "Paired"),
                                                 fill=brewer.pal(12, "Paired"),
                                                 region = brewer.pal(12, "Paired")), 
                       margin=F,main=file.list[3])
    
    # plotting dominant pft MPI
    p1 <- data.frame(mxDF$lon, mxDF$lat, mxDF$pft_factor)
    colnames(p1) <- c("lon", "lat", "PFT")
    
    coordinates(p1)=~lon+lat
    gridded(p1) = TRUE
    r <- raster(p1)
    
    plot4 <- levelplot(r, at=my.at1.list[[4]], colorkey=myColorkey1.list[[4]],
                       par.settings=custom.theme(symbol=brewer.pal(12, "Paired"),
                                                 fill=brewer.pal(12, "Paired"),
                                                 region = brewer.pal(12, "Paired")), 
                       margin=F,main=file.list[4])
    
    # plotting percent coverage  - ACCESS
    p2 <- data.frame(acDF$lon, acDF$lat, acDF$percent)
    colnames(p2) <- c("lon", "lat", "percent")
    
    coordinates(p2)=~lon+lat
    gridded(p2) = TRUE
    r <- raster(p2)
    
    plot5 <- levelplot(r, at=my.at2.list[[1]], colorkey=myColorkey2.list[[1]],
                       par.settings=RdBuTheme(), 
                       margin=F,main=file.list[1])
    
    # plotting percent coverage  - IPSL
    p2 <- data.frame(ipDF$lon, ipDF$lat, ipDF$percent)
    colnames(p2) <- c("lon", "lat", "percent")
    
    coordinates(p2)=~lon+lat
    gridded(p2) = TRUE
    r <- raster(p2)
    
    plot6 <- levelplot(r, at=my.at2.list[[2]], colorkey=myColorkey2.list[[2]],
                       par.settings=RdBuTheme(), 
                       margin=F,main=file.list[2])
    
    # plotting percent coverage  - MIROC
    p2 <- data.frame(mrDF$lon, mrDF$lat, mrDF$percent)
    colnames(p2) <- c("lon", "lat", "percent")
    
    coordinates(p2)=~lon+lat
    gridded(p2) = TRUE
    r <- raster(p2)
    
    plot7 <- levelplot(r, at=my.at2.list[[3]], colorkey=myColorkey2.list[[3]],
                       par.settings=RdBuTheme(), 
                       margin=F,main=file.list[3])
    
    # plotting percent coverage  - MPI
    p2 <- data.frame(mxDF$lon, mxDF$lat, mxDF$percent)
    colnames(p2) <- c("lon", "lat", "percent")
    
    coordinates(p2)=~lon+lat
    gridded(p2) = TRUE
    r <- raster(p2)
    
    plot8 <- levelplot(r, at=my.at2.list[[4]], colorkey=myColorkey2.list[[4]],
                       par.settings=RdBuTheme(), 
                       margin=F,main=file.list[4])
    
    grid.arrange(plot1, plot2, plot3, plot4,
                 plot5, plot6, plot7, plot8, 
                 ncol=4)
        
        
        
    dev.off()

}