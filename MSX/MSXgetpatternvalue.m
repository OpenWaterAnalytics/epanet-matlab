function [errcode, value] = MSXgetpatternvalue(patindex,period)
% Declaration:
%  [errcode, value] = MSXgetpatternvalue(patindex,period);
% 
% Description:
%  Retrieves the multiplier at a specific time period for a given source
%  time pattern.
% 
% Arguments:
%  patindex is the internal sequence number (starting from 1) of the pattern as
%  it appears in the MSX input file;
% 
%  period is the index of the time period (starting from 1) whose multiplier
%  is being sought;
% 
%  value is returned with the value of the pattern’s multiplier in the
%  desired period.
% 
% Returns:
%  Returns an error code or 0 for no error.
% 
% Notes:
%  This function only applies to source time patterns that appear in the MSX
%  input file. There is a comparable EPANET toolkit function,
%  Engetpatternvalue, which can be used for the demand patterns defined in
%  the EPANET input file.


global MSXDLLNAME;

value=0;
patindex=int32(patindex);
period=int32(period);
[errcode,value]=calllib(MSXDLLNAME,'MSXgetpatternvalue',patindex,period,value);
if errcode MSXerror(errcode); end
