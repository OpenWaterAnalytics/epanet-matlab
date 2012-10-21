function [e] = MSXerror(errcode)    
% Declaration:
%  [e]=MSXerror(errcode);
%
% Description:
%  Prints out the error message string associated with error number errcode
%
% Arguments:
%  errcode: errorcode to which message will be displayed
%
% Returns:
%  Returns an error code or 0 for no error.
%
% See Also:
%  MSXgeterror
%
global MSXDLLNAME;

e=int32(0);
errcode=int32(errcode);
len=int32(80);
errstring=char(32*ones(1,len+1));
[e,errstring] = calllib(MSXDLLNAME,'MSXgeterror',errcode,errstring,len);
disp(errstring);
