######Time calculation for Marsaglia-Bray method######
z1<-vector()
z2<-vector()
library('boot')
main<-function(n)
{
system.time({
	mean<-0
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
		mean=mean+z1[i]+z2[i]
	}
	t=2*n
	for(i in (n+1):t)
	{
		z1[i]=z2[i-n]
	}
	mean=mean/t
})
}
main(50)
main(250)
main(5000)
#100->0 0 .02
#500->.01 0 .02
#10000->.46 0 .46

 