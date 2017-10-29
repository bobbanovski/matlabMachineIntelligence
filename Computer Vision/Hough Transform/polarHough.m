clear;
close all;

img = imread('template.JPG');
img = im2bw(img);
imshow(img);
title('original');

%Get image size
[rows, columns] = size(img);

%Accumulator matrix initialisation
rhomax = ceil(sqrt(rows^2+columns^2));
rhorange = -rhomax:rhomax;
rholength = length(rhorange);
thetarange = -90:90;
thetalength = length(thetarange);

graphx = 1:thetalength;
graphy = 1:2*rhomax;

%initialise accumulator matrix
accumulator = zeros(2*rhomax,thetalength);

%Fill accumulator matrix
%for each column in the binary image
for x = 1:columns
   %for each row in the binary image
   for y = 1:rows
      if(img(y,x) ~= 0)
         %for m=1:180
         %calculate rho for each theta
         for m = 1:thetalength
            rho = round( x*cos(( (m - 91) * pi)/180) + y*sin(( (m - 91) * pi)/180));
            if(rho < rhomax && rho > -rhomax)
               accumulator(rho+rhomax,m) = accumulator(rho+rhomax,m) + 1; 
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

figure;
[houghSpace, theta, rhomuh] = hough(img);
imshow(houghSpace);
shading flat;
title('Matlab hough');

figure;
pcolor(theta,rhomuh,houghSpace);
shading flat;
title('Hough Transform Matlab');
xlabel('Theta (degrees)');
ylabel('Rho (pixels)');
colormap('gray');

figure;
surf(houghSpace);
shading flat;
colormap('jet');

peaks = houghpeaks(accumulator, 4);