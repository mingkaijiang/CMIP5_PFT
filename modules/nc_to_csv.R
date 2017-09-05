#### Convert nc file into csv file for CMIP5 vegetation coverage data
nc_to_csv <- function(Datfile, sourceDir, destDir) {
    
    # prepare file names
    inFile <- paste0(sourceDir, "/", Datfile, ".nc")

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
    
    for (i in 1:d[3]) {
        outFile <- paste0(destDir, "/", Datfile, "_", i, ".csv")
    }
    
    nc_close(ncDF)
    
    jan.list <- 13
    feb.list <- 14
    mar.list <- 15
    apr.list <- 16
    may.list <- 17
    jun.list <- 18
    jul.list <- 19
    aug.list <- 20
    sep.list <- 21
    oct.list <- 22
    nov.list <- 23
    dec.list <- 24
    
    for (i in 2:((nt/12)-1))
    {
        jan.list <- append(jan.list, (1+(i*12)))
        feb.list <- append(feb.list, (2+(i*12)))
        mar.list <- append(mar.list, (3+(i*12)))
        apr.list <- append(apr.list, (4+(i*12)))
        may.list <- append(may.list, (5+(i*12)))
        jun.list <- append(jun.list, (6+(i*12)))
        jul.list <- append(jul.list, (7+(i*12)))
        aug.list <- append(aug.list, (8+(i*12)))
        sep.list <- append(sep.list, (9+(i*12)))
        oct.list <- append(oct.list, (10+(i*12)))
        nov.list <- append(nov.list, (11+(i*12)))
        dec.list <- append(dec.list, (12+(i*12)))
    }
    
    for (j in 1:d[3]) {
        ##Jan list
        i <- 1
        
        sliceDF <- tmp.array[,,j,i]
        sliceDF <- t(sliceDF)
        
        iDF <- im(sliceDF, xcol = seq(0,357.1875, by=2.8125), 
                  yrow = seq(-87.963799,87.863799,by=2.767272)) 
        
        janDF <- as.data.frame(iDF)
        
        quilt.plot(janDF$x, janDF$y, janDF$value, nrow=128, ncol=62)
        
        janDF[,"sequence"] <- 1
        janDF[,"CMIP_Site"] <- c(1:length(janDF$x))
        
        for (i in jan.list)
        {
            sliceDF <- tmp.array[,,j,i]
            sliceDF <- t(sliceDF)
            
            iDF <- im(sliceDF, xcol = seq(0,357.1875, by=2.8125), 
                      yrow = seq(-87.963799,87.863799,by=2.767272)) 
            
            mid <- as.data.frame(iDF)
            
            mid[,"sequence"] <- i
            mid[,"CMIP_Site"] <- c(1:length(mid$x))
            
            janDF <- rbind(janDF,mid)
            
        }
        
        
        ##Feb list
        i <- 2
        
        sliceDF <- tmp.array[,,j,i]
        sliceDF <- t(sliceDF)
        
        iDF <- im(sliceDF, xcol = seq(0,357.1875, by=2.8125), 
                  yrow = seq(-87.963799,87.863799,by=2.767272)) 
        
        febDF <- as.data.frame(iDF)
        
        febDF[,"sequence"] <- 2
        febDF[,"CMIP_Site"] <- c(1:length(febDF$x))
        
        for (i in feb.list)
        {
            sliceDF <- tmp.array[,,j,i]
            sliceDF <- t(sliceDF)
            
            iDF <- im(sliceDF, xcol = seq(0,357.1875, by=2.8125), 
                      yrow = seq(-87.963799,87.863799,by=2.767272)) 
            
            mid <- as.data.frame(iDF)
            
            mid[,"sequence"] <- i
            mid[,"CMIP_Site"] <- c(1:length(mid$x))
            
            febDF <- rbind(febDF,mid)
        }
        
        ##Mar list
        i <- 3
        
        sliceDF <- tmp.array[,,j,i]
        sliceDF <- t(sliceDF)
        
        iDF <- im(sliceDF, xcol = seq(0,357.1875, by=2.8125), 
                  yrow = seq(-87.963799,87.863799,by=2.767272)) 
        
        marDF <- as.data.frame(iDF)
        
        marDF[,"sequence"] <- 3
        marDF[,"CMIP_Site"] <- c(1:length(marDF$x))
        
        for (i in mar.list)
        {
            sliceDF <- tmp.array[,,j,i]
            sliceDF <- t(sliceDF)
            
            iDF <- im(sliceDF, xcol = seq(0,357.1875, by=2.8125), 
                      yrow = seq(-87.963799,87.863799,by=2.767272)) 
            
            mid <- as.data.frame(iDF)
            
            mid[,"sequence"] <- i
            mid[,"CMIP_Site"] <- c(1:length(mid$x))
            
            marDF <- rbind(marDF,mid)
            
        }
        
        ##Apr list
        i <- 4
        
        sliceDF <- tmp.array[,,j,i]
        sliceDF <- t(sliceDF)
        
        iDF <- im(sliceDF, xcol = seq(0,357.1875, by=2.8125), 
                  yrow = seq(-87.963799,87.863799,by=2.767272)) 
        
        aprDF <- as.data.frame(iDF)
        
        aprDF[,"sequence"] <- i
        aprDF[,"CMIP_Site"] <- c(1:length(aprDF$x))
        
        for (i in apr.list)
        {
            sliceDF <- tmp.array[,,j,i]
            sliceDF <- t(sliceDF)
            
            iDF <- im(sliceDF, xcol = seq(0,357.1875, by=2.8125), 
                      yrow = seq(-87.963799,87.863799,by=2.767272)) 
            
            mid <- as.data.frame(iDF)
            
            mid[,"sequence"] <- i
            mid[,"CMIP_Site"] <- c(1:length(mid$x))
            
            aprDF <- rbind(aprDF,mid)
            
        }
        
        ##May list
        i <- 5
        
        sliceDF <- tmp.array[,,j,i]
        sliceDF <- t(sliceDF)
        
        iDF <- im(sliceDF, xcol = seq(0,357.1875, by=2.8125), 
                  yrow = seq(-87.963799,87.863799,by=2.767272)) 
        
        mayDF <- as.data.frame(iDF)
        
        mayDF[,"sequence"] <- i
        mayDF[,"CMIP_Site"] <- c(1:length(mayDF$x))
        
        for (i in may.list)
        {
            sliceDF <- tmp.array[,,j,i]
            sliceDF <- t(sliceDF)
            
            iDF <- im(sliceDF, xcol = seq(0,357.1875, by=2.8125), 
                      yrow = seq(-87.963799,87.863799,by=2.767272)) 
            
            mid <- as.data.frame(iDF)
            
            mid[,"sequence"] <- i
            mid[,"CMIP_Site"] <- c(1:length(mid$x))
            
            mayDF <- rbind(mayDF,mid)
            
        }
        
        ##Jun list
        i <- 6
        
        sliceDF <- tmp.array[,,j,i]
        sliceDF <- t(sliceDF)
        
        iDF <- im(sliceDF, xcol = seq(0,357.1875, by=2.8125), 
                  yrow = seq(-87.963799,87.863799,by=2.767272)) 
        
        junDF <- as.data.frame(iDF)
        
        junDF[,"sequence"] <- i
        junDF[,"CMIP_Site"] <- c(1:length(junDF$x))
        
        for (i in jun.list)
        {
            sliceDF <- tmp.array[,,j,i]
            sliceDF <- t(sliceDF)
            
            iDF <- im(sliceDF, xcol = seq(0,357.1875, by=2.8125), 
                      yrow = seq(-87.963799,87.863799,by=2.767272)) 
            
            mid <- as.data.frame(iDF)
            
            mid[,"sequence"] <- i
            mid[,"CMIP_Site"] <- c(1:length(mid$x))
            
            junDF <- rbind(junDF,mid)
            
        }
        
        ##Jul list
        i <- 7
        
        sliceDF <- tmp.array[,,j,i]
        sliceDF <- t(sliceDF)
        
        iDF <- im(sliceDF, xcol = seq(0,357.1875, by=2.8125), 
                  yrow = seq(-87.963799,87.863799,by=2.767272)) 
        
        julDF <- as.data.frame(iDF)
        
        julDF[,"sequence"] <- i
        julDF[,"CMIP_Site"] <- c(1:length(julDF$x))
        
        for (i in jul.list)
        {
            sliceDF <- tmp.array[,,j,i]
            sliceDF <- t(sliceDF)
            
            iDF <- im(sliceDF, xcol = seq(0,357.1875, by=2.8125), 
                      yrow = seq(-87.963799,87.863799,by=2.767272)) 
            
            mid <- as.data.frame(iDF)
            
            mid[,"sequence"] <- i
            mid[,"CMIP_Site"] <- c(1:length(mid$x))
            
            julDF <- rbind(julDF,mid)
            
        }
        
        ##Aug list
        i <- 8
        
        sliceDF <- tmp.array[,,j,i]
        sliceDF <- t(sliceDF)
        
        iDF <- im(sliceDF, xcol = seq(0,357.1875, by=2.8125), 
                  yrow = seq(-87.963799,87.863799,by=2.767272)) 
        
        augDF <- as.data.frame(iDF)
        
        augDF[,"sequence"] <- i
        augDF[,"CMIP_Site"] <- c(1:length(augDF$x))
        
        for (i in aug.list)
        {
            sliceDF <- tmp.array[,,j,i]
            sliceDF <- t(sliceDF)
            
            iDF <- im(sliceDF, xcol = seq(0,357.1875, by=2.8125), 
                      yrow = seq(-87.963799,87.863799,by=2.767272)) 
            
            mid <- as.data.frame(iDF)
            
            mid[,"sequence"] <- i
            mid[,"CMIP_Site"] <- c(1:length(mid$x))
            
            augDF <- rbind(augDF,mid)
            
        }
        
        ##Sep list
        i <- 9
        
        sliceDF <- tmp.array[,,j,i]
        sliceDF <- t(sliceDF)
        
        iDF <- im(sliceDF, xcol = seq(0,357.1875, by=2.8125), 
                  yrow = seq(-87.963799,87.863799,by=2.767272)) 
        
        sepDF <- as.data.frame(iDF)
        
        sepDF[,"sequence"] <- i
        sepDF[,"CMIP_Site"] <- c(1:length(sepDF$x))
        
        for (i in sep.list)
        {
            sliceDF <- tmp.array[,,j,i]
            sliceDF <- t(sliceDF)
            
            iDF <- im(sliceDF, xcol = seq(0,357.1875, by=2.8125), 
                      yrow = seq(-87.963799,87.863799,by=2.767272)) 
            
            mid <- as.data.frame(iDF)
            
            mid[,"sequence"] <- i
            mid[,"CMIP_Site"] <- c(1:length(mid$x))
            
            sepDF <- rbind(sepDF,mid)
            
        }
        
        ##Oct list
        i <- 10
        
        sliceDF <- tmp.array[,,j,i]
        sliceDF <- t(sliceDF)
        
        iDF <- im(sliceDF, xcol = seq(0,357.1875, by=2.8125), 
                  yrow = seq(-87.963799,87.863799,by=2.767272)) 
        
        octDF <- as.data.frame(iDF)
        
        octDF[,"sequence"] <- i
        octDF[,"CMIP_Site"] <- c(1:length(octDF$x))
        
        for (i in oct.list)
        {
            sliceDF <- tmp.array[,,j,i]
            sliceDF <- t(sliceDF)
            
            iDF <- im(sliceDF, xcol = seq(0,357.1875, by=2.8125), 
                      yrow = seq(-87.963799,87.863799,by=2.767272)) 
            
            mid <- as.data.frame(iDF)
            
            mid[,"sequence"] <- i
            mid[,"CMIP_Site"] <- c(1:length(mid$x))
            
            octDF <- rbind(octDF,mid)
            
        }
        
        
        ##Nov list
        i <- 11
        
        sliceDF <- tmp.array[,,j,i]
        sliceDF <- t(sliceDF)
        
        iDF <- im(sliceDF, xcol = seq(0,357.1875, by=2.8125), 
                  yrow = seq(-87.963799,87.863799,by=2.767272)) 
        
        novDF <- as.data.frame(iDF)
        
        novDF[,"sequence"] <- i
        novDF[,"CMIP_Site"] <- c(1:length(novDF$x))
        
        for (i in nov.list)
        {
            sliceDF <- tmp.array[,,j,i]
            sliceDF <- t(sliceDF)
            
            iDF <- im(sliceDF, xcol = seq(0,357.1875, by=2.8125), 
                      yrow = seq(-87.963799,87.863799,by=2.767272)) 
            
            mid <- as.data.frame(iDF)
            
            mid[,"sequence"] <- i
            mid[,"CMIP_Site"] <- c(1:length(mid$x))
            
            novDF <- rbind(novDF,mid)
            
        }
        
        ##Dec list
        i <- 12
        
        sliceDF <- tmp.array[,,j,i]
        sliceDF <- t(sliceDF)
        
        iDF <- im(sliceDF, xcol = seq(0,357.1875, by=2.8125), 
                  yrow = seq(-87.963799,87.863799,by=2.767272)) 
        
        decDF <- as.data.frame(iDF)
        
        decDF[,"sequence"] <- i
        decDF[,"CMIP_Site"] <- c(1:length(decDF$x))
        
        for (i in dec.list)
        {
            sliceDF <- tmp.array[,,j,i]
            sliceDF <- t(sliceDF)
            
            iDF <- im(sliceDF, xcol = seq(0,357.1875, by=2.8125), 
                      yrow = seq(-87.963799,87.863799,by=2.767272)) 
            
            mid <- as.data.frame(iDF)
            
            mid[,"sequence"] <- i
            mid[,"CMIP_Site"] <- c(1:length(mid$x))
            
            decDF <- rbind(decDF,mid)
            
        }
        
        output<- janDF[,1:2]
        output[,"CMIP_Site"] <- janDF[,"CMIP_Site"]
        output[,"jan"] <- janDF[,"value"]
        output[,"feb"] <- febDF[,"value"]
        output[,"mar"] <- marDF[,"value"]
        output[,"apr"] <- aprDF[,"value"]
        output[,"may"] <- mayDF[,"value"]
        output[,"jun"] <- junDF[,"value"]
        output[,"jul"] <- julDF[,"value"]
        output[,"aug"] <- augDF[,"value"]
        output[,"sep"] <- sepDF[,"value"]
        output[,"oct"] <- octDF[,"value"]
        output[,"nov"] <- novDF[,"value"]
        output[,"dec"] <- decDF[,"value"]
        
        output[,"sequence"] <- janDF[,"sequence"]
        
        jan.list <- append(1,jan.list)
        
        for (i in 1:length(jan.list))
        {
            output[output$sequence == jan.list[i], "sequence"] <- (i+2005)
        }
        
        setnames(output, c("x","y","CMIP_Site","jan","feb","mar","apr","may","jun",
                           "jul","aug","sep","oct","nov","dec","sequence"),
                 c("lon","lat","CMIP_Site","jan","feb","mar","apr","may","jun",
                   "jul","aug","sep","oct","nov","dec","year"))
        
        output <- output[c("CMIP_Site","lon","lat","year",
                           "jan","feb","mar","apr","may","jun",
                           "jul","aug","sep","oct","nov","dec")]
        
        #output <- data.table(output)
        
        # extract australia grids
        out <- subset(output, lon <= 160 & lon >= 90 & lat <= -8 & lat >= -65)
        #quilt.plot(out$lon, out$lat, out$jan, nrow = 14, ncol=10)
        #world(add=T, col=adjustcolor("grey", 0.8))
        
        write.csv(out, outFile[j], row.names = F)
    }
    
}