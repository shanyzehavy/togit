% Baudrate 115200, define in PUTTY
% Type device in terminal to see bytes available, etc.
% Use F9 on a certain variable on code to see info

%devlist = bluetoothlist;
%create a bluetooth object
%HC-05 channel default is 1
device = bluetooth("H-C-2010-06-01",1);

% THIS DOESNT WORK
%device = bluetooth("98D332311783",1);
%fopen(device);
%pause(10);
%write and read function
%Bluetooth_Read=fgets(device);
%%%%%%


% Write to HC-05 using bluetooth from computer. Reply is via UART -
% noticable on PUTTY.
%write(device,1:10);

% Read from HC-05 using cluetooth. In order to read - Open putty
% and send bytes via UART first.
from_device = read(device,1);

%close and clear
%clear(device);