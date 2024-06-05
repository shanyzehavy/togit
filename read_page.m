% Set up serial communication with Arduino
arduino = serialport('COM7', 115200);

data = zeros(1, 10000);
fid = fopen('top.dat');
data = fread(fid);

configureCallback(arduino,"terminator",@(hObject, event)serial_callback(hObject, event, data));
%set(arduino, 'BytesAvailableFcn', {@serial_callback, data});
set(arduino, 'OutputBufferSize', 2048);

fclose(fid);

fopen(arduino);
fwrite(arduino, 0);
fclose(arduino);

