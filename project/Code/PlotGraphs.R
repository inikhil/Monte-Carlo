# Plots the histograns and the lambda, beta distributions
# for a given value of the exponential distribution.
plot_lambda_betas <- function(exp_lambda) {
    lam_bet = c(0.9, 0.9, 2, 2)
    alpha = c(0.5, 3, 3, 0.5)
    let = c("A", "B", "C", "D")
    
    for(i in 1:4) {
        x_vec = modified_weibull(lam_bet[i], alpha[i], lam_bet[i], 10000)
        name = paste("Histogram", let[i], ".png", sep="")
        png(filename=name, bg="white", width=1280, height=720)
        par(ps=18)
        tit = paste("Histogram for x with l = ", lam_bet[i], ", b = ", lam_bet[i], ", a = ", alpha[i], " and N = 10000", sep="")
        hist(x_vec, breaks=49, col="black", border="white", xlab="x", main=tit)
        box()
        dev.off()

        x_vec = x_vec[1:100]
        #x_vec = modified_weibull(lam_bet[i], alpha[i], lam_bet[i], 100)
        l_b = lambda_beta(lam_bet[i], lam_bet[i], x_vec, exp_lambda)
        name = paste("Plot", let[i], "1", ".png", sep="")
        png(filename=name, bg="white", width=1280, height=720)
        par(ps=18)
        tit = paste("Plot of lambda vs i with exponential distribution's l = ", exp_lambda, sep="")
        plot(l_b[[1]], type="l", ylab="lambda", xlab="i", main=tit)
        box()
        dev.off()

        name = paste("Plot", let[i], "2", ".png", sep="")
        png(filename=name, bg="white", width=1280, height=720)
        par(ps=18)
        tit = paste("Plot of beta vs i with exponential distribution's l = ", exp_lambda, sep="")
        plot(l_b[[2]], type="l", ylab="beta", xlab="i", main=tit)
        box()
        dev.off()
    }

}
