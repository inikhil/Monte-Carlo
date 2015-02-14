#####Calculation for mean=5,0 and variance=5 ######
z1<-vector()
z2<-vector()
z3<-vector()
z4<-vector()
library('boot')
normalisation<-function(mean,var,z1,n)
{
	z3=var*z1+mean
	hist(z3,breaks=100,border="black",col="green",xlab="z1&z2",
	main=paste("Normal Distribution","\n","mean=",paste(mean),"\n",
	"var=",paste(var),"\n","n=",paste(2*n)))
}
main<-function(n)
{
	for(i in 1:n)
	{
		u1=runif(1)
		u2=runif(1)
		u1=2*u1-1
		u2=2*u2-1
		x=u1*u1+u2*u2
		while(x>1)
		{
			u1=runif(1)
			u2=runif(1)
			u1=2*u1-1
			u2=2*u2-1
			x=u1*u1+u2*u2
		}
		y=sqrt(-2*log(x)/x)
		z1[i]=u1*y
		z2[i]=u2*y
	}
	t=2*n
	for(i in (n+1):t)
	{
		z1[i]=z2[i-n]
	}
	normalisation(0,5,z1,n)
	x11()
	normalisation(5,5,z1,n)
}
main(250)

