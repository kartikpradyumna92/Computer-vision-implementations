%HARRIS CORNER DETECTION: This is one of the famous algorithm to detect the
%corners of the image. Following is the implementation of this algorithm.
% Author: Karteek Pradyumna Bulusu
%Referred : http://www.cse.psu.edu/~rtc12/CSE486/lecture06.pdf

%Read the input and converting it to gray scale
img = imread('input.jpg');
gray_img = rgb2gray(img);
figure;imshow(gray_img);title('Input Image');

%%Sobel matrix in x axis
sobel_x = [-1 0 1;-1 0 1;-1 0 1];
dx = filter2(sobel_x,gray_img);
% applying sobel edge detector in the vertical direction
sobel_y = [1 1 1;0 0 0;-1 -1 -1];
dy = filter2(sobel_y,gray_img); 

%Finding magnitude of the image
dx2 = dx.^2;
dy2 = dy.^2;
dxdy = dx.*dy; %dxdy gives magnitude

%applying gaussian filter on the computed value
h= fspecial('gaussian',[20 20],22); 
%Gaussian filter over x value
dx2 = filter2(h,dx2);
%Gaussian filter over y value
dy2 = filter2(h,dy2);
%Gaussian filter over dxdy value obtained above.
dxdy = filter2(h,dxdy);
%Size of the image used for filling it with Zeros
size_image = size(gray_img);
% Zeros are applied over all the pixels with that size of the image. One is
% used for finding 
result_one = zeros(size_image,size_image); 
result_two = zeros(size_image,size_image);
%initilize the maximum value to 0
Rmax = 0; 
%For all pixels in the image, derivative is obtained. Determinant of the 
%same is been calculated and response of every pixel is een displayed. 

for a = 1:size_image
    for b = 1:size_image
        M = [dx2(a,b) dxdy(a,b);dxdy(a,b) dy2(a,b)]; 
        result_two(a,b) = det(M)-0.01*(trace(M))^2;
        if result_two(a,b) > Rmax
            Rmax = result_two(a,b);
        end;
    end;
end;
cnt = 0;
for i = 2:size_image-1
    for j = 2:size_image-1
        if result_two(i,j) > 0.1*Rmax && result_two(i,j) > result_two(i-1,j-1) && result_two(i,j) > result_two(i-1,j) && result_two(i,j) > result_two(i-1,j+1) && result_two(i,j) > result_two(i,j-1) && result_two(i,j) > result_two(i,j+1) && result_two(i,j) > result_two(i+1,j-1) && result_two(i,j) > result_two(i+1,j) && result_two(i,j) > result_two(i+1,j+1)
            result_one(i,j) = 1;
            cnt = cnt+1;
        end;
    end;
end;
%Elements in rows and columns are been displayed for the values which has
%result as 1.
[column, row] = find(result_one == 1);

figure;imshow(gray_img);title('Harris Corner Detection Algorithm');
hold on;
%This plots the graph points in the image.
plot(row,column,'.');

%% Inbuilt function
% This is the inbuilt implementation of Harris corner algorithm.
img = imread('input.jpg');
gray_img = rgb2gray(img);
%detectHarrisFeatures is the inbuilt function for detecting Harris
%features.

edges = detectHarrisFeatures(gray_img);
imshow(gray_img); title('Output from inbuilt function');
hold on;
%This would plot 100 strongest edges of the image
plot(edges.selectStrongest(100));
