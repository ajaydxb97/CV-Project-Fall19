# CV-Project-Fall19
## Object Recognition of 8 ball and Black Yo-yo

This is the project for the course CS/RBE 549 Computer Vision, Fall 2019 at Worcester Polytechnic Institute.
In this project we aim to locate and recognize an 8-ball and a black yo-yo in a given image using multiple methods.
The usage of each method is specified below.

## Histogram of Oriented Gradients (HOG)
For HOG, please change the path to the folder and run the Jupyter notebook program (CS549.ipynb) step by step to get the results. Or just load the trained linear SVM to predict the results. 

## Speeded Up Robust Features (SURF) Library Method:
For SURF, use the files on test images.
  run_surf_8ball.m
  run_surf_yoyo.m

Comments in each file dictate how to use more effectively, but here is a brief description for using both.

Before running, have your cropped files ready from your OpenCV annotations. If you do not have them ready, please uncomment the imcropping code in either lines 15 and 16 or 17 and 18 depending on your file. You will need to crop the images one at a time in this case. 

Change line 36 to the img you want to test. Lines 30-36 have commented out file names that can be used if you want to test them for different images. As is, it will output a demo with a bounding box. Uncomment lines 89+ to run batch testing. Variable SrcFiles is the file location for all your .png files. Change this variable to the file location for all the images you want to store and then add onto it '\*.png'. 

This will store all the png file names, which will be called in the next portion. The rest of the first portion of the code is a loop to run surf on all of these files and store their information in cells. For ~500 images it may take about 12 seconds. The next portion takes an image and extracts surf features from it. The variable is Ka, be sure to change the file name if you want to test other pictures. This portion is timed, the algorithm will attempt to match the features to each of the cells you stored earlier, then records the info for best match. This info is used to create the bounding box in the image. It takes image Ka =>rgb2gray=> K =>compare Matched points => K => bounding box from matched points => Q. Then it imshows Q.

## Local Binary Pattern Cascade of Classifiers (LBP)
Use the folders:
LocalBinaryPattern 8-ball &
LocalBinaryPattern Yo-yo
Each of the folders have the weights xml files named: cascade-PoolLBP17.xml and cascade-YoyoLBP17.xml. These have been trained for 17 stages each. The folders also contain an associated Python script: pool_test.py and yoyo_test.py.

After pasting a test image in the same folder as these scripts along with the weight files, you may change the name of the file to be read within the python scripts imread statement. Running the scripts will save the result image with the labels in the same folder.

If you would like to train your own LBP cascade of classifier follow the steps here: https://docs.opencv.org/master/dc/d88/tutorial_traincascade.html

The below figures show the result of some test images run on the LBP classifier.
![alt text](https://github.com/ajaydxb97/CV-Project-Fall19/blob/master/LBP/image11.png "1")

## Haar Cascade Cascade of Classifiers
Use the folders:
Haar 8-ball &
Haar Yo-yo
Each of the folders have the weights xml files named: haarCascade_17.xml and cascade-YoyoHaar17.xml. These have been trained for 17 stages each. The folders also contain an associated Python script: pool_test.py and yoyo_test.py.

After pasting a test image in the same folder as these scripts along with the weight files, you may change the name of the file to be read within the python scripts imread statement. Running the scripts will save the result image with the labels in the same folder.

If you would like to train your own Haar cascade of classifier follow the steps here: https://docs.opencv.org/master/dc/d88/tutorial_traincascade.html

## You Only See Once (YOLOv2)
We used the same architecture and steps for training as done here : https://pjreddie.com/darknet/ 

The below figures show the result of some test images run on .

We thank Prof. Michael A. Gennert for his advice and guidance without which we would not have been able to do this project.



