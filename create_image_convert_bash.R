
library(purrr)
tulemus <- sapply(list.dirs(), function(x){
  text1 <- paste0("cd ~/Desktop/msf_local/msf/random_selection_augmented/", substr(x, 3, nchar(x)))
  text2 <- (reduce(c("bash -c ", "'", 'for image in *.png; do convert "$image" "${image%.png}.jpg"; echo “image $image converted to ${image%.png}.jpg ”; done', "'" ),
                         paste0))
  
  return(c(text1, text2))
})

writeLines(tulemus, "bash_convert.txt")
