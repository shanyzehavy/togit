function bl_callback(src, evt)

    persistent buff
    if src.NumBytesAvailable ~= 0 
        buff = [buff read(src,src.NumBytesAvailable)];
        ind = find(buff == 10, 1);
        if(~isempty(ind))
            str = convertCharsToStrings(char(buff(1:ind-2)));
            buff = buff(ind+1 : end);
            display(str)
        end
    end
end

