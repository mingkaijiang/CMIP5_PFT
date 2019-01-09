### Australia climate space


# library
require(fields)
require(ggplot2)

# read in file
myDF <- read.csv("supporting_data/biome_temp_prec_full_1991_2012.csv")

# subsetting Australia
subDF <- subset(myDF, lon>=110 & lon <= 155 & lat >= -50 & lat <= -11)

# plot testing
quilt.plot(subDF$lon, subDF$lat, subDF$tempP, nx=30, ny=30)
map(add=T)

# get TERN supersite locations
ozDF <- read.csv("supporting_data/Ozflux_site_coordinates.csv")

# convert grids
ozDF <- oz_to_cru(ozDF)

# assign MAT and MAP
for (i in unique(ozDF$LON_CRU)) {
    for (j in unique(ozDF$LAT_CRU)) {
        ozDF[ozDF$LON_CRU==i & ozDF$LAT_CRU == j, "MAT"] <- subDF[subDF$lon==i & subDF$lat==j, "temp_annual_mean"]
        ozDF[ozDF$LON_CRU==i & ozDF$LAT_CRU == j, "MAP"] <- subDF[subDF$lon==i & subDF$lat==j, "prec_annual_sum"]
    }
}


# plot temp vs. prec for Australia
p <- ggplot(subDF,aes(temp_annual_mean, prec_annual_sum)) +
    geom_hex(bins = 25)+
    geom_point(data=ozDF, aes(MAT, MAP), size=3, shape=24, fill="blue")+
    labs(x=expression(paste("MAT (", ~degree~C, ")")), y="MAP (mm)")+
    theme_linedraw() +
    scale_fill_distiller(palette=7, direction=1) +
    #scale_x_continuous(expand = c(0, 0)) +
    #scale_y_continuous(expand = c(0, 0)) +
    theme(panel.grid.minor=element_blank(),
          axis.title.x = element_text(size=14), 
          axis.text.x = element_text(size=12),
          axis.text.y=element_text(size=12),
          axis.title.y=element_text(size=14),
          legend.text=element_text(size=12),
          legend.title=element_text(size=14),
          panel.grid.major=element_blank(),
          legend.position="right")

pdf("output/Australia_climate_space_and_ozflux_sites.pdf", width=5,height=4)
plot(p)
dev.off()
