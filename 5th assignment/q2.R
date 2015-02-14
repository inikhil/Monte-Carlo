
calcul<-function()#function for calculation
{
	z<-vector()
	c<-0
	mean<-0
	for(i in 1:1000)
	{
		x<-runif(1)
		u<-runif(1)
		v<-(-1)*log(1-u)
		y<-exp((-1)*0.5*(v-1)^2)
		while(x>y)
		{
			x<-runif(1)
			u<-runif(1)
			v<-(-1)*log(1-u)
			y<-exp((-1)*0.5*(v-1)^2)
			c<-(c+1)
 		}
		z[i]<-v
		mean<-mean+z[i]
	}
	c<-1000/(c+1000)
	mean<-mean/1000
	hist(z,breaks=150,col="yellow",border="blue",main="Distribution for Z")
	print(c)
	print(mean)
	print(var(z))
}
#To run the program:
#source("q2.R")
#calcul()

