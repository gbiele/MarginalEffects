tmp = cplot(logreg_fit,"PaternalAgez",
            data = my_data[my_data$PaternalAgez < 3.1 &
                             my_data$PaternalAgez > -3,])
for (k in seq(2,22,length = 8)) {
  x = tmp$xvals[k]
  y = tmp$yvals[k]
  
  delta = .01
  
  my_data_a = my_data_b = my_data
  
  my_data_a$PaternalAgez = x-delta
  my_data_b$PaternalAgez = x+delta
  
  slope = 
    mean(predict(logreg_fit, newdata = my_data_b) 
         - predict(logreg_fit, newdata = my_data_a))
  
  
  xx = c(min(tmp$xvals),
         x,
         max(tmp$xvals))
  yy = c(y - slope*diff(xx[1:2]),
         y,
         y + slope*diff(xx[2:3]))
  lines(xx,yy,col = "red")  
}
