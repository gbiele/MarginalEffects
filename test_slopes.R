tmp = cplot(logreg_fit,"PaternalAgez")

my_data_0 = my_data_1 = my_data

my_data_0$PaternalAgez = my_data_0$PaternalAgez - setstep(my_data_0$PaternalAgez)
my_data_1$PaternalAgez = my_data_0$PaternalAgez + setstep(my_data_0$PaternalAgez)

estimates = predict(logreg_fit,type = "response")

slope = 
  (  predict(logreg_fit, newdata = my_data_0, type= "response") 
     - predict(logreg_fit, newdata = my_data_1, type = "response")) / 
  (my_data_0$PaternalAgez - my_data_1$PaternalAgez)


for (x in seq(min(my_data$PaternalAgez),max(my_data$PaternalAgez),length = 10)) {
  idx = my_data$PaternalAgez > (x-1) & my_data$PaternalAgez < (x+1)
  y = mean(estimates[idx])
  slp =mean(slope[idx])/2
  xx = c(x-1,
         x,
         x+1)
  yy = c(y - slp,
         y,
         y +slp)
  lines(xx,yy,col = "red")  
  points(x,y)
  
}

  