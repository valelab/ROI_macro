The code in this repository is for an ImageJ/FIJI macro for that will iterate through a directory of TIF files to measure intensity values within a manually refined ROI in multichannel images. 

To use:
Install ROI_macro.ijm using ImageJ/Fiji installer
Run Macro
Choose a directory of TIF images

Select a "foreground" ROI using built in selection tools
Click "OK" in "Pause" dialog
	Log window will output:
		Filename
		Channel
		Selection area
		Mean pixel value
		Min pixel value
		Max pixel value
		Standard deviation

Click OK in "Selection" dialog to select another ROI
	Check box for "Background selection?" to mark next channel measurement "-bg"
	Check box for "Proceed to next image?" to move to the next file in the directory

Cancel will terminate interation through directory

At end of directory, dialog will read "Processing complete"