animated_plot_command <- function(sourceDir, destDir) {
    
    dir.create(destDir, showWarnings = FALSE)
    DatFiles <- list.files(path = sourceDir, pattern = "\\.pdf")
    
    for (i in 1:length(DatFiles)) 
    {
        print(DatFiles[i])
        
        # prepare outfile name
        oName <- gsub(".pdf", ".gif", DatFiles[i])
        outName <- paste0(destDir, "/", oName)
        
        inName <- file.path(sourceDir, DatFiles[i], fsep = .Platform$file.sep)
    
        # prepare command line text
        s.cmd <- paste0("convert -delay 80 ", inName, " ", outName)
        
        system(s.cmd)
    }
    
    # to not leave the directory with the single jpeg files
    # I remove them.
    # file.remove(list.files(pattern=".pdf"))
    
}