function [errcode] = ENsetstatusreport(statuslevel)
% Declaration:
% [errcode] = ENsetstatusreport(statuslevel)
% 
% Description:
%  Sets the level of hydraulic status reporting.    
% 
%Arguments: 
% statuslevel: level of status reporting (see below). 
%
% Returns:
%  Returns an error code.
% 
%Notes:
% Status reporting writes changes in the hydraulics status
% of network elements to the Report file as a hydraulic 
% simulation unfolds. There are three levels of reporting:  
%
%   0 - no status reporting  
%   1 - normal reporting  
%   2 - full status reporting  
%
% The full status report contains information on the convergence
% of each trial of the solution to the system hydraulic equations 
% at each time step of a simulation. It is useful mainly for debugging purposes.  
%
% If many hydraulic analyses will be run in the application it is 
% recommended that status reporting be turned off (statuslevel = 0).   
%
%See Also:
%
% Version 2.00.07 (August 2008)

global ENDLLNAME;
statuslevel=int32(statuslevel);
[errcode]=calllib(ENDLLNAME,'ENsetstatusreport',statuslevel);
if errcode ENerror(errcode); end



