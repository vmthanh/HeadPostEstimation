function [b] = create_3D_point(file_path)
    b =  read_data_2d_images(file_path);
    c = [];
    for i = 1:size(b,2)
        if i== 5
           c = [c,25];
        else
           c = [c,rand+23]
        end 
        
    end
    b = [b;c];
end