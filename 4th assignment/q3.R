z<-vector()
generate<-function(a,m,x0)#funcyion for generating
{
    p=((x0*a)%%m)
    q=p/m
    
    return(q)
}
calcul<-function(a,m,x0,a1,m1,x1)#function for calculation
{
	for(i in 1:5000)
	{
		x=generate(a,m,x0)
		u=generate(a1,m1,x1)
		y=256/27*x*(1-x)^3
		while(u>y)
		{
			x=generate(a,m,m*x)
			u=generate(a1,m1,m1*u)
			y=256/27*x*(1-x)^3
 		}
		x0=m*x
		x1=m1*u
		z[i]=x
	}
	hist(z,breaks=40,col="green",border="blue",main="Distribution for Z")
	return(z)
}
#To run the program:
#source("q3.R")
#calcul(a,m,x0,a1,m1,x1)#input values of a,a1,m,m1,x,x1
#I used calcul(11085,2147483648,1111,5085,2147483648,1045)


