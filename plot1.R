plot1<-function(file) {
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

	png(filename="plot1.png",
	    height=480,
	    width=480,
	    bg="white");

	hist(df$Global_active_power,
	     main="Global Active Power",
	     xlab="Global Active Power (kilowatts)",
	     ylab="frequency",
	     col="red");

	dev.off();
}
