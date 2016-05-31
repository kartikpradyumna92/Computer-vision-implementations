%Dilation is used to enhance the features of the image.
%author: Karteek Pradyumna Bulusu

%Dilation of the Image
input = imread('input.jpg');
figure,imshow(input); title('Input Image');

% gray scale
gray_image = rgb2gray(input);
figure,imshow(gray_image);title('After gray scale');

%converting to binary
binary_image = im2bw(gray_image);
si = 30;

%size of the image is fixed to perform structuring.
[x y] = size(si);
figure, imshow(binary_image); title('Output image');

%size of the structured element is done.
[i j] = size(binary_image);
temp = zeros(i,j);

%for all x co ordinates of binary image
for a = 1:i
    for b = 1:j
        if(binary_image(a,b)==1)
            
            
            for c = 1 : x %for all x cordinates of structured element
                for d = 1 : y
                    if(si(c,d)==1)
                        e = a + c;
                        f = b + d;
                        temp(e,f) = 1;
                    end
                end
            end
        end
    end
end


%figure, imshow(temp); title('output ');