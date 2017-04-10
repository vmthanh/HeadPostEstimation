function [] = create_csv_file(folder_path,file_name)
folder = dir(folder_path);
sz = size(folder);
fileId = fopen(file_name,'a+');
for i=1:sz(1)
    file_name = folder(i).name;
    if strcmp(file_name,'.') || strcmp(file_name,'..')
        continue;
    end
    file_path = strcat(folder_path,'/',file_name);
    person_id = file_name(1:13);
    idx = strfind(file_name(15:length(file_name)),'-');
    if isempty(idx)
        idx =  strfind(file_name(15:length(file_name)),'+');
    end
    idx_dot = strfind(file_name,'.');
    vertical_pose = file_name(14:(14+idx(1)-1));
    horizontal_pose = file_name((14+idx(1)):idx_dot(1)-1);
    fprintf(fileId,'%s;%s;%s;%s\r\n',file_path,person_id,vertical_pose,horizontal_pose);
end
fclose(fileId);
