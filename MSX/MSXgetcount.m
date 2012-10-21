function [errcode,count] = MSXgetcount(code)
% Declaration:
% [errcode,count] =  MSXgetcount( code )
%
% Description: 
%  Retrieves the number of objects of a specific type.
% 
% Arguments: 
%  code: is the type of object being sought and must be one of the 
%        following pre-defined constants: 
%        MSX_SPECIES (for a chemical species), 
%        MSX_CONSTANT (for a reaction constant), 
%        MSX_PARAMETER (for a reaction parameter), 
%        MSX_PATTERN (for a time pattern); 
%
%  count: is the number of objects of that type defined in the MSX input file. 
%
% Returns: 
%  Returns an error code or 0 for no error.

global MSXDLLNAME;
%global MSX_CONSTANT

count=0;
code=int32(code);
[errcode,count] = calllib(MSXDLLNAME,'MSXgetcount',code,count);
if errcode MSXerror(errcode); end