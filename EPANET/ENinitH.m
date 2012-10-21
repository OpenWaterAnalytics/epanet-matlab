function [errcode] = ENinitH(flag)
% Declaration:
% [errcode] = ENinitH( flag )
% 
% Description:
%  Initializes storage tank levels, link status and settings, 
%  and the simulation clock time prior to running a hydraulic analysis. 
% 
%Arguments: 
%  saveflag:  0-1 flag indicating if hydraulic results 
%             will be saved to the hydraulics file. 
%
% Returns:
%  Returns an error code.
% 
%Notes:
% Call ENinitH prior to running a hydraulic analysis using ENrunH and ENnextH.  
%
% ENopenH must have been called prior to calling ENinitH.  
%
% Do not call ENinitH if a complete hydraulic analysis is being made with a call to ENsolveH.  
%
% Set saveflag to 1 if you will be making a subsequent water quality run, 
% using ENreport to generate a report, or using ENsavehydfile to save the binary hydraulics file.  
%
%See Also:
% ENopenH, ENrunH, ENnextH, ENcloseH  
%
% Version 2.00.07 (August 2008)

global ENDLLNAME;
flag=int32(flag);
[errcode]=calllib(ENDLLNAME,'ENinitH',flag);
if errcode ENerror(errcode); end
