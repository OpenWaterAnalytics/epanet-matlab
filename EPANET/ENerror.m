function [e] = ENerror(errcode)    
% Declaration:
%  [e]=ENerror(errcode)
%
% Description:
%  Prints out the error message string associated with error number errcode
%
% Returns:
%  Returns an error code.
%
% See Also:
%  ENgeterror


global ENDLLNAME;

errstring=char(32*ones(1,80));
errcode=int32(errcode);
len=int32(80);
[e,errstring] = calllib(ENDLLNAME,'ENgeterror',errcode,errstring,len);
%errstring=get(ps,'Value');
disp(errstring);
%if errcode>=100 error('Fatal EPANET Error'); end
