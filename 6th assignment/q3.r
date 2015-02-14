#######Time calculation for Box-Muller Method##############

z1<-vector()
z2<-vector()
u1<-vector()
u2<-vector()
R<-vector()
V<-vector()

main<-function(n)
{system.time({
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
})
}

#100->0 0 0
#1000->.01(user) .00(system) .02(elapsed)
#10000->2.18  0  2.19

