function [errcode] = ENsolveQ()
% Declaration:
% [errcode] = ENsolveQ (void)
% 
% Description:
%  Runs a complete water quality simulation with results at uniform 
%  reporting intervals written to EPANET's binary Output file.   
% 
%Arguments: 
% fname: name of the file containing hydraulic analysis results for the current network. 

% Returns:
%  Returns an error code.
% 
%Notes:
% A hydraulic analysis must have been run and saved to the binary
% hydraulics file before calling ENsolveQ. It can be followed by 
% a call to ENreport to write a report on hydraulic and water quality 
% results to the report file. 
%
% Do not use ENopenQ, ENinitQ, ENrunQ, ENnextQ, and ENcloseQ in conjunction with ENsolveQ. 
%
%Example: 
% ENopen("net1.inp", "net1.rpt", ""); 
% ENsolveH();   
% ENsolveQ();  
% ENreport();  
% ENclose();   
%
%See Also:
% 
%
% Version 2.00.07 (August 2008)
global ENDLLNAME;

[errcode]=calllib(ENDLLNAME,'ENsolveQ');
if errcode ENerror(errcode); end


