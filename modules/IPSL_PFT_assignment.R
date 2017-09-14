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
    DatFiles <- list.files(path = sourceDir, pattern = "\\.gif")
    

    inName1 <- file.path(sourceDir, DatFiles[1], fsep = .Platform$file.sep)
    inName2 <- file.path(sourceDir, DatFiles[2], fsep = .Platform$file.sep)
    inName3 <- file.path(sourceDir, DatFiles[3], fsep = .Platform$file.sep)
    inName4 <- file.path(sourceDir, DatFiles[4], fsep = .Platform$file.sep)
    inName5 <- file.path(sourceDir, DatFiles[5], fsep = .Platform$file.sep)
    inName6 <- file.path(sourceDir, DatFiles[6], fsep = .Platform$file.sep)
    inName7 <- file.path(sourceDir, DatFiles[7], fsep = .Platform$file.sep)
    inName8 <- file.path(sourceDir, DatFiles[8], fsep = .Platform$file.sep)
    inName9 <- file.path(sourceDir, DatFiles[9], fsep = .Platform$file.sep)
    inName10 <- file.path(sourceDir, DatFiles[10], fsep = .Platform$file.sep)
    inName11 <- file.path(sourceDir, DatFiles[11], fsep = .Platform$file.sep)
    inName12 <- file.path(sourceDir, DatFiles[12], fsep = .Platform$file.sep)
    inName13 <- file.path(sourceDir, DatFiles[13], fsep = .Platform$file.sep)
    
    # prepare outfile name
    oName1 <- gsub("1_1.gif", "1_BareSoil.gif", DatFiles[1])
    oName2 <- gsub("10_10.gif", "10_C3Grass.gif", DatFiles[2])
    oName3 <- gsub("11_11.gif", "11_C4Grass.gif", DatFiles[3])
    oName4 <- gsub("12_12.gif", "12_C3Agriculture.gif", DatFiles[4])
    oName5 <- gsub("13_13.gif", "13_C4Agriculture.gif", DatFiles[5])
    oName6 <- gsub("2_2.gif", "2_TropicalBroadleafEvergreenTree.gif", DatFiles[6])
    oName7 <- gsub("3_3.gif", "3_TropicalBrodleafRaingreenTree.gif", DatFiles[7])
    oName8 <- gsub("4_4.gif", "4_TemperateNeedleleafEvergreenTree.gif", DatFiles[8])
    oName9 <- gsub("5_5.gif", "5_TemperateBroadleafEvergreenTree.gif", DatFiles[9])
    oName10 <- gsub("6_6.gif", "6_TemperateBroadleafSummergreenTree.gif", DatFiles[10])
    oName11 <- gsub("7_7.gif", "7_BorealNeedleleafEvergreenTree.gif", DatFiles[11])
    oName12 <- gsub("8_8.gif", "8_BorealBroadleafSummergreenTree.gif", DatFiles[12])
    oName13 <- gsub("9_9.gif", "9_BorealNeedleleafSummergreenTree.gif", DatFiles[13])
        
        
    outName1 <- paste0(sourceDir, "/", oName1)
    outName2 <- paste0(sourceDir, "/", oName2)
    outName3 <- paste0(sourceDir, "/", oName3)
    outName4 <- paste0(sourceDir, "/", oName4)
    outName5 <- paste0(sourceDir, "/", oName5)
    outName6 <- paste0(sourceDir, "/", oName6)
    outName7 <- paste0(sourceDir, "/", oName7)
    outName8 <- paste0(sourceDir, "/", oName8)
    outName9 <- paste0(sourceDir, "/", oName9)
    outName10 <- paste0(sourceDir, "/", oName10)
    outName11 <- paste0(sourceDir, "/", oName11)
    outName12 <- paste0(sourceDir, "/", oName12)
    outName13 <- paste0(sourceDir, "/", oName13)
    
    # prepare command line text
    s.cmd1 <- paste0("mv ", inName1, " ", outName1)
    s.cmd2 <- paste0("mv ", inName2, " ", outName2)
    s.cmd3 <- paste0("mv ", inName3, " ", outName3)
    s.cmd4 <- paste0("mv ", inName4, " ", outName4)
    s.cmd5 <- paste0("mv ", inName5, " ", outName5)
    s.cmd6 <- paste0("mv ", inName6, " ", outName6)
    s.cmd7 <- paste0("mv ", inName7, " ", outName7)
    s.cmd8 <- paste0("mv ", inName8, " ", outName8)
    s.cmd9 <- paste0("mv ", inName9, " ", outName9)
    s.cmd10 <- paste0("mv ", inName10, " ", outName10)
    s.cmd11 <- paste0("mv ", inName11, " ", outName11)
    s.cmd12 <- paste0("mv ", inName12, " ", outName12)
    s.cmd13 <- paste0("mv ", inName13, " ", outName13)

    system(s.cmd1)
    system(s.cmd2)
    system(s.cmd3)
    system(s.cmd4)
    system(s.cmd5)
    system(s.cmd6)
    system(s.cmd7)
    system(s.cmd8)
    system(s.cmd9)
    system(s.cmd10)
    system(s.cmd11)
    system(s.cmd12)
    system(s.cmd13)
    

}