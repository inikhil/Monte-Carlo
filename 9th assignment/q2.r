u<-vector()
v<-vector()
y<-vector()
y1<-vector()
main<-function(m)
{
	set.seed(104729)
	u=runif(m)
	v=1-u
	y=(exp(sqrt(u))+exp(sqrt(v)))/2
	y1=exp(sqrt(u))
	thta=mean(y)
	quant=qnorm(0.975)
	lowerci=thta-(sqrt(var(y))*quant)/(sqrt(m))
	upperci=thta+(sqrt(var(y))*quant)/(sqrt(m))
	cat("The lower confidence interval for" ,m ," is : ",lowerci,"\n")
	cat("The higher confidence interval for" ,m ," is : ",upperci,"\n")
	vredtn=100*(var(y)-var(y1))/var(y1)
	cat("The reduction in variance for ",m, "is : ",vredtn,"%","\n")
	
}
main(100)
main(1000)
main(10000)
main(10^5)