Plot1 <- function()
{
  Dados = read.table("./household_power_consumption.txt",sep=";", header = TRUE,stringsAsFactors =FALSE)
  Dados$Date = as.Date(Dados[,1], "%d/%m/%Y")
  Dados_Ext = subset(Dados,(Dados$Date ==  "2007-02-01" | Dados$Date == "2007-02-02"))
  par(mar = rep(4, 4)) 
  hist(as.numeric(as.character(Dados_Ext$Global_active_power)),col="red",
       xlab="Global Active Power (kilowatts)",ylab = "Frequency", main = "Global Active Power")
  dev.copy(png, file = "plot1.png",width=480,height=480) 
  dev.off()  
}