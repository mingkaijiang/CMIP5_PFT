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
        
        # plotting
        pdf(outName)
        
        set.panel()
        par(oma=c(1,1,2,2),
            mar=c(5,4,4,5),
            mgp = c(3, 1, 0))  
        set.panel(2,2)
        
        for (j in year.list) {
            # subsetting df for each year
            p1 <- subset(dd, year == j)
            
            # obtain month column information
            month.col <- c(5:16)
            
            for (k in month.col) {
                
                # title
                tl <- paste0("Year ", j, "Month ", names[p1]$k)
                
                # plotting
                quilt.plot(p1$lon, p1$lat, p1[,k], xlim=c(110, 160), ylim=c(-50, -9),
                           add.legend=T, breaks=rg, col=rev(topo.colors(10)),
                           nx = 10, ny = 10, main = tl)
                
                # add world map
                world(add=T, col=adjustcolor("grey", 0.8))
            }   # k
        }   # j
        dev.off()
    }   # i
}