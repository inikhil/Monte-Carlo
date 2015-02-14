######Code for plotting Theoretical and Empirical Distribution#####
z1<-vector()
z2<-vector()
z3<-vector()
z4<-vector()
z5<-vector()
library('boot')
normalisation<-function(mean,var,z1,n)
{
	z3=var*z1+mean
	z4=sort(z3)
	t=2*n
	for(i in 1:t)
	{
		z5[i]=i/t
	}
	plot(z4,z5,"p",xaxt="n",main=paste("Distribution function","\n",
	"mean=",paste(mean),"\n","var=",paste(var)),xlab="z4",ylab="probability")
	axis(side = 1, at = x)
	par(new=TRUE,col="yellow")
	plot(ecdf(z4),main="",xlab="",ylab="")
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

