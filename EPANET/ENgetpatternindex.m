function [errcode, index] = ENgetpatternindex(id)
% Declaration:
% [errcode,index] = ENusehydfile( id )
% 
% Description:
%  Retrieves the index of a particular time pattern.   
% 
%Arguments: 
%  id: pattern ID label 
%  index: pattern index  
%
% Returns:
%  Returns an error code.
% 
%Notes:
%  Pattern indexes are consecutive integers starting from 1.  
% 
%See Also:
%
% Version 2.00.07 (August 2008)


global ENDLLNAME;
%global EN_CONSTANT;
index=int32(0);
%pidx=libpointer('int32Ptr',index);
%id = cstring(id);
[errcode,id, index]=calllib(ENDLLNAME,'ENgetpatternindex',id,index);
if errcode ENerror(errcode); end
%index=get(pidx,'Value');