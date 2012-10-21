function [errcode, value] = ENgetpatternvalue(index, period)
% Declaration:
% [errcode,value] = ENgetpatternvalue(index, period)
% 
% Description:
%  Retrieves the multiplier factor for a specific time period in a time pattern.   
% 
%Arguments: 
% index: time pattern index 
% period: period within time pattern 
% value: multiplier factor for the period 
%
% Returns:
%  Returns an error code.
% 
%Notes:
% Pattern indexes and periods are consecutive integers starting from 1.
%
%See Also:
% ENgetpatternindex, ENgetpatternlen, ENsetpatternvalue  

%
% Version 2.00.07 (August 2001)
global ENDLLNAME;

value=single(0);
p=libpointer('singlePtr',value);
index=int32(index);
period=int32(period);
[errcode]=calllib(ENDLLNAME,'ENgetpatternvalue',index, period, p);
if errcode ENerror(errcode); end
value=get(p,'Value');
