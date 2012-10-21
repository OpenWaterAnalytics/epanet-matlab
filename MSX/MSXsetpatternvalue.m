function [errcode] = MSXsetpatternvalue(pat, period, value)
% Declaration:
%  [errcode] = MSXsetpatternvalue(pat, period, value);
% 
% Description:
%  Assigns a new value to the multiplier for a specific time period in a
%  given MSX source time pattern.
% 
% Arguments:
%  pat is the internal sequence number (starting from 1) of the pattern as
%  it appears in the MSX input file;
%  period is the time period (starting from 1) in the pattern to be
%  replaced;
%  value is the new multiplier value to use for that time period.
% 
% Returns:
%  Returns an error code or 0 for no error.
% 
% Notes:
%  This function only applies to source time patterns that appear in the MSX
%  input file. There is a comparable EPANET toolkit function,
%  ENsetpatternvalue, which can be used for the demand patterns defined in
%  the EPANET input file.
 

global MSXDLLNAME;

pat=int32(pat);
period=int32(period);
value=double(value);
[errcode]=calllib(MSXDLLNAME,'MSXsetpatternvalue',pat,period,value);
if errcode MSXerror(errcode); end
