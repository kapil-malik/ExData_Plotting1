plot1<-function() {

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
	df$Global_active_power<-as.numeric(df$Global_active_power);

	# Open device for drawing
	# Default unit for png is pixels
	png(filename="plot1.png",
	    height=480,
	    width=480,
	    bg="transparent");

	# Draw plot 1
	hist(df$Global_active_power,
	     main="Global Active Power",
	     xlab="Global Active Power (kilowatts)",
	     ylab="frequency",
	     col="red");

	# Save plot
	dev.off();
}
