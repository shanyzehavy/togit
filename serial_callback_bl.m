function serial_callback_bl(src, ~, bin_file)
%function [] = serial_callback_bl(src, ~ , bin_file)
    persistent buff
    if src.NumBytesAvailable ~= 0 
        buff = [buff read(src,src.NumBytesAvailable)];
        %% Parse Arduino request:
        ind = find(buff == 10, 1);
        while(~isempty(ind))
            str = convertCharsToStrings(char(buff(1:ind-2)));
            buff = buff(ind+1 : end);
            display(str);
            %str = str(1:end-2);
            str_arr = strsplit(str); 
            %% In case 'Get Page' was sent by the Arduino:
            if(strcmp(str_arr{1}, 'get_page'))
                addr = str2double(str_arr{2});
                size = str2double(str_arr{3});
                %$ Send binary file to Arduino:
                write(src, bin_file(addr+1 : addr+size));
                %disp("Binary file sent via Bluetooth to Arduino");
            else
                if(~isempty(str))
                    %display(str);
                end
            end

            ind = find(buff == 10, 1);
        end
    end
end

