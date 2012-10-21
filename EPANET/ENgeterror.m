function [e, errmsg] = ENgeterror(errcode)    
% Declaration:
% [errcode, errmsg] =  ENgeterror( int errcode)
% 
% Description:
% Retrieves the text of the message associated with a particular error or warning code.
% 
% Arguments:
% errcode:	error or warning code
% errmsg:	text of the error or warning message for errcode
% 
% Returns:
% Returns an error code.
% 
% Version 2.00.07 (January 2001)
global ENDLLNAME;
global EN_CONSTANT;
errmsg = char(32*ones(1,80));
len=int32(80);
errcode=int32(errcode);
[e,errmsg] = calllib(ENDLLNAME,'ENgeterror',errcode,errmsg,len);
if e ENerror(e); end
