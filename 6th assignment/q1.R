#################Box-Muller Method#################
z1<-vector()
z2<-vector()
u1<-vector()
u2<-vector()
R<-vector()
V<-vector()

main<-function(n)
{
	set.seed(7919)
	u1=runif(n)
	set.seed(2003)
	u2=runif(n)
	mean<-0
	for(i in 1:n)
	{
		R[i]=-2*log(u1[i])
		V[i]=2*pi*u2[i]
		z1[i]=sqrt(R[i])*cos(V[i])
		z2[i]=sqrt(R[i])*sin(V[i])
		mean=mean+z1[i]+z2[i]
	}
	t=2*n
	for(i in (n+1):t )
	{
		z1[i]=z2[i-n]
	}
	mean<-mean/t
	print(var(z1))
	print(mean)
	hist(z1,breaks=100,border="black",col="green",xlab="z1&z2",
	main=paste("Normal Distribution","\n","mean=",paste(mean),"\n",
	"var=",paste(var(z1)),"\n","n=",paste(2*n)))
}
main(50)
x11()
main(250)
x11()
main(5000)
