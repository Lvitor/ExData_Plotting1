Plot2 <- function()
{
  Dados = read.table("./household_power_consumption.txt",sep=";", header = TRUE,stringsAsFactors =FALSE)
  Dados$Date = as.Date(Dados[,1], "%d/%m/%Y")
  Dados_Ext = subset(Dados,(Dados$Date ==  "2007-02-01" | Dados$Date == "2007-02-02"))
  
  Global_active_power = as.numeric(Dados_Ext$Global_active_power)
  
  wDays <- strptime(paste(Dados_Ext$Date, Dados_Ext$Time), format='%Y-%m-%d %H:%M:%S')
  par(mar = rep(4, 4))
  plot(wDays, Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)") 
 
  dev.copy(png, file = "plot2.png",width=480,height=480) 
  dev.off()
 
 
}