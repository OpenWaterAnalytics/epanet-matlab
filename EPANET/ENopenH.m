function [errcode] = ENopenH()
% Declaration:
% [errcode] = ENopenH( void )
% 
% Description:
%  Opens the hydraulics analysis system.   
% 
%Arguments: 
% 
% Returns:
%  Returns an error code.
% 
%Notes:
%  Call ENopenH prior to running the first hydraulic analysis using the 
% ENinitH - ENrunH - ENnextH sequence. Multiple analyses can be made before 
% calling ENcloseH to close the hydraulic analysis system.  
%
% Do not call this function if ENsolveH is being used to run a complete hydraulic analysis.  
%
%See Also:
% ENinitH, ENrunH, ENnextH, ENcloseH  
%
% Version 2.00.07 (August 2008)

global ENDLLNAME;
[errcode]=calllib(ENDLLNAME,'ENopenH');
if errcode ENerror(errcode); end
