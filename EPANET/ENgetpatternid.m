function [errcode, id] = ENgetpatternid(index)
% Declaration:
% [errcode, id] = ENgetpatternid(index)
% 
% Description:
%  Retrieves the ID label of a particular time pattern.   
% 
%Arguments:  
%  index: pattern index 
%  id: ID label of pattern 
% 
% Returns:
%  Returns an error code.
% 
%Notes:
%   The ID label string should be sized to hold at least 32 characters.  
%
%   Pattern indexes are consecutive integers starting from 1.  
% 
%
%See Also:
%
% Version 2.00.07 (August 2008)

global ENDLLNAME;

%length of id name can be maximum MAXID = 31 
id=char(32*ones(1,31));
index=int32(index);
[errcode,id]=calllib(ENDLLNAME,'ENgetpatternid',index,id);
if errcode ENerror(errcode); end
