clear;
close all;

img = imread('circle.JPG');
img = im2bw(img);
imshow(img);
title('original');

%Get image size
[rows, columns] = size(img);
graphx = 1:columns;
graphy = 1:rows;

%Initialise accumulator
accumulator = zeros(rows, columns);
r = 71;
%Loop through columns of image
for x = 1:columns
   %Loop throug rows of image
   for y = 1:rows
       %if element of binary image is not zero
       if (img(y,x) ~= 0)
           %calculate x0 and y0 for angles 0 to 360
           for angle = 0:360
              theta = (angle*pi)/180;
              x0 = round(x - r*cos(theta));
              y0 = round(y - r*sin(theta));
              %if x0 and y0 lie within bounds of hough accumulator
              if (x0<columns && x0 > 0 && y0<rows && y0 > 0)
                  accumulator(y0,x0) = accumulator(y0,x0) + 1;
              end
           end
       end
   end
end

%Show the Hough Transform Diagram
figure;
pcolor(graphx,graphy,accumulator);
shading flat;
colormap('gray');
title('Hough Accumulator Kinetic');
xlabel('Theta (degrees)'); ylabel('Rho (pixels)');

figure;
surf(accumulator);
shading flat;
title('hough surface');
