q<-vector()
s<-vector()
t<-vector()
u<-vector()
v<-vector()
w<-vector()
p<-vector()
z<-vector()
r<-vector()
generate<-function(a,m,x)#function used for generating
{
    p[1]=x
    for (i in 2:5001)
    {
        p[i]=((p[i-1]*a)%%m)
        q[i-1]=p[i-1]/m
        q[i-1]<-(1-q[i-1])
    }
    return(q)
}
expo<-function(z)#function for exponential distribution
{
    for(i in 1:5000)
    {
       r[i]=((-1)*(0.2)*log(z[i]))
    }
    return(r)
}
gamma<-function(s,t,u,v,w)#function for gamma distribution
{
    g<-vector()
    for(i in 1:5000)
    {
        g[i]=t[i]+s[i]+u[i]+v[i]+w[i]
    }
return(g)
}
mean<-function(g)#function for mean
{
    mean<-0
    for(i in 1:5000)
    {
        mean=mean+g[i]
    }
    mean=mean/5000
    print(mean)
}

main<-function()#function for calculation
{
    
    z=generate(71807,2147483647,4111)
    s=expo(z)
    z=generate(54807,2147483647,7113)
    t=expo(z)
    z=generate(91807,2147483647,7991)
    u=expo(z)
    z=generate(81807,2147483647,8111)
    v=expo(z)
    z=generate(83807,2147483647,9999)
    w=expo(z)
    g=gamma(s,t,u,v,w)
    mean(g)
    hist(g,breaks=50,col="green",border="blue",main="Gamma Distribution")
    j=which.max(g)
    print(g[j])
    print(min(g))
    return(g)
}
#To run the program:
#source("q2.R")
#main()