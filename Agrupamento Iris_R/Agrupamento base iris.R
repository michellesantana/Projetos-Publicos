data (iris)

?iris #Traz informa��es sobre a base de dados

#Eliminando a coluna Species
iris$Species<-NULL 

iris<-data.frame(scale(iris))
iris  

grupos<-hclust(dist(iris)) #por default a dist�ncia utilizada � a dist�ncia euclidiana
?hclust #entendendo sobre a fun��o hclust
grupos


#utilizando outro m�todo, diferente do padr�o
grupos<-hclust(method="centroid",dist(iris))
grupos
  

#cortando os grupos
sub_grupos<- cutree(grupos,k=3)
table(sub_grupos) #olhando a frequ�ncia de cada grupo

plot(grupos) #Dendogramas
rect.hclust(grupos, k=3, border = 2:3)#Esse comando separa visualmente os grupos

#fun��o abaixo usa ACP e mostra os grupos em duas dimens�es
library(factoextra) #se ao chamar a biblioteca, der erro, deve-se instalar primeiro
fviz_cluster(list(data = iris, cluster = sub_grupos))
fviz_nbclust(iris,FUN = hcut, method = "wss") #encontrando n� �timo de clusters
#wss = total within sum of square


#Kmeans

kmeans(iris, centers = 3, iter.max = 10)


