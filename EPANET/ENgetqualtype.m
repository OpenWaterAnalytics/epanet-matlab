function [errcode,qualcode,tracenode] = ENgetqualtype()
% Declaration:
% [errcode,qualcode,tracenode] = ENgetqualtype( )
% 
% Description:
% Retrieves the type of water quality analysis called for.
% 
% Arguments:
% qualcode:	water quality analysis code (see below)
% tracenode:	index of node traced in a source tracing analysis
% 
% Returns:
% Returns an error code.
% 
% Notes:
% Water quality analysis codes are as follows:
% 
% EN_NONE	0	No quality analysis
% EN_CHEM	1	Chemical analysis
% EN_AGE	2	Water age analysis
% EN_TRACE	3	Source tracing
% EN_MULTIS   4   Multiple Species
% The tracenode value will be 0 when qualcode is not EN_TRACE.
% 
% See Also: 
% ENsetqualtype
% 
% Version 2.00.07 (January 2001)

global ENDLLNAME;
%global EN_CONSTANT;
qualcode=int32(0);
tracenode=int32(0);
%pcode=libpointer('int32Ptr',qualcode);
%pnode=libpointer('int32Ptr',tracenode);
[errcode,qualcode,tracenode]=calllib(ENDLLNAME,'ENgetqualtype',qualcode,tracenode);
if errcode ENerror(errcode); end
%qualcode=get(pcode,'Value');
%tracenode=get(pnode,'Value');
