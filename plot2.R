plot2<-function(file) {
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
	df$DateTime<-strptime(paste(df$Date, df$Time, sep=" "), format="%d/%m/%Y %H:%M:%S")

	png(filename="plot2.png",
	    height=480,
	    width=480,
	    bg="white");

	plot(df$DateTime,df$Global_active_power,
	     type="l",
	     ylab="Global Active Power (kilowatts)",
	     xlab="");

	dev.off();
}
