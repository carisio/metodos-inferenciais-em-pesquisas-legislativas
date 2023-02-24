
dnormalIC <- function(media=0, dp=1, n = NULL, nc=.95)
{

  inc <- 0.01
  
  if(!is.null(n)) {
    dp <- dp/sqrt(n)
    if(n >= 10000) inc <- 0.001
  }
  
  
  cores=c("#7FFFD4", "#ADD8E6", '#FF6347')
  
  # eixo x da curva normal
  lim <- media+c(-4,4)*dp
  x <- seq(lim[1], lim[2], by = inc)

  # curva normal
  cn1 <- function(x) {dnorm(x,media,dp)} # curva normal

  # traca a curva normal
  plot(x,cn1(x),ylab="Densidade",xlab="x",
       main="Intervalo de Confianca",type="l",lwd=2, col=cores[1])
  
  # intervalos de confianca
  xI11 <- round(media - qnorm(nc+(1-nc)/2)*dp, 4)
  xI12 <- round(media + qnorm(nc+(1-nc)/2)*dp, 4)

  ic <- seq(xI11, xI12, by = inc)
  polygon(c(min(ic), ic, max(ic)), c(0, cn1(ic),0), col=scales::alpha(col=cores[1],.7))

  # linha horizontal em zero
  lines(lim,c(0,0))
  
  # linhas da media
  lines(c(media,media),c(-1,cn1(media)),lwd=2,type="l")
  
  # linha das curvas
  lines(x,cn1(x),lwd=2)
  
  
  text(xI12,-dnorm(media,media,dp)/70,paste("ic2=",xI12),cex=0.7)
  text(lim[1],cn1(media)*.85,paste("ic2 =",xI12),cex=0.8,pos=4)
  
  integral <- function(f,a,b) {i<-integrate(f,a,b); as.numeric(i[1])}
  phachura<-round(integral(cn1,xI11,xI12),4)
  text(lim[1],cn1(media),paste("Area hachurada =",phachura), cex=0.8, pos=4)
  text(lim[1],cn1(media)*.95,paste("Area branca =",1-phachura), cex=0.8, pos=4)
  text(lim[1],cn1(media)*.90,paste("ic1 =",xI11),cex=0.8,pos=4)
  text(xI11,-dnorm(media,media,dp)/70,paste("ic1=",xI11),cex=0.7)
  
  text(lim[1],cn1(media)*.80,paste0("nc = ",nc*100,"%"),cex=0.8,pos=4)
  if(!is.null(n)) text(lim[1],cn1(media)*.75,paste("n =",n),cex=0.8,pos=4)
    

}      
