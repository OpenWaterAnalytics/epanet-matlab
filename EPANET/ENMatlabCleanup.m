function ENMatlabCleanup(DLLname)
% Declaration:
% ENMatlabCleanup(DLLname)
% 
% Description:
% Unloads EPANET DLL library 
%
% Arguments:
% DLLname   Name of the Epanet DLL file (w/o the *.dll extension)
% 
%
% Globals:
% 
% Notes:
% ENMatlabCleanup must be called at the end of a toolkit application.
% must be called when all processing has been completed,
% even if an error condition was encountered.


global ENDLLNAME;
%errcode = 0;
if nargin == 1
    ENDLLNAME=DLLname;
end;
% Load library
if libisloaded(ENDLLNAME)
    unloadlibrary(ENDLLNAME);
else
    errstring =['Library ', ENDLLNAME, '.dll was not loaded'];
    disp(errstring);
end;
