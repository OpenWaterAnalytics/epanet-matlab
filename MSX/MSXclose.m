function [errcode] = MSXclose()
% Declaration:
%  [errcode] =  MSXclose(void);
% 
% Description:
%  Closes the MSX Toolkit 
% 
% Returns:
%  Returns an error code.
% 
% Notes: 
%  The EPANET toolkit function ENclose should be called at some point after
%  calling MSXclose to down the EPANET toolkit system.

global MSXDLLNAME;

[errcode] = calllib(MSXDLLNAME,'MSXclose');
if errcode MSXerror(errcode); end
