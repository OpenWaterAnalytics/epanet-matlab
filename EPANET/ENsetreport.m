function [errcode] = ENsetreport(command)
% Declaration:
% [errcode] = ENsetreport(command)
% 
% Description:
%  Issues a report formatting command. Formatting commands 
%  are the same as used in the [REPORT] section of the EPANET Input file.   
% 
%Arguments: 
% command: text of a report formatting command. 
%
% Returns:
%  Returns an error code.
% 
%Notes:
%  Call ENresetreport to clear any previous report formatting commands
%  that either appeared in the Input file or were issued with calls 
%  to ENsetreport or ENsetstatusreport.  
%
%  Formatted results of a simulation can be written to the Report 
%  file using the ENreport function.   
% 
%See Also:
% ENreport, ENresetreport, ENsetstatusreport  
%
% Version 2.00.07 (August 2008)
global ENDLLNAME;

[errcode]=calllib(ENDLLNAME,'ENsetreport',command);
if errcode ENerror(errcode); end