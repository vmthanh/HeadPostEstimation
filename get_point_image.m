function [coordinates]= get_point_image(image_path,num_points)
I = imread(image_path) 
figure, imshow(I)
n = num_points
coordinates = zeros(2,n);
hold on
for i=1:n
[x, y] = ginput(1);
coordinates(:,i) = [x; y];
plot(coordinates(1,:), coordinates(2,:), 'o');
end
hold off