function rprevent_overfl_callback(src, ~)

    global count

    if(src.NumBytesAvailable>0)
        butes_cnt = src.NumBytesAvailable;
        count = count + butes_cnt;
        r = read(src, butes_cnt);
        % display(r);
    end
end 
    
