plot3<-function() {

	# Constants
	file_name<-"household_power_consumption.txt";
	sep<-";";

	# Read Column Names
	column_names<-colnames(read.table(file=file_name,sep=sep,header=TRUE,nrow=1));

	# First row of data is 16-12-2006, 17:24:00, 
	# and number of rows till 02-01-2007 will be 66637 minutes (skip rows)
	# and we have to read 2 days of data = 2 X 60 X 24 = 2880 minutes (nrows)
	df<-read.table(file=file_name,
		       sep=sep,
		       na.strings="?",
		       colClasses="character",
		       col.names=column_names,
		       nrows=2880,
		       skip=66637);

	# Cast as numeric -
	df$Sub_metering_1<-as.numeric(df$Sub_metering_1);
	df$Sub_metering_2<-as.numeric(df$Sub_metering_2);
	df$Sub_metering_3<-as.numeric(df$Sub_metering_3);

	# Add new column for referring date-time together
	df$DateTime<-strptime(paste(df$Date, df$Time, sep=" "), format="%d/%m/%Y %H:%M:%S")

	# Open device for drawing
	# Default unit for png is pixels
	png(filename="plot3.png",
	    height=480,
	    width=480,
	    bg="transparent");

	# Draw empty plot3, with only the x and y labels
	plot(df$DateTime,df$Sub_metering_1,
	     ylab="Energy sub metering",
	     xlab="",
	     type="n");

	# Add line plots with different colors
	lines(df$DateTime,df$Sub_metering_1);
	lines(df$DateTime,df$Sub_metering_2,col="red");
	lines(df$DateTime,df$Sub_metering_3,col="blue");
	
	# Add legend
	legend("topright",
		lty=1,
		col=c("black","red","blue"),
		legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"));
	
	# Save plot
	dev.off();
}
