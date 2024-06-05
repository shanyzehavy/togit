%devlist = bluetoothlist;

% HC-05 channel default is 1
device = bluetooth("98D332311783", 1);
commPort = serialport('COM4', 38400);
fopen(device);
write(device, "hello" , 'string');
data = read(commPort, 5, 'string');
disp("Received data:");
disp(data);

clear commPort;


