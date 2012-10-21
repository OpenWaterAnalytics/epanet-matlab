function [errcode,index] = ENgetlinkindex(id)
% Declaration:
% [errcode,index] = ENgetlinkindex( id )
% 
% Description:
%  Retrieves the index of a link with a specified ID.   
% 
%Arguments: 
% id: link ID label 
% index: link index 
%
% Returns:
%  Returns an error code.
% 
%Notes:
%  Link indexes are consecutive integers starting from 1.  
% 
%See Also:
% ENgetlinkid  
%
% Version 2.00.07 (August 2001)
global ENDLLNAME;
%global EN_CONSTANT;
index=int32(0);
%pidx=libpointer('int32Ptr',index);
[errcode,id,index]=calllib(ENDLLNAME,'ENgetlinkindex',id,index);
if errcode ENerror(errcode); end
%index=get(pidx,'Value');
