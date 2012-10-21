function [errcode] = MSXaddpattern(id)
% Declaration:
%  [errcode] = MSXaddpattern(id)
% 
% Description:
%  Adds a new, empty MSX source time pattern to an MSX project
% 
% Arguments:
%  id is a C-style character string containing the name of the new pattern.
% 
% Returns:
%  Returns an error code or 0 for no error.
% 
% Notes:
%  The new pattern has no time periods or multipliers assigned to it. The
%  MSXsetpattern function can be used to assign an array of multipliers to
%  the pattern.

global MSXDLLNAME;
[errcode]=calllib(MSXDLLNAME,'MSXaddpattern',id);
if errcode MSXerror(errcode); end
