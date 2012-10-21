function MSXMatlabCleanup(DLLname)
% Declaration:
% MSXMatlabCleanup(DLLname)
% 
% Description:
% Unloads MSX DLL library 
%
% Arguments:
% DLLname   Name of the MSX DLL file (w/o the *.dll extension)
%
% Globals:
% 
% Notes:
% MSXMatlabCleanup must be called at the end of a toolkit application.
% must be called when all processing has been completed,
% even if an error condition was encountered.


global MSXDLLNAME;
%errcode = 0;
if nargin == 1
    MSXDLLNAME=DLLname;
end;
% Load library
if libisloaded(MSXDLLNAME)
    unloadlibrary(MSXDLLNAME);
else
    errstring =['Library ', MSXDLLNAME, '.dll was not loaded'];
    disp(errstring);
end;
