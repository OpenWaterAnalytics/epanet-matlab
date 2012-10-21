function [errcode] = ENsaveH()
% Declaration:
% [errcode] = ENsaveH( void )
% 
% Description:
%  Transfers results of a hydraulic simulation from the binary Hydraulics 
%  file to the binary Output file, where results are only reported at 
%  uniform reporting intervals. 
% 
% Returns:
%  Returns an error code.
% 
% Notes:
%  ENsaveH is used when only a hydraulic analysis is run and results at 
%  uniform reporting intervals need to be transferred to EPANET's binary 
%  output file. Such would be the case when an output report to EPANET's 
%  report file will be written using ENreport.  
%
%  The reporting times can be set either in the EPANET input file 
%  (in its [TIMES] section) or by using the ENsettimeparam function. 
%
% See Also: 
%  ENreport, ENsettimeparam
% 
% Version 2.00.07 (August 2008)

global ENDLLNAME;

[errcode]=calllib(ENDLLNAME,'ENsaveH');
if errcode ENerror(errcode); end