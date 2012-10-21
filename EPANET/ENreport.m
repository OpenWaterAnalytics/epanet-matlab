function [errcode] = ENreport ()
% Declaration:
% [errcode] = ENreport  (void)
% 
% Description:
%  Writes a formatted text report on simulation results to the Report file.    
% 
%Arguments: 
% 
% Returns:
%  Returns an error code.
% 
%Notes:
%  Either a full hydraulic analysis or full hydraulic and water quality 
%  analysis must have been run, with results saved to file, before ENreport
%  is called. In the former case, ENsaveH must also be called first to transfer 
%  results from the Hydraulics file to the Output file.  
%
%  The format of the report is controlled by commands placed in 
%  the [REPORT] section of the EPANET input file or by similar 
%  commands issued with the ENsetreport function.   
%  
%
%See Also:
% 
%
% Version 2.00.07 (August 2008)

global ENDLLNAME;

[errcode]=calllib(ENDLLNAME,'ENreport');
if errcode ENerror(errcode); end
