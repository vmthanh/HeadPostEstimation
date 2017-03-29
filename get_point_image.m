function [coordinates]= get_point_image(image_path,num_points,file_name)
I = imread(image_path); 
figure, imshow(I);
n = num_points;
coordinates = zeros(2,n);
hold on;

fileId = fopen(file_name,'a+');
fprintf(fileId,"%s;",image_path);
for i=1:n
[x, y] = ginput(1);
coordinates(:,i) = [x; y];
fprintf(fileId,'%f-%f;',x,y);
plot(coordinates(1,:), coordinates(2,:), 'o');
end
fprintf(fileId,'\r\n');
fclose(fileId);

hold off;