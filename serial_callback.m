
function [] = serial_callback(hObject, ~, handles)

str = fscanf(hObject);
str = str(1:end-2);
if(~isempty(str))
    display(str)
end
str = strsplit(str);
if(strcmp(str{1}, 'get_page'))
    addr = str2double(str{2});
    size = str2double(str{3});
    fwrite(hObject, handles(addr+1 : addr + size));
end

end