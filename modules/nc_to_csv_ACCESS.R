#### Convert nc file into csv file for CMIP5 vegetation coverage data
#### only for access model because it has only 3 dimensions
nc_to_csv_ACCESS <- function(Datfile, sourceDir, destDir) {
    
    # prepare file names
    inFile <- paste0(sourceDir, "/", Datfile, ".nc")
    dir.create(destDir, showWarnings = FALSE)
    
    # process file
    ncDF <- nc_open(inFile) 
    
    #print(ncDF)
    
    t <- ncvar_get(ncDF,varid = "time" )
    nt <- dim(t)
    
    tmp.array <- ncvar_get(ncDF)
    d <- dim(tmp.array)
    
    lon <- ncvar_get(ncDF, "lon")
    nlon <- dim(lon)
    #head(lon)
    
    lat <- ncvar_get(ncDF, "lat")
    nlat <- dim(lat)
    #head(lat)
    
    lon.s <- min(lon)
    lon.e <- max(lon)
    lat.s <- min(lat)
    lat.e <- max(lat)
    lon.i <- abs(lon[1]-lon[2])
    lat.i <- abs(lat[1]-lat[2])
    
    
    nc_close(ncDF)
    
    for (j in 1:d[3]) {
        
        # prepare outfile name and directory
        outFile <- paste0(destDir, "/", Datfile, "_", j, ".csv")
        
        sliceDF <- tmp.array[,,j]
        sliceDF <- t(sliceDF)
        
        iDF <- im(sliceDF, xcol = lon, 
                  yrow = lat) 
        
        janDF <- as.data.frame(iDF)
        
        #quilt.plot(janDF$x, janDF$y, janDF$value, nrow=128, ncol=62)
        
        janDF[,"sequence"] <- 2006
        janDF[,"CMIP_Site"] <- c(1:length(janDF$x))
        
        
        output<- janDF[,1:2]
        output[,"CMIP_Site"] <- janDF[,"CMIP_Site"]
        output[,"jan"] <- janDF[,"value"]

        output[,"sequence"] <- janDF[,"sequence"]
        
        
        setnames(output, c("x","y","CMIP_Site","jan","sequence"),
                 c("lon","lat","CMIP_Site","jan","year"))
        
        output <- output[c("CMIP_Site","lon","lat","year",
                           "jan")]
        

        # extract australia grids and year 2006-2100
        out <- subset(output, year >= 2006 & year <= 2100 & lon <= 160 & lon >= 90 & lat <= -8 & lat >= -65)

        # unlist output
        rm(output)
        
        write.csv(out, outFile, row.names = F)
    }
    
}