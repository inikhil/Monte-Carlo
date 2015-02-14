u<-vector()
y<-vector()
gen<-function(a,b,m,x0)#From this function I am returning xi's
{
	return ((a*(x0)+b)%%m)
}
calculseq<-function()#From this function I am returning ui's
{
	n<-5000
	a<-16807
	b<-0
	m<-2147483648
	x0<-7437
	mean<-5
      x<-vector()
	y<-vector()
	x[1]=gen(a,b,m,x0)
	u[1]= x[1] / m
	for(i in 2:n)
	{	
        x[i] = gen(a,b,m,x[i-1])
        u[i]=x[i] / m
      }
	#return(x)
	return(u)
}
mean<-function(y)#function for mean
{
    mean=0
    for(i in 1:5000)
    {
        mean=mean+y[i]
    }
    mean=mean/5000
    print(mean)
}

expo<-function(mi)#function for exponential distribution
{
	u=calculseq()
	for(i in 1:5000)
	{
		y[i]=mi*log(1-u[i])*(-1)
	}
	mean(y)
	hist(y,breaks=30,col="green",border="blue",main="Exponential distribution")
	print(min(y))#calculating minimum
	j=(which.max(y))#calculating maximum
	print(y[j])
	return(y)
}
#To run the program:
#source("q1.R")
#expo(5)