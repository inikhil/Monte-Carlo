x<-vector()
v<-vector()
u<-vector
poisson<-function(n)
{
	set.seed(343219)
	u=runif(n)
	for(j in 1:n)
	{
		i<-0
		p=exp(-2)
		f=p
		m=0
		while(m!=1)
		{
			if(u[j]<f)
			{
				x[j]=i
				m=1
			}
			else
			{
				p=2*p/(i+1)
				f=f+p
				i=i+1
			}
		}		
	}
	print(x)
	print(var(x))
	v<-exp(-2)*(2^x)/factorial(x)
	print(v)
	plot(x,v,"p",xlab="x",ylab="probability",xaxt="n",main=paste
	("Probability mass function","\n","mean=2","\n","n=",paste(n)))
	axis(side = 1, at = x)
	x11()
	par(col="yellow")
	plot(ecdf(x),xlab="x",ylab="ecdf",main=paste("Cummulative
	distribution function","\n","mean=2","\n","n=",paste(n)))
	axis(side = 1, at = x)

}
poisson(50)
#x11()
#poisson(10000)