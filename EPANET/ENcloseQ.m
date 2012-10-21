function [errcode] = ENcloseQ()
% Declaration:
% [errcode] = ENcloseQ( )
%
% Description:
% Closes the water quality analysis system, freeing all allocated memory.
%
% Returns:
% Returns an error code.
%
% Notes:
% Call ENcloseQ after all water quality analyses have been made using the ENinitQ - ENrunQ - ENnextQ (or ENstepQ) sequence of function calls. Do not call this function if ENsolveQ is being used.
%
% See Also:
% ENopenQ, ENinitQ, ENrunQ, ENstepQ, ENnextQ
%
global ENDLLNAME;

[errcode]=calllib(ENDLLNAME,'ENcloseQ');
if errcode ENerror(errcode); end
