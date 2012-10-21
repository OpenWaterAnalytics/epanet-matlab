function [errcode, len] = MSXgetIDlen(type,index)
% Declaration:
%  [errcode, len] = MSXgetIDlen(type,index)
% 
% Description:
%  Retrieves the number of characters in the ID name of an MSX object 
%  given its internal index number.
% 
% Arguments:
%  type is the type of object being sought and must be one of the 
%  following pre-defined constants:
%   MSX_SPECIES (for a chemical species),
%   MSX_CONSTANT (for a reaction constant),
%   MSX_PARAMETER (for a reaction parameter),
%   MSX_PATTERN (for a time pattern);
% 
%  index is the sequence number of the object (starting from 1 as listed 
%  in the MSX input file);
% 
%  len is returned with the number of characters in the object’s ID name, 
%  not counting the null termination character.
% 
% Returns:
%  Returns an error code or 0 for no error.

global MSXDLLNAME;
%global MSX_CONSTANT;

len = int32(0);
type=int32(type);
index=int32(index);
[errcode,len]=calllib(MSXDLLNAME,'MSXgetIDlen',type,index,len);
if errcode MSXerror(errcode); end
