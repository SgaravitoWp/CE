library(ssym)
library(ggplot2)

#Use el conjunto de datos en el objeto Ovocytes del paquete ssym para construir un gráfico de dispersión que ilustre la evolución en el tiempo (time) de la fracción del volumen celular isotónico inicial (fraction) entre los ovocitos de cabra maduros (type="Mature") e inmaduros (type="Immature"). Incluya una curva suave (regresión polinómica o regresión no paramétrica) que describa la relación entre fraction y time para cada tipo de ovocito de cabra.
data("Ovocytes", package="ssym")
Ovocytes
ggplot(Ovocytes,aes(x=time, y=fraction, color=type)) +
       geom_point(shape=16,size=3.5) +
       geom_smooth(method="lm",formula=y ~ poly(x,degree=4),se=FALSE,linetype="solid",color="black") +
       scale_x_continuous(breaks=seq(from=0,to=20,by=1)) +
       scale_y_continuous(breaks=seq(from=0,to=1,by=0.1)) +
       # scale_color_manual(values=c("blue","red")) +
       labs(title="Evolución en el tiempo de la fracción del volumen celular",x="Tiempo",y="Fracción vol. celular", color="Tipo") +
       theme_minimal() +
       theme(plot.title=element_text(face="bold", vjust=0.5,hjust=0.5, angle=0))
