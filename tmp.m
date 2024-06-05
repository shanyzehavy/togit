% Vars=whos;
% PersistentVars=Vars([Vars.global]);
% PersistentVarNames={PersistentVars.name};
% clear(PersistentVarNames{:});

global count

count = 0;

clear device;
device = bluetooth("H-C-2010-06-01",1);
configureCallback(device, 'byte', 1, @rprevent_overfl_callback);
for i=1:100
    write(device,1:60);
end

pause(1)
count