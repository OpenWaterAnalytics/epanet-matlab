function [errcode, patlen] = MSXgetpatternlen(patindex)
% Declaration:
%  [errcode, patlen] = MSXgetpatternlen(patindex);
% 
% Description:
%  Retrieves the number of time periods within a source time pattern.
% 
% Arguments:
%  (patindex) is the internal sequence number (starting from 1) of the pattern as
%  it appears in the MSX input file;
% 
%  patlen is returned with the number of time periods (and therefore number of
%  multipliers) that appear in the pattern.
% 
% Returns:
%  Returns an error code or 0 for no error.
% 
% Notes:
%  This function only applies to source time patterns that appear in the MSX
%  input file. There is a comparable EPANET toolkit function,
%  ENgetpatternlen, which can be used for the demand patterns defined in the
%  EPANET input file.
% 

global MSXDLLNAME;

patlen=int32(0);
patindex=int32(patindex);
[errcode,patlen]=calllib(MSXDLLNAME,'MSXgetpatternlen',patindex,patlen);
if errcode MSXerror(errcode); end