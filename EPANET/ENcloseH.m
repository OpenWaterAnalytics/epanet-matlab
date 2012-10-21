function [errcode] = ENcloseH()
% Declaration:
% [errcode] = ENcloseH()
%
% Description:
% Closes the hydraulic analysis system, freeing all allocated memory.
%
% Returns:
% Returns an error code.
%
% Notes:
% Call ENcloseH after all hydraulics analyses have been made using
% ENinitH - ENrunH - ENnextH. Do not call this function if ENsolveH is being used.
%
% See Also:
% ENopenH, ENinitH, ENrunH, ENnextH
%
global ENDLLNAME;

[errcode]=calllib(ENDLLNAME,'ENcloseH');
if errcode ENerror(errcode); end
