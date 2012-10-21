function [] = MSXMatlabSetup(DLLname,Hname)
% Declaration:
%  [errcode] =  MSXMatlabSetup(DLLname,Hname)
% 
% Description:
%  Opens the DLL library and sets global variables required by the Matlab 
%  Epanet-MSX Toolkit
% 
% Arguments:
%   DLLname   Name of the Epanet-MSX DLL file (w/o the *.dll extension)
%   Hname     Name of the Epanet-MSX header file defining the exported symbols in
%           DLLname.dll (with the *.h extension).
% 
% Returns:
%  Returns an error code.
%
%  MSX_CONSTANT is a global structure containing all integer codes defined
%  for use of the Epanet-MSX programmer's toolkit (as defined in epanetmsx.h).  
%  This structure can then be used for convenient access to these codes,
%  by declaring 'global ENMSX_CONSTANT' in the code module.
% 
% Notes:
%  MSXMatlabSetup must be called before any of the other toolkit functions.
% 

global MSXDLLNAME;
global MSX_CONSTANT;

MSXDLLNAME=DLLname;
MSXHNAME=Hname;

if ~libisloaded(MSXDLLNAME)
   loadlibrary(MSXDLLNAME,MSXHNAME);
end

MSX_CONSTANT = struct(...
'MSX_NODE',              int32(0),...     % Components
'MSX_LINK',              int32(1),...
'MSX_TANK',              int32(2),...  
'MSX_SPECIES',           int32(3),...     % Component counts
'MSX_TERM',              int32(4),...
'MSX_PARAMETER',         int32(5),...
'MSX_CONSTANT',          int32(6),...
'MSX_PATTERN',           int32(7),...
'MSX_BULK',              int32(0),...
'MSX_WALL',              int32(1),...
'MSX_NOSOURCE',          int32(-1),...
'MSX_CONCEN',            int32(0),...     % Source types
'MSX_MASS',              int32(1),...
'MSX_SETPOINT',          int32(2),...
'MSX_FLOWPACED',         int32(3));
