% author: Karteek Pradyumna Bulusu
% Generating hybrid images taking two images of the same size. We took
% image of Gandhi and Einstein of size 300*300.


% Reading first image
i = imread('gandhi.jpg');
% Reading second image
j = imread('einstein.jpg');

% Converting the RGB image to gray- scale
gray_i = rgb2gray(i);
gray_j = rgb2gray(j);
%imshow(gray_i);
% FFT2 for both the gray scaled images
fitwo = fft2(gray_i);
fjtwo = fft2(gray_j);

%fft shift over both the images.
shiftone = fftshift(fitwo);
shifttwo = fftshift(fjtwo);

%Applying Gaussian Low pass filter over one of the images.
low_pass = fspecial('gaussian', size(gray_i), 13);
low_passavg = low_pass ./ max(max(low_pass));

% Giving first image low pass filter and second image the high pass filter
low_image = shiftone .*(low_passavg);
high_image = shifttwo .*(1 - low_passavg);

% Combining both the images
combo = low_image + high_image;

% Obtaining inverse fft shift
inv_shift = ifftshift(combo);

%obtaining IIFT2 of the resultant
inv_shift_two = ifft2(inv_shift);

%Values are converted to gray scale again
final_hybrid = mat2gray(real(inv_shift_two));

%displaying resultant hybrid image
imshow(final_hybrid); title('Hybrid Image of Gandhi and Einstein');