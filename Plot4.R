Plot4 <- function(){
        
        Dados = read.table("./household_power_consumption.txt",sep=";", 
                           header = TRUE,stringsAsFactors =FALSE)
        Dados$Date = as.Date(Dados[,1], "%d/%m/%Y")
        Dados_Ext = subset(Dados,(Dados$Date ==  "2007-02-01" | Dados$Date == "2007-02-02"))
        
        wDays <- strptime(paste(Dados_Ext$Date, Dados_Ext$Time), format='%Y-%m-%d %H:%M:%S')
        
        Global_active_power = as.numeric(Dados_Ext$Global_active_power)
        Voltage = as.numeric(Dados_Ext$Voltage)
        Global_reactive_power = as.numeric(Dados_Ext$Global_reactive_power)
        
        Sub_metering_1 = as.numeric(Dados_Ext$Sub_metering_1)
        Sub_metering_2 = as.numeric(Dados_Ext$Sub_metering_2)
        Sub_metering_3 = as.numeric(Dados_Ext$Sub_metering_3)
        
        
        png("plot4.png", width = 480, height = 480)
        par(mfrow = c(2, 2)) 
        
        plot(wDays, Global_active_power, type="l",
             ylab="Global Active Power", xlab="", cex=0.2)
        plot(wDays, Voltage, type="l",
             ylab="Voltage", xlab="datetime")
        plot(wDays, Sub_metering_1, type="l",
             ylab="Energy Submetering", xlab="")
        
        lines(wDays, Sub_metering_2, type="l", col="red")
        lines(wDays, Sub_metering_3, type="l", col="blue")
        
        legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
               lty=1, lwd =2.5,col=c("black", "red", "blue"), bty = "n")
        
        plot(wDays, Global_reactive_power, type="l", xlab="datetime",
             ylab="Global_reactive_power")
        
        dev.off()
}