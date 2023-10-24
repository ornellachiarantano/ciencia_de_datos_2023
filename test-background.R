# Uno por uno
for (i in 1:10){
  Sys.sleep(1)
  cat(i,"\n")
  
  
  tryCatch(
  
  if(i==7){
    stop("error")
  },
  error=function(e){
    message("Hubo un error en la iteracion ", i," sigo trabajando")
  })
  
}