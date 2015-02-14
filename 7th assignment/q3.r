u<-vector()
x1<-vector()
x2<-vector()
mixed<-function(n)
{
	set.seed(2011)
	u=runif(n)
	j<-1
	k<-1
	mean<-0
	for(i in 1:n)
	{
		if(u[i]<0.4)
		{
			x1[j]=sqrt((-1)*log(1-u[i]))
			mean<-mean+x1[j]
			j<-j+1
		}
		else
		{
			x2[k]=((-1)*log(1-u[i]))^(2/3)
			mean<-mean+x2[k]
			k<-k+1
		}
	}
	for(i in j:n)
	{
		x1[i]=x2[i+1-j]
	}
	mean<-mean/n
	print(x1)
	print(mean)
	print(var(x1))
	hist(x1,breaks=20,col="green",border="black",
	main=paste("histogram of mixed distribution","\n","n=",paste(n)))
}
mixed(50)
