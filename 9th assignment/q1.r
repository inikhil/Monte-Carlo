u<-vector()
y<-vector()
main<-function(m)
{
	set.seed(104729)
	u=runif(m)
	y=exp(sqrt(u))
	thta=mean(y)
	quant=qnorm(0.975)
	lowerci=thta-(sqrt(var(y))*quant)/(sqrt(m))
	upperci=thta+(sqrt(var(y))*quant)/(sqrt(m))
	cat("The lower confidence interval for" ,m ," is : ",lowerci,"\n")
	cat("The higher confidence interval for" ,m ," is : ",upperci,"\n")
}
main(100)
main(1000)
main(10000)
main(100000)