func <- function(x)
{
	y <- 3*x^2-exp(x)
	return(y)
}
diff <- function(x)
{
	y <- 6*x-exp(x)
	return(y)
}
findroot <- function(x0)
{
	
	while(TRUE)
	{
		x1 <- x0 -(func(x0)/diff(x0))
		if(abs(x1-x0) < 0.00001)
		 break
		
		x0<-x1
	}
	return(x1)
}
