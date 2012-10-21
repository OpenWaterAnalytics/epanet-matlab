function [errcode] = MSXusehydfile(hydfname)
% Declaration:
%   [errcode] = ENMSXusehydfile( hydfname )
% 
% Description:
%   Specifies an existing hydraulics file to use when performing a
%   msx water quality analysis
% 
% Returns:
%   Returns an error code.
% 
% Notes: 
%  Either this function or MSXsolveH must be called before any
%  water quality processing is performed.

global MSXDLLNAME;

[errcode]=calllib(MSXDLLNAME,'MSXusehydfile',hydfname);
if errcode MSXerror(errcode); end
