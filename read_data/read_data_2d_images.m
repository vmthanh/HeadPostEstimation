function [b] = read_data_2d_images(file_name)
fileId = fopen(file_name,'r');
line = fgetl(fileId);
b=[];
while ischar(line)
    disp(line);
    data = strsplit(line,';');
    v = [];
    for i=2:(size(data,2)-1)
        xy = strsplit(char(data(i)),'-');
        v = [v,[str2double(xy(1));str2double(xy(2))]];
    end
    b = cat(3,b,v)
    disp(v);
    line = fgetl(fileId);
end
end

