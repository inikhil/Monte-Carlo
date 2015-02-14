library("lattice")
library("MASS")
x1<-vector()
x2<-vector()
z1<-vector()
z2<-vector()
y<-vector()
main<-function(a)
{
	set.seed(16673)
	z1=rnorm(1000)
	z2=rnorm(1000)
	x2<-8+2*z1
	x1<-5+(a/2)*(x2-8)+sqrt(1-a^2)*z2		
	for(i in 1:1000)
	{
		cat(x1[i],x2[i],"\n")
	}
	cat("the mean of x1 is :",mean(x1),"\n")
	cat("the mean of x2 is :",mean(x2),"\n")
	cat("the var of x1 is :",var(x1),"\n")
	cat("the var of x2 is :",var(x2),"\n")
	cat("the covar  is :",cov(x1,x2),"\n")
	cat("the correlation  is :",cor(x1,x2),"\n")
	y<-kde2d(x1,x2)
	contour(y,main=paste("Contour","\n","a=",paste(a)))
}
main(-0.25)
x11()
main(0)
x11()
main(0.25)