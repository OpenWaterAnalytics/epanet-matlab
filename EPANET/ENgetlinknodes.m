function [errcode,from,to] = ENgetlinknodes(index)
% Declaration:
% [from,to,errcode] = ENusehydfile(index)
% 
% Description:
%  Retrieves the indexes of the end nodes of a specified link.  
% 
%Arguments: 
%  index: link index 
%  fromnode: index of node at start of link 
%  tonode: index of node at end of link 
%
% Returns:
%  Returns an error code.
% 
%Notes:
% Node and link indexes are consecutive integers starting from 1.  
%
% The From and To nodes are as defined for the link in the EPANET input file. 
% The actual direction of flow in the link is not considered.  
% 
%See Also:
% ENgetlinkindex  
%
% Version 2.00.07 (August 2008)

global ENDLLNAME;
%global EN_CONSTANT;
%global EN_SIZE;

from=int32(0);
to=int32(0);
index=int32(index);
%p1=libpointer('int32Ptr',from);
%p2=libpointer('int32Ptr',to);
[errcode,from,to]=calllib(ENDLLNAME,'ENgetlinknodes',index,from,to);
if errcode ENerror(errcode); end
%from=get(p1,'Value');
%to=get(p2,'Value');
