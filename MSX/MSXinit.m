function [errcode] = MSXinit(flag)
%Declaration:
%  [errcode] = MSXinit(flag)
%
% Description:
%  Initializes the MSX system before solving for water quality results in
%  step-wise fashion.
%
% Arguments:
%  Set flag to 1 if water quality results should be saved to a
%  scratch binary file, or to 0 if results are not saved to file.
%
% Returns:
%  Returns an error code or 0 for no error.
%
% Notes: 
%  This function must be called before a step-wise water quality simulation
%  is performed using MSXstep. Do not call this function if performing a 
%  complete simulation using MSXsolveQ.


global MSXDLLNAME;

flag=int32(flag);
[errcode]=calllib(MSXDLLNAME,'MSXinit',flag);
if errcode MSXerror(errcode); end
