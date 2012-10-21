function [errcode, value] = MSXgetparameter(obj,index,param)
% Declaration:
%  [errcode, value] = MSXgetparameter(obj,index,param)
% 
% Description:
%  Retrieves the value of a particular reaction parameter for 
%  a given pipe or tank within the pipe network.
% 
% Arguments:
%  obj: is type of object being queried and must be either:
%   MSX_NODE (defined as 0) for a node
%   MSX_LINK (defined as 1) for a link;
% 
%  index: is the internal sequence number (starting from 1) 
%  assigned to the node or link;
% 
%  param: is the sequence number of the parameter (starting 
%  from 1 as listed in the MSX input file);
% 
%  value: is returned with the value assigned to the parameter 
%  for the node or link of interest.
% 
% Returns:
%  Returns an error code or 0 for no error.
%
% Notes: 
%  Reaction parameters are only defined for storage tank nodes and
%  pipe links. All other types of nodes and links have parameter values of 0.

global MSXDLLNAME;

obj=int32(obj);
index=int32(index);
param=int32(param);
value=0;
[errcode,value]=calllib(MSXDLLNAME,'MSXgetparameter',obj,index,param,value);
if errcode MSXerror(errcode); end
