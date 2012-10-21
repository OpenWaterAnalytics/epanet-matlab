function [errcode, index] = MSXgetindex(type,id)
% Declaration:
%  [errcode, index] = MSXgetindex(type,id)
%
% Description: 
%  Retrieves the internal index number of an MSX object given
%  its name.
% 
% Arguments: 
%
%  type is the type of object being sought and must be one of the
%  following pre-defined constants: 
%   MSX_SPECIES (for a chemical species),
%   MSX_CONSTANT (for a reaction constant), 
%   MSX_PARAMETER (for a reaction parameter), 
%   MSX_PATTERN (for a time pattern);
% 
%  id is a C-style character string containing the object’s ID name;
% 
%  index is the sequence number (starting from 1) of the object in the order
%  it was listed in the MSX input file. 
% 
% Returns: 
%  Returns an error code or 0 for no error.
%
% Notes: 
%  The new pattern has no time periods or multipliers assigned to it.
%  The MSXsetpattern function can be used to assign an array of multipliers to the pattern.

global MSXDLLNAME;
%global MSX_CONSTANT;

type=int32(type);
index = int32(0);
[errcode,id,index]=calllib(MSXDLLNAME,'MSXgetindex',type,id,index);
if errcode MSXerror(errcode); end