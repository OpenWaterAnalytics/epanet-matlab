function [errcode] = MSXsetpattern(pat, multi, len)
% Declaration:
%  [errcode] = MSXsetpattern(pat, multi, len)
% 
% Description:
%  Assigns a new set of multipliers to a given MSX source time pattern.
% 
% Arguments:
%  pat is the internal sequence number (starting from 1) of the pattern as
%  it appears in the MSX input file;
%  
%  multi is an one-dimensional array of multiplier values to replace those previously used
%  by the pattern;
% 
%  len is the number of entries int the multiplier array mult.
% 
% Returns:
%  Returns an error code or 0 for no error.
% 
% Notes:
%  This function only applies to source time patterns that appear in the MSX
%  input file. There is a comparable EPANET toolkit function, ENsetpattern,
%  which can be used for the demand patterns defined in the EPANET input
%  file.

global MSXDLLNAME;

pat=int32(pat);
len=int32(len);
[errcode]=calllib(MSXDLLNAME,'MSXsetpattern',pat,multi,len);
if errcode MSXerror(errcode); end
