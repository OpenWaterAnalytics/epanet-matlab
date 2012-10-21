function [errcode, value] = MSXgetconstant(index)
% Declaration:
%  [errcode, value] = MSXgetconstant(index)
% 
% Description:
%  Retrieves the value of a particular reaction constant.
% 
% Arguments:
%  index is the sequence number of the reaction constant 
%  (starting from 1) as it appeared in the MSX input file;
% 
%  value is returned with the value assigned to the constant.
% 
% Returns:
%  Returns an error code or 0 for no error.
% 

global MSXDLLNAME;

index=int32(index);
value=0;
[errcode,value]=calllib(MSXDLLNAME,'MSXgetconstant',index,value);
if errcode MSXerror(errcode); end
