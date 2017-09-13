animated_plot_command <- function(sourceDir, destDir) {
    
    
    system("convert -delay 80 *.png example_1.gif")
    
    # to not leave the directory with the single jpeg files
    # I remove them.
    file.remove(list.files(pattern=".png"))
    
    
}