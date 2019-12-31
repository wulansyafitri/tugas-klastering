library(ggplot2)
library(cluster)
data=penduduk_data_adi
data
data$desa
hasil<-kmeans(data[,2,3],3)
hasil
hasil$cluster
hasil$centers
hasil$size


table(hasil$cluster, data$desa)
hasil$cluster <- as.factor(hasil$cluster)
ggplot(data, aes(data$desa, data$laki, data$perempuan, color = hasil$cluster)) + geom_point()
dataSample <-data[,2,3]
hc <- hclust(dist(dataSample), method="ave")
hc
plot(hc, hang = -1, labels=data$laki)

d <- dist(dataSample, method="euclidian")
pamCluster <- pam(d, 3)
clusplot(as.matrix(d), pamCluster$cluster, color=T, shade=T, labels=3, lines=0) 
pamCluster