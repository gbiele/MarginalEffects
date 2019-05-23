tmp = cplot(logreg_fit,"PaternalAgez")



  my_data_0 = my_data_1 = my_data
  
  my_data_0$PaternalAgez = my_data_0$PaternalAgez - setstep(my_data_0$PaternalAgez)
  my_data_1$PaternalAgez = my_data_0$PaternalAgez + setstep(my_data_0$PaternalAgez)
  
  slope = 
    (  predict(logreg_fit, newdata = my_data_0, type= "response") 
     - predict(logreg_fit, newdata = my_data_1, type = "response")) / 
    (my_data_0$PaternalAgez - my_data_1$PaternalAgez)
  
  
  xx = c(x-1,
         x,
         x+1)
  yy = c(y - slp/2,
         y,
         y +slp/2)
  lines(xx,yy,col = "red")  
  points(x,y)
