a<-vector()
b<-vector()
x<-vector()
y<-vector()
z<-vector()
u<-vector()
convert<-function(n){
	i=1
	while(n!=0){
		a[i]=n%%2
		n=floor(n/2)
		i=i+1
	}	
	return(a)
}
radical<-function(b){
	t=length(b)
	sum1=0
	for(i in 1:t){
		sum1=sum1+b[i]*((1/2)^i)
	}
	return(sum1)
}
lcg<-function(a1,b1,m1,seed,m){
	z[1]=seed
	u[1]=z[1]/m1
	for(i in 2:m){
		z[i]=(a1*z[i-1])%%m1
		u[i]=z[i]/m1
	}
	return(u)
}
generate<-function(x,m){
	for(i in 1:m-1){
		y[i]=x[i+1]
	}
	y[m]=0
	return(y)
}
main<-function(m){
	for(i in 1:m){
		b=convert(i)
		x[i]=radical(b)
	}
	y=generate(x,m)
	print(x)
	plot(x,y,cex=0.1,main=paste("Overlapping pairs of Van Der Corrupt Seq",
		"\n","n=",paste(m)))
	x11()
	hist(x,breaks=99,main=paste("Sample distribution of Van Der Corrupt Seq",
		"\n","n=",paste(m)))
	x11()
	u=lcg(16807,0,2^31-1,1631,m)
	hist(u,breaks=99,main=paste("Sample distribution of LCG","\n",
		"n=",paste(m)))
	y=generate(u,m)
	x11()
	plot(u,y,cex=0.1,main=paste("Overlapping pairs of LCG","\n",
	"n=",paste(m)))
}
main(1000)
x11()
main(100)
x11()
main(100000)
