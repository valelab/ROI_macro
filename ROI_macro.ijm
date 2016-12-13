dir = getDirectory("Choose Source Directory ");
list = getFileList(dir);
setBatchMode(false);
row = 0;
IJ.log("File\tchannel\tarea\tmean\tmin\tmax\tstd");
for (i=0; i<list.length; i++) {
	showProgress(i+1, list.length);
	fileName = split(list[i], '.');

	open(dir+list[i]);
	idOrig = getTitle();
	selectImage(idOrig);
	proceed = 0;
	bg = 0;
	while(proceed==0) {
		makeOval(100, 100, 10, 10); 
		waitForUser( "Pause","Select desired ROI then Click OK.");
		Stack.getDimensions(width, height, channels, slices, frames); 
		for (c=1; c<= channels; c++) { 
			Stack.setChannel(c); 
			getStatistics(area, mean, min, max, std, histogram);
			if(bg==0) {
				IJ.log(idOrig+"\tC"+c+"\t"+area+"\t"+mean+"\t"+min+"\t"+max+"\t"+std+"\n");
				row = row+1;
			} else {
				IJ.log(idOrig+"\tC"+c+"-bg\t"+area+"\t"+mean+"\t"+min+"\t"+max+"\t"+std+"\n");
				row = row+1;
			}
		}
		Dialog.create("Selection"); 
		Dialog.addMessage("Click OK to select more clusters.\nCheck box and click OK to proceed to next image.");
		Dialog.addCheckbox("Background selection?", false);
		Dialog.addCheckbox("Proceed to next image?", false);
		Dialog.show();
		bg=Dialog.getCheckbox();
		proceed=Dialog.getCheckbox();
	}
selectImage(idOrig);
close();
}
saveAs("Measurements", dir+"Results.txt"); 
Dialog.create("Selection"); 
Dialog.addMessage("Processing complete.");
Dialog.show();
