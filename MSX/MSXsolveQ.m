function [errcode] = MSXsolveQ()
% Declaration:
%  [errcode] = MSXsolveQ(void);
%  
% Description:
%  Solves for water quality over the entire simulation period and saves the 
%  results to an internal scratch file.
% 
% Returns:
%  Returns an error code or 0 for no error.
% 
% Notes:
%  This function does not allow access to computed water quality results as 
%  the simulation unfolds. If such information is required use MSXinit in 
%  conjunction with step-wise calls to MSXstep (see below).
% 

global MSXDLLNAME;

[errcode]=calllib(MSXDLLNAME,'MSXsolveQ');
if errcode MSXerror(errcode); end
