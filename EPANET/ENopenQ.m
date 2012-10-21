function [errcode] = ENopenQ()
% Declaration:
% [errcode] = ENopenQ( void )
% 
% Description:
%  Opens the water quality analysis system.   
% 
%Arguments: 
% 
% Returns:
%  Returns an error code.
% 
%Notes:
%  Call ENopenQ prior to running the first water quality analysis using an
%  ENinitQ - ENrunQ - ENnextQ (or ENstepQ) sequence. Multiple water quality 
%  analyses can be made before calling ENcloseQ to close the water quality analysis system.  
%
%  Do not call this function if a complete water quality analysis is being made using ENsolveQ.  
% 
%See Also:
%  ENintQ, ENrunQ, ENnextQ, ENstepQ, ENcloseQ  
%
% Version 2.00.07 (August 2008)

global ENDLLNAME;
[errcode]=calllib(ENDLLNAME,'ENopenQ');
if errcode ENerror(errcode); end
