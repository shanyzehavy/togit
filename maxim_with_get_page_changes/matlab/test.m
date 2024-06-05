fclose(uart);
fid = fopen('top_A3P250.dat');
data = fread(fid);
fclose(fid);

uart = serial('COM4','BaudRate', 115200);
set(uart, 'BytesAvailableFcn', {@serial_callback, data});
set(uart, 'OutputBufferSize', 2048);
fopen(uart);
pause(2);

fwrite(uart, 5)

% fclose(uart);

%Serial.println("qwe");
 %                       Serial.println(error_code);
  %                      while (1) {}