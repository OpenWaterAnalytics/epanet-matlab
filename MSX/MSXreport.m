function [errcode] = MSXreport()
% Declaration:
%  [errcode] = MSXreport(void)
%
% Description: 
%  Writes water quality simulations results as instructed by the MSX input file to a text file. 
%
% Arguments: 
%  
% Notes:
%  Results are written to the EPANET report file unless a specific
%  water quality report file is named in the [REPORT] section of
%  the MSX input file.
%

global MSXDLLNAME;

[errcode] = calllib(MSXDLLNAME,'MSXreport');
if errcode MSXerror(errcode); end
