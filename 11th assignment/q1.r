w<-matrix(,nrow=5000,ncol=10)
z<-vector()
main<-function(mean1,var1,x1,x2,x)
{
	exp_w5=0
	for(j in 1:x)
	{
		w[j,1]=1
	}
	for(j in 1:x)
	{
		i=1
		while(i!=5000)
		{
			w[j,i+1]=w[j,i]*exp(((mean1-(var1*var1)/2)*.001)+
				(sqrt(.001)*rnorm(1)*var1))
			#print(w[j,i+1])
			i=i+1
		}
		print(w[j,])
		plot(w[j,],type="l",col=j,ylim=c(x1,x2),xlab="Number of generated 
		values",ylab="values",main=paste("Geometric brownian motion","\n",
		"mean=",paste(mean1),"variance=",paste(var1)))
		par(new=TRUE)
	}
	x11()
	for(j in 1:x)
	{
		exp_w5=exp_w5+w[j,5000]
		z[j]=log(w[j,5000])
	}
	hist(z,breaks=49,main="Histogram for log(s[5])")
	cat("The expected value of w[5] is ",exp_w5/x,"\n")
	cat("The variance of w[5] is ",var(w[,5000]),"\n")
	par(new=FALSE)
}
main(0.1,0.3,0,6,10)
x11()
main(-0.1,0.3,-1.5,4,10)
x11()
main(0.1,0.5,0,6,10)
x11()
main(-0.1,0.5,-1.5,4,10)
x11()
#for large no of paths change the row size of matrix..and apply
main(0.1,0.3,0,6,5000)

