function [errcode,id] = ENgetlinkid(index)
% Declaration:
% [errcode,id] = ENgetlinkid(index)
%
% Description:
% Retrieves the ID label of a link with a specified index.
% 
% Arguments:
% index:	link index
% id:	ID label of link
%
% Returns:
% Returns an error code. 
% 
% Notes:
% The ID label string should be sized to hold at least 15 characters.
% Node indexes are consecutive integers starting from 1.
% 
% See Also:  
% ENgetlinkindex
% 
% Version 2.00.07 (January 2001)

global ENDLLNAME;
%global EN_CONSTANT;
id=char(32*ones(1,17));
index=int32(index);
[errcode,id]=calllib(ENDLLNAME,'ENgetlinkid',index,id);
if errcode ENerror(errcode); end
%id=get(pid,'Value');
