gen<-function(a,b,m,x0)#From this function I am returning xi's
{
	return ((a*(x0)+b)%%m)
}
calculseq<-function(n,a,b,m,x0)#From this function I am returning ui's
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
frq<-function(n,u)#This function is used for graph generation and frequency  
{
    j<-vector()
    for(c in 1:20)
    {
        j[c]=0
    }

    for(c in 1:20)
    {
        for(t in 1:n)
        {
            if((0+d)<u[t])
            {
               if(u[t]<(.05+d))
               {
                    j[c]=(j[c]+1)
               }
            }
        }
        d<-d+0.05
    }
    hist(u, breaks=19, col="black", border="blue")
    return (j)
}
#To use this R file in console write the following commands:
#1.source("question2.R")
#2.u=calculseq(n,a,b,m,x0)--insert values of n,a,b,m,x0 as required
#3.frq(n,u)
