gen<-function(a,b,m,x0)#From this function I am generating each of xi's
{
	return ((a*(x0)+b)%%m)
}
calculseq<-function(n,a,b,m,x0)#from this function I am calculating ui's
{
      u <- vector()
      x<-vector()
	x[1]=gen(a,b,m,x0)
	u[1]= x[1] / m
	for(i in 2:n)
	{	
        x[i] = gen(a,b,m,x[i-1])
        u[i]=x[i] / m	
	 }
	#return(x)
	return (u)

}
d<-0
c<-0
plotting<-function(u)#from this function I am passing my points for graph
{
    seqx <- vector()
    seqy <- vector()

    for(i in 1:(length(u) - 1)) {
        seqx[i] = u[i]
        seqy[i] = u[i+1]
    }

    return(list(x=seqx, y=seqy))
}
#To execute the program follow the following steps:
#source("question3.R")
#u=calculseq(1000,1229,1,2048,1)
#plot(plotting(u),xlab="u(i-1)",ylab="u(i)")
  

