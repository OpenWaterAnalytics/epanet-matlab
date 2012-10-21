function [errcode] = ENsetpatternvalue(index, period, value)
% Declaration:
% [errcode] = ENsetpatternvalue(index, period, value)
% 
% Description:
%  Sets the multiplier factor for a specific period within a time pattern.
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
% Pattern indexes are consecutive integers starting from 1.  
% 
% Use ENsetpattern to reset all of the factors in a time pattern.  
%
%See Also:
% ENgetpatternindex, ENgetpatternlen, ENgetpatternvalue, ENsetpattern  
%
% Version 2.00.07 (August 2008)

global ENDLLNAME;
index=int32(index);
period=int32(period);
value=single(value);
[errcode]=calllib(ENDLLNAME,'ENsetpatternvalue',index, period, value);
if errcode ENerror(errcode); end
