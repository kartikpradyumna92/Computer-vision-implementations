%Feature selection using Harris Edge detector
%Author: Karteek Pradyumna Bulusu
% In-built function for detecting Harris points
%This would generates edges for image 1 and display the plots. This would
%plot 100 strongest points.

edges_one = detectHarrisFeatures(gray_one);
figure;imshow(gray_one); title('Harris edge of image one');
hold on;
plot(edges_one.selectStrongest(100));

%This would detect edges of image 2 and plot the points. This would plot
%100 strongest points.
edges_two = detectHarrisFeatures(gray_two);
figure;imshow(gray_two); title('Harris edge of image two');
hold on;
plot(edges_two.selectStrongest(100));

%% HoG(Histogram of Oriented Gradient) using extractHOGFeatures inbuilt function.
% This takes two images as input and detect harris features in both the
% images and extract HOG features in it.
%Works in Matlab with version after R2013b

%Reading the input RG image, converting it to gray scale and doubling it.
input_one=im2double (rgb2gray(imread('one.jpg')));
input_two=im2double (rgb2gray(imread('two.jpg')));
 
%In built function for detecing Harris features of image 1 and image 2
harris_image_one = detectHarrisFeatures(input_one);
harris_image_two = detectHarrisFeatures(input_two);
 
% Selecting ten strongest points for image 1 and 2.
harris_ten_one = harris_image_one.selectStrongest(10).Location;
Harris_ten_two = harris_image_two.selectStrongest(10).Location;

[hog1,ip1]=extractHOGFeatures(input_one,harris_image_one);
[hog2,ip2]=extractHOGFeatures(input_two,harris_image_two);
feature_match = matchFeatures(hog1, hog2) ;
feature_one = ip1(feature_match(:, 1)); % For image 1
feature_two = ip2(feature_match(:, 2)); % For image 2
 
figure; axis = axes;
showMatchedFeatures(input_one,input_two,feature_one,feature_two,'montage','Parent',axis);
title(axis, 'Common Harris corner features , HoG of original and scaled image');

%% USING VLFeat
%Bonus question. Comparision with SIFT. 
% The instructions for installing vlfeat is provided in the README.md file.
% Input image is read and displayed
Input_image = imread('input.jpg') ;
figure; image(Input_image) ; title('Ouput Image');
% It is converted to gray
rgtogray = single(rgb2gray(Input_image)) ;
% vl_shift command is applied and rows and columns are obtained.
[rows,colums] = vl_sift(rgtogray);

perumutation = randperm(size(rows,2)) ;
selection = perumutation(1:50) ;

horizontal_frame = vl_plotframe(rows(:,selection)) ;
vertical_frame = vl_plotframe(rows(:,selection)) ;
set(horizontal_frame,'color','k','linewidth',1) ;
set(vertical_frame,'color','y','linewidth',1) ;
cells_obtained = vl_plotsiftdescriptor(colums(:,selection),rows(:,selection)) ;
set(cells_obtained,'color','g') 
