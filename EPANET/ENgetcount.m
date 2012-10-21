function [errcode, count] = ENgetcount(countcode)
% Declaration:
% [errcode, count] = ENgetcount(countcode)
% 
% Description:
%  Retrieves the number of network components of a specified type.  
% 
%Arguments: 
%  countcode: component code (see below) 
%  count: number of countcode components in the network  
%
% Returns:
%  Returns an error code.
% 
%Notes:
%  Component codes consist of the following:  
%
%   EN_NODECOUNT    0   Nodes  
%   EN_TANKCOUNT    1   Reservoirs and tank nodes 
%   EN_LINKCOUNT    2   Links 
%   EN_PATCOUNT     3   Time patterns 
%   EN_CURVECOUNT   4   Curves 
%   EN_CONTROLCOUNT 5   Simple controls 
%
% The number of junctions in a network equals the number of nodes minus 
% the number of tanks and reservoirs.  
% 
% There is no facility within the Toolkit to add to or delete from the 
% components described in the Input file.   
%
%See Also:
% ENsetcontrol  
%
% Version 2.00.07 (August 2008)


global ENDLLNAME;
global EN_CONSTANT;

count=int32(0);
pcount=libpointer('int32Ptr',count);
countcode=int32(countcode);
[errcode]=calllib(ENDLLNAME,'ENgetcount',countcode,pcount);
if errcode ENerror(errcode); end

count=get(pcount,'Value');

