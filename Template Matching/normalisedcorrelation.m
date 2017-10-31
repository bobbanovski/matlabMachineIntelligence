%%
%find template 1D
s = [-1 0 0 1 1 1 0 -1 -1 0 1 0 0 -1];
t = [1 1 1 0 0];
disp('Signal:'), disp([1:size(s, 2); s]);
disp('Template:'), disp([1:size(t,2); t]);
index = find_template_1D(t,s);


%% 2D grayscale images
% does not work for color
imgoriginal = rgb2gray(imread('dolphins.jpg'));
imgfilter = rgb2gray(imread('dolphinone.jpg'));

% imshowpair(imgoriginal, imgfilter, 'montage')
%c = normxcorr2(imgfilter, imgoriginal);

%figure;
%surf(correlated);
%shading flat;
%c = max(correlated) %only finds column wise maximums

%[yRaw xRaw] = find(c == max(c(:))); %find image wide maximum
%yIndex = yRaw - size(imgfilter, 1) + 1;
%xIndex = xRaw - size(imgfilter, 2) + 1;

%[yIndex, xIndex, yRaw, xRaw] = find_template_2D(imgfilter, imgoriginal);
output = find_template_2D(imgfilter, imgoriginal);
yIndex = output(1);
xIndex = output(2);
yRaw = output(3);
xRaw = output(4);
colormap('gray'), imagesc(imgoriginal);
hold on;
plot([xIndex, xRaw], yIndex, 'r+', 'markersize', 15);
plot([xIndex, xRaw], yRaw, 'r+', 'markersize', 15);
hold off;
figure
imshow(imgfilter);

