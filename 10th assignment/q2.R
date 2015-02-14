w<-vector()
w1<-vector()
main<-function()
{
	i=1
	exp_w2=0
	exp_w5=0
	for(j in 0:9)
	{
		w[1+5000*j]=5
		k=1
		while(i!=5000+5000*j)
		{
			w[i+1]=w[i]+.00006+sqrt(.001)*rnorm(1)*0.3
			i=i+1
		}
		m=i-4999
		while(m!=5000+5000*j)
		{
			w1[k]=w[m]
			k=k+1;
			m=m+1;
		}
		i=i+1
		plot(w1,type="l",col=j,ylim=c(3,7),xlab="Number of generated 
		values",ylab="values")
		par(new=TRUE)
	}
	for(j in 0:9)
	{
		exp_w2=exp_w2+w[2000+5000*j]
		exp_w5=exp_w5+w[5000+5000*j]
	}
	cat("The expected value of w[2] is ",exp_w2/10,"\n")
	cat("The expected value of w[5] is ",exp_w5/10,"\n")
	par(new=FALSE)
}

main()
