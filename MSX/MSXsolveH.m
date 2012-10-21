function [errcode] = MSXsolveH()
% Declaration:
%  [errcode] = MSXsolveH( void )
% 
% Description:
%  Runs a complete hydraulic simulation with results for all time periods 
%  written to the binary Hydraulics file. 
% 
% Returns:
%  Returns an error code.
% 
% Notes: 
%  Either this function or MSXusehydfile (see below) must be called
%  before any water quality processing is performed. 

global MSXDLLNAME;

[errcode]=calllib(MSXDLLNAME,'MSXsolveH');
if errcode MSXerror(errcode); end
