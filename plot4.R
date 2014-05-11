plot4<-function(file) {
	file_name<-"household_power_consumption.txt";
	sep<-";";
	column_names<-colnames(read.table(file=file_name,sep=sep,header=TRUE,nrow=1));

	df<-read.table(file=file_name,
		       sep=sep,
		       na.strings="?",
		       colClasses="character",
		       col.names=column_names,
		       nrows=2880,
		       skip=66637);

	df$Global_active_power<-as.numeric(df$Global_active_power);
	df$Global_reactive_power<-as.numeric(df$Global_reactive_power);
	df$Voltage<-as.numeric(df$Voltage);
	df$Sub_metering_1<-as.numeric(df$Sub_metering_1);
	df$Sub_metering_2<-as.numeric(df$Sub_metering_2);
	df$Sub_metering_3<-as.numeric(df$Sub_metering_3);
	df$DateTime<-strptime(paste(df$Date, df$Time, sep=" "), format="%d/%m/%Y %H:%M:%S");

	png(filename="plot4.png",
	    height=480,
	    width=480,
	    bg="white");

	par(mfrow=c(2,2));

	plot(df$DateTime,df$Global_active_power,
	     type="l",
	     ylab="Global Active Power",
	     xlab="")

	plot(df$DateTime,df$Voltage,
	     type="l",
	     ylab="Voltage",
	     xlab="datetime")

	plot(df$DateTime,df$Sub_metering_1,
	     ylab="Energy sub metering",
	     xlab="",
	     type="n")

	lines(df$DateTime,df$Sub_metering_1)
	lines(df$DateTime,df$Sub_metering_2,col="red")
	lines(df$DateTime,df$Sub_metering_3,col="blue")

	legend("topright",
		lty=1,
		col=c("black","red","blue"),
		legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

	plot(df$DateTime,df$Global_reactive_power,
	     type="l",
	     ylab="Global_reactive_power",
	     xlab="datetime")

	dev.off();
}
