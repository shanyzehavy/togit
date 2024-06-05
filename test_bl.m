clc;
clear serial_callback_bl;
clear device;
%% Open bianry file and rad it:
fid = fopen('top_A3P250.dat');
data = fread(fid);
fclose(fid);
%% Open connection with bluetooth device to communicate with Arduino via Bluetooth:
device = bluetooth("H-C-2010-06-01",1);


configureCallback(device, 'byte', 1, @(device, evnt)serial_callback_bl(device, evnt , data));


write(device, 5);