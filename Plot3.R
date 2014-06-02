Plot3 <- function()
{
  Dados = read.table("./household_power_consumption.txt",sep=";", header = TRUE,stringsAsFactors =FALSE)
  Dados$Date = as.Date(Dados[,1], "%d/%m/%Y")
  Dados_Ext = subset(Dados,(Dados$Date ==  "2007-02-01" | Dados$Date == "2007-02-02"))
  
  wDays <- strptime(paste(Dados_Ext$Date, Dados_Ext$Time), format='%Y-%m-%d %H:%M:%S')
  
  Sub_metering_1 = as.numeric(as.character(Dados_Ext$Sub_metering_1))
  Sub_metering_2 = as.numeric(as.character(Dados_Ext$Sub_metering_2))
  Sub_metering_3 = as.numeric(as.character(Dados_Ext$Sub_metering_3))
  
  png("plot3.png", width = 480, height = 480)
  
  par(mar = rep(4, 4))
  plot(wDays,Sub_metering_1,type="l",
       ylim=range(c(Sub_metering_1,Sub_metering_2,Sub_metering_3)),xlab="",ylab = "Energy Sub metering")
  lines(wDays, Sub_metering_2, type="l", col="red")
  lines(wDays, Sub_metering_3, type="l", col="blue")
  
  legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd =2.5,
         col=c("black", "red", "blue"))
  
  
  dev.off()
  
}



