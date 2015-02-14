
calcul<-function()#function for calculation
{
	z<-vector()
	d<-c(0.05,0.25,0.45,0.15,0.10)
	c<-0
	mean<-0
	j<-1
	k<-1
	for(i in 1:500)
	{
		x<-runif(1)
		u<-runif(1)
		v<-(floor(u*5)+1)
		y<-d[k]/4.5
		k<-(k+1)
		if(x<y)
		{
			z[j]<-v
			mean<-mean+z[j]
			j<-(j+1)
			if(j==11)
			{
				break
			}
		}
		if(k==6)
		{
			k<-1
		}

		
	}	
	mean<-(mean/10)
	print(mean)
	print(var(z))
	return(z)
}
#To run the program:
#source("q3b.R")
#calcul()

