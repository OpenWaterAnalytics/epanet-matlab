function [errcode] = ENinitQ(saveflag)
% Declaration:
% [errcode] = ENinitQ( saveflag )
% 
% Description:
%  Initializes water quality and the simulation clock time prior to running
%  a water quality analysis.  
% 
%Arguments: 
% saveflag:  0-1 flag indicating if analysis results should be saved to EPANET's binary 
%            output file at uniform reporting periods. 
%
% Returns:
%  Returns an error code.
% 
%Notes:
% Call ENinitQ prior to running a water quality analysis using ENrunQ 
% in conjunction with either ENnextQ or ENstepQ.  
%
% ENopenQ must have been called prior to calling ENinitQ.  
%
% Do not call ENinitQ if a complete water quality analysis is being made with a call to ENsolveQ.  
%
% Set saveflag to 1 if you intend to use ENreport to generate a report or wish to save computed results to the binary output file.  
%
%See Also:
%  ENopenQ, ENrunQ, ENnextQ, ENstepQ, ENcloseQ   
%
% Version 2.00.07 (August 2008)
global ENDLLNAME;
saveflag=int32(saveflag);
[errcode]=calllib(ENDLLNAME,'ENinitQ',saveflag);
if errcode ENerror(errcode); end
