a<-vector()
b<-vector()
x<-vector()
y<-vector()
c<-vector()
convert<-function(n,base){
	i=1
	while(n!=0){
		a[i]=n%%base
		n=floor(n/base)
		i=i+1
	}	
	return(a)
}
radical<-function(b,base){
	t=length(b)
	sum1=0
	for(i in 1:t){
		sum1=sum1+b[i]*((1/base)^i)
	}
	return(sum1)
}
main<-function(m){
	for(i in 1:m){
		b=convert(i,2)
		x[i]=radical(b,2)
		c=convert(i,3)
		y[i]=radical(c,3)
	}
	print(x)
	print(y)
	plot(x,y,cex=0.1,xlab="x2[i]",ylab="x3[i]",main=paste("Halton sequence",
		"\n","n=",paste(m)))
}
main(100)
x11()
main(100000)
