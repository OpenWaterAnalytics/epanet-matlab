function [errcode] = ENclose()
% Declaration:
% [errcode]=ENclose()
%
% Description:
% Closes down the Toolkit system (including all files being processed).
%
% Returns:
% Returns an error code.
%
% Notes:
% ENclose must be called when all processing has been completed,
% even if an error condition was encountered.
%
% See Also:
% ENopen
%
global ENDLLNAME;


[errcode]=calllib(ENDLLNAME,'ENclose');
if errcode ENerror(errcode); end

