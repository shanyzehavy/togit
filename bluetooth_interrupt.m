device = bluetooth("H-C-2010-06-01",1);
configureCallback(device,"terminator",@bl_callback);
configureTerminator(device,"CR/LF")



