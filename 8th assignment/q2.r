library("lattice")
library("MASS")
x1<-vector()
x2<-vector()
z1<-vector()
z2<-vector()
x<-vector()
y<-vector()
z5<-vector()
z6<-vector()
dstbnfunc<-function(x1,x2,a)
{
	x1=sort(x1)
	x2=sort(x2)
	t=1000
	for(i in 1:t)
	{
		z5[i]=i/t
		z6[i]=i/t
	}
	#windows.options(reset=TRUE)
	plot(x1,z5,"p",pch='.',xaxt="s",main=paste("Distribution function(x1)","\n",
	"mean=",paste(mean(x1)),"\n","var=",paste(var(x1),"\n","a=",paste(a)))
	,xlab="x1",ylab="probability")
	axis(side = 1, at = x)
	x11()
	plot(x2,z6,"p",pch='.',xaxt="s",main=paste("Distribution function(x2)","\n",
	"mean=",paste(mean(x2)),"\n","var=",paste(var(x2),"\n","a=",paste(a))),
	xlab="x2",ylab="probability")
	axis(side = 1, at = x)
}
main<-function(a)
{
	set.seed(2251)
	z1=rnorm(1000)
	z2=rnorm(1000)
	x1<-5+z1
	x2<-8+2*a*z1+2*sqrt(1-a^2)*z2
	plot(ecdf(x1),main=(paste("ecdf(x1)","\n","mean=",paste(mean(x1),"\n",
	"a=",paste(a)))))
	x11()
	plot(ecdf(x2),main=(paste("ecdf(x2)","\n","mean=",paste(mean(x1),"\n",
	"a=",paste(a)))))
	x11()
	dstbnfunc(x1,x2,a)
}
main(-0.25)
x11()
main(0)
x11()
main(0.25)