function [errcode] = ENsolveH()
% Declaration:
% [errcode] = ENsolveH( void )
% 
% Description:
% Runs a complete hydraulic simulation with results for all time periods written to the binary Hydraulics file. 
% 
% Returns:
% Returns an error code.
% 
% Notes:
% Use ENsolveH to generate a complete hydraulic solution which can stand alone or be 
% used as input to a water quality analysis. It can also be followed by calls to 
% ENsaveH and ENreport to write a report on hydraulic results to the report file. 
% Do not use ENopenH, ENinitH, ENrunH, ENnextH, and ENcloseH in conjunction with ENsolveH.
% 
% Example:
% 
% ENopen("net1.inp", "net1.rpt", "");
% ENsolveH();
% ENsolveQ();
% ENreport();
% ENclose();
% 
% Version 2.00.07 (January 2001)

global ENDLLNAME;
[errcode]=calllib(ENDLLNAME,'ENsolveH');
if errcode ENerror(errcode); end
