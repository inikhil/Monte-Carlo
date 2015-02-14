######Calculation of probability in Marsaglia-Bray method#####
z1<-vector()
z2<-vector()
library('boot')
main<-function(n)
{
	c<-0
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
			c<-(c+1)
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
	c<-(c+n*2)
	probability=2*n/c
	print(probability)
}
main(50)
main(250)
main(5000)
#n=100->.8695652
#n=500->.8726003
#n=5000->.8776549

