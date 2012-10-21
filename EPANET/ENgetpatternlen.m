function [errcode, len] = ENgetpatternlen(index)
% Declaration:
% [errcode, len] = ENgetpatternlen(index)
% 
% Description:
% Retrieves the number of time periods in a specific time pattern.
% 
% Arguments:
% index:	pattern index
% len:	number of time periods in the pattern
% 
% Returns:
% Returns an error code.
% 
% Notes:
% Pattern indexes are consecutive integers starting from 1.
% 
% Version 2.00.07 (January 2001)

global ENDLLNAME;
index=int32(index);
len=int32(0);
%p=libpointer('int32Ptr',len);
[errcode,len]=calllib(ENDLLNAME,'ENgetpatternlen',index,len);
if errcode ENerror(errcode); end
%len=get(p,'Value');
