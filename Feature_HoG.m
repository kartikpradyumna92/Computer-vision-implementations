%Feature selection using Harris Edge detector
%Author: Karteek Pradyumna Bulusu
% Features of the two images been read are been detected using Harris Edge
% detector and is matched by calculating euclidean distance between those
% matced points and comparing with second image. Features matching are been
% displayed.

input_one = imread('one.jpg');
input_two = imread('two.jpg');
%gray scale
gray_one = rgb2gray(input_one);
gray_two = rgb2gray(input_two);

%%Gradient vector for input_one
%Sobel kernel used for filtering the image in x and y axis for first image
sobel_o_x = [-1 0 1;-1 0 1;-1 0 1];
dx_o = filter2(sobel_o_x,gray_one);

sobel_o_y = [1 1 1;0 0 0;-1 -1 -1];
dy_o = filter2(sobel_o_y,gray_one); 

%Gradient vector for input_two
%Sobel kernel used for filtering the image in x and y axis for second image
sobel_t_x = [-1 0 1;-1 0 1;-1 0 1];
dx_t = filter2(sobel_t_x,gray_two);

sobel_t_y = [1 1 1;0 0 0;-1 -1 -1];
dy_t = filter2(sobel_t_y,gray_two); 


%Finding magnitude of the image one
dx_o_2 = dx_o.^2;
dy_o_2 = dy_o.^2;
dxdy_o = dx_o.*dy_o; %dxdy_o gives magnitude

%Finding magnitude of the image two
dx_t_2 = dx_t.^2;
dy_t_2 = dy_t.^2;
dxdy_t = dx_t.*dy_t; %dxdy_t gives magnitude

%% In-built function for detecting Harris points

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

%% HoG(Histogram of Gradient) using extractHOGFeatures inbuilt function.
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
