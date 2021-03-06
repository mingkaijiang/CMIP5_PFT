####################################################################################
# Plot Australia vegetation maps from CMIP5 datasets - discret years
Aus_Vegetation_Plot_Discret <- function(sourceDir, destDir) {
    
    dir.create(destDir, showWarnings = FALSE)
    DatFiles <- list.files(path = sourceDir, pattern = "\\.csv")

    for (i in 1:length(DatFiles)) 
    {
        print(DatFiles[i])
        inName <- file.path(sourceDir, DatFiles[i], fsep = .Platform$file.sep)
        
        dd <- read.csv(inName)
        
        # plot year 2006-01, 2036-01, 2066-01, 2096-01 for each pft
        p1 <- subset(dd, year == 2006)
        p2 <- subset(dd, year == 2036)
        p3 <- subset(dd, year == 2066)
        p4 <- subset(dd, year == 2096)

        oName <- gsub(".csv", ".pdf", DatFiles[i])
        outName <- paste0(destDir, "/", oName)
        
        # color range
        rg <- seq(0, 100, by=10)
        
        # plotting
        pdf(outName)
        
        set.panel()
        par(oma=c(1,1,2,2),
            mar=c(5,4,4,5),
            mgp = c(3, 1, 0))  
        set.panel(2,2)
        
        # p1
        with(p1, quilt.plot(lon, lat, jan, xlim=c(110, 160), ylim=c(-50, -9),
                            add.legend=T, breaks=rg, col=rev(topo.colors(10)),
                            nx = 10, ny = 10, main = "Year 2006 01"))
        world(add=T, col=adjustcolor("grey", 0.8))

        
        # p2
        with(p2, quilt.plot(lon, lat, jan, xlim=c(110, 160), ylim=c(-50, -9),
                            add.legend=T, breaks=rg, col=rev(topo.colors(10)),
                            nx = 10, ny = 10, main = "Year 2036 01"))
        world(add=T, col=adjustcolor("grey", 0.8))
        
        # p3
        with(p3, quilt.plot(lon, lat, jan, xlim=c(110, 160), ylim=c(-50, -9),
                            add.legend=T, breaks=rg, col=rev(topo.colors(10)),
                            nx = 10, ny = 10, main = "Year 2066 01"))
        world(add=T, col=adjustcolor("grey", 0.8))
        
        # p4
        with(p4, quilt.plot(lon, lat, jan, xlim=c(110, 160), ylim=c(-50, -9),
                            add.legend=T, breaks=rg, col=rev(topo.colors(10)),
                            nx = 10, ny = 10, main = "Year 2096 01"))
        world(add=T, col=adjustcolor("grey", 0.8))
        
        dev.off()
    }
    
}

####################################################################################
# Plot Australia vegetation maps from CMIP5 datasets - continuous time series
Aus_Vegetation_Plot_Continuous <- function(sourceDir, destDir) {
    
    dir.create(destDir, showWarnings = FALSE)
    DatFiles <- list.files(path = sourceDir, pattern = "\\.csv")
    
    for (i in 1:length(DatFiles)) 
    {
        print(DatFiles[i])
        inName <- file.path(sourceDir, DatFiles[i], fsep = .Platform$file.sep)
        
        dd <- read.csv(inName)
        
        oName <- gsub(".csv", ".pdf", DatFiles[i])
        outName <- paste0(destDir, "/", oName)
        
        # plot all year and month for each pft
        year.list <- unique(dd$year)
        
        # color range
        rg <- seq(0, 100, by=10)
        col.list <- rev(topo.colors(10))
        
        # plotting
        pdf(outName, width = 18, height = 6)
        
        set.panel()
        par(oma=c(1,1,2,2),
            mar=c(5,4,4,5),
            mgp = c(3, 1, 0))  
        set.panel(2,6)
        
        for (j in year.list) {
            # subsetting df for each year
            p1 <- subset(dd, year == j)
            
            # obtain month column information
            month.col <- c(5:16)
            
            for (k in month.col) {
                
                # title
                tl <- paste0("Year ", j, " Month ", names(dd)[k])
                
                # plotting
                quilt.plot(p1$lon, p1$lat, p1[,k], xlim=c(110, 160), ylim=c(-50, -9),
                           add.legend=T, breaks=rg, col=col.list,
                           nx = 10, ny = 10, main = tl)
                
                # add world map
                world(add=T, col=adjustcolor("grey", 0.8))
            }   # k
        }   # j
        dev.off()
    }   # i
}



####################################################################################
# Plot Australia vegetation maps from CMIP5 datasets - only annual time series
Aus_Vegetation_Plot_Continuous_Annual <- function(sourceDir, destDir) {
    
    dir.create(destDir, showWarnings = FALSE)
    DatFiles <- list.files(path = sourceDir, pattern = "\\.csv")
    
    for (i in 1:length(DatFiles)) 
    {
        print(DatFiles[i])
        inName <- file.path(sourceDir, DatFiles[i], fsep = .Platform$file.sep)
        
        dd <- read.csv(inName)
        
        oName <- gsub(".csv", ".pdf", DatFiles[i])
        outName <- paste0(destDir, "/", oName)
        outName <- gsub(" ", "", outName, fixed = TRUE)
        
        # plot all year avg for each pft
        year.list <- unique(dd$year)
        
        # prepare monthly means
        if (dim(dd)[2] <= 5) {
            subDF <- dd[, 5]
            
            yr.data <- subDF
            dd$yr_avg <- yr.data
        } else {
            subDF <- dd[,5:16]
            yr.data <- rowMeans(subDF)
            dd$yr_avg <- yr.data
        }

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
    }   # i
}