<html>
<body>
<h2> Computer Vision Implementations.</h2>
<h4>This repository include programs solving certain problems in the field of Computer Vision. I have executed these algorithms in MATLAB(version R2013a).</h4> Following is list of programs with brief explanation and prerequisites for executing them.
<h5>
1. Dilate.m </h5>
<h6> Dilate is process of enhancing the features of the image in order to analyze it. This program executed dilation over the image.<br>
Prerequisites:<br>
&emsp;-> MATLAB(atleast version R2013a) </h6>
<h5>
2. Feature_HoG.m </h5>
<h6>This program file has three code sections in it.<br>
- In the first section, I imported the input image and obtained the harris corners of the image and provided a range of 100 corners to detect from the image. The range might vary based on the users requiremenet.<br> 
  Prerequisites: <br>
&emsp;-> MATLAB(atleast R2013a).<br>
- The second section implements most commonly used feature extraction and detecting the objects based on it. I have used inbuilt function of MATLAB "extractHOGFeatures" for obtaining the same.<br>
  Prerequisites:<br> 
&emsp;-> MATLAB(atleast R2013b)<br>
- The third section is implementation of SIFT using vlfeat in MATLAB.<br>
  Prerequisites:<br>
&emsp;-> vlfeat : http://www.vlfeat.org/. <br>
&emsp;-> MATLAB(atleast R2013a) </h6>
<H5>
3. Harris_detector.m </h5>
<h6>
Harris corner detection is primary algorithm to detect corners of the image in order to determine the features.<br>
Prerequisites:<br>
&emsp;-> MATLAB(atleast R2013a)
</h6>
<h5>
4. Hybrid.m</h5>
<h6>
Hybrid image is combination of two images where certain features of each image is been considered in the final output image.<br>
Prerequisites:<br>
&emsp;-> MATLAB(atleast R2013a)
</h6> 
</body>
</html>
