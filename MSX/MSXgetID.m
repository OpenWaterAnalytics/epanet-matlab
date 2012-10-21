function [errcode, id] = MSXgetID(type,index,len)
% Declaration:
%  [errcode, id] = MSXgetID(type,index,len)
% 
% Description:
%  Retrieves the ID name of an object given its internal index number.
% 
% Arguments:
%  type is the type of object being sought and must be one of the following pre-defined constants:
%   MSX_SPECIES (for a chemical species),
%   MSX_CONSTANT (for a reaction constant),
%   MSX_PARAMETER (for a reaction parameter),
%   MSX_PATTERN (for a time pattern);
% 
%  index is the sequence number of the object (starting from 1 as listed in
%  the MSX input file);
% 
%  id is a C-style character string that is returned with the object’s ID
%  name.
% 
%  len is the maximum number of characters that id can hold, not counting
%  the null termination character...
% 
% Returns: 
%  Returns an error code or 0 for no error.
% 
% Notes: 
%  The MSXgetIDlen function can determine the number of characters in
%  an object’s ID name so that the character array id can be properly sized
%  (to len + 1).


global MSXDLLNAME;

type=int32(type);
index=int32(index);
len=int32(len);
id=char(32*ones(1,len+1));
[errcode,id]=calllib(MSXDLLNAME,'MSXgetID',type,index,id,len);
id=id(1:len);
if errcode MSXerror(errcode); end
