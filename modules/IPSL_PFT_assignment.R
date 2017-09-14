IPSL_PFT_assignment <- function(sourceDir) {
    ## This function assign PFT names onto all Orchidee model outputs
    
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
    
    l <- c(1:13) 
    pftDF <- data.frame(l, pft.list)
    names(pftDF) <- c("ID", "Type")

    # assign onto files
    
    
        
}