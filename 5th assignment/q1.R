z<-vector()
calcul<-function()#function for calculation
{
	c<-0
	mean<-0
	for(i in 1:1000)
	{
		x=runif(1)
		u=runif(1)
		if(u<=0.5)
		{
			v=log(2*u)
			y=exp((-1)*0.5*(v+1)*(v+1))
		}
		if(u>0.5)
		{
			v=(-1)*log(2-2*u)
			y=exp((-1)*0.5*(v-1)*(v-1))
		}		
		
		while(x>y)
		{
			x=runif(1)
			u=runif(1)
			if(u<=0.5)
			{
				v=log(2*u)
				y=exp((-1)*0.5*(v+1)*(v+1))
			}
			if(u>0.5)
			{
				v=(-1)*log(2-2*u)
				y=exp((-1)*0.5*(v-1)*(v-1))
			}		
			c<-(c+1)
		}
		z[i]=v
		mean<-mean+z[i]
	}
	mean<-mean/1000
	c<-1000/(1000+c)
	hist(z,breaks=200,col="green",border="blue",main="Distribution for Z")
	print(c)
	print(mean)
	print(var(z))
	return(z)
}
#To run the program:
#source("q1.R")
#calcul()
