function [errcode] = MSXsetconstant(index, value)
% Declaration:
%  [errcode] =  MSXsetconstant(index, value);
% 
% Description:
%  Assigns a new value to a specific reaction constant.
% 
% Arguments:
%  index is the sequence number of the reaction constant (starting from 1)
%  as it appeared in the MSX input file;
% 
%  value is the new value to be assigned to the constant.
% 
% Returns:
%  Returns an error code or 0 for no error.

global MSXDLLNAME;

index=int32(index);
value=double(value);
[errcode]=calllib(MSXDLLNAME,'MSXsetconstant',index,value);
if errcode MSXerror(errcode); end
