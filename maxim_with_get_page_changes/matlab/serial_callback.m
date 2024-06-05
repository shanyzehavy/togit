function [] = serial_callback(hObject, ~ , handles)

str = fscanf(hObject);
str = str(1:end-2);
str_arr = strsplit(str);

if(strcmp(str_arr{1}, 'get_page'))
    addr = str2double(str_arr{2});
    size = str2double(str_arr{3});
    fwrite(hObject, handles(addr+1 : addr+size));
%     display(str);
else
    if(~isempty(str))
        display(str)
    end
end

end