function [errcode] = MSXsetparameter(type, index, param, value)
% Declaration:
%  [errcode] = MSXsetparameter(type, index, param, value)
% 
% Description:
%  Assigns a value to a particular reaction parameter for a given pipe or
%  tank within the pipe network.
% 
% Arguments:
%  type: is type of object being queried and must be either:
%   MSX_NODE (defined as 0) for a node
%   MSX_LINK (defined as 1) for a link;
% 
%  index: is the internal sequence number (starting from 1) assigned to the
%  node or link;
% 
%  param: is the sequence number of the parameter (starting from 1 as listed
%  in the MSX input file);
% 
%  value: is the value to be assigned to the parameter for the node or link
%  of interest.
% 
% Returns: 
%  Returns an error code or 0 for no error.
% 
% Notes: 
%  Reaction parameters are only defined for storage tank nodes and
%  pipe links. Attempts to set parameter values for other types of nodes and
%  links will be ignored.

global MSXDLLNAME;
%global MSX_CONSTANT;

type=int32(type);
index=int32(index);
param=int32(param);
value=double(value);
[errcode]=calllib(MSXDLLNAME,'MSXsetparameter',type,index,param,value);
if errcode MSXerror(errcode); end
