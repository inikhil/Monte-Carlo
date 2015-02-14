u<-vector()
x<-vector()
v<-vector()
geometric<-function(m)
{
	q=0.6
	set.seed(6857)
	u<-runif(m)
	x<-floor(log(u)/log(q))+1
	print(x)
	v<-(1-q)*(q^x)
	plot(x,v,"p",xlab="x",ylab="probability",xaxt="n",main=paste
	("Probability mass function","\n","q=",paste(q),"\n","n=",paste(m)))
	axis(side = 1, at = x)
	#par(new=TRUE,col="yellow")
	print(q)	
}	
geometric(50)
x11()
geometric(20000)