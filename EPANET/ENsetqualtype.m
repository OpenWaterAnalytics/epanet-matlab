function [errcode] = ENsetqualtype(qualcode,chemname,chemunits,tracenode)
% Declaration:
% [errcode] = ENsetqualtype(qualcode,chemname,chemunits,tracenode)
%
% Description:
% Sets the type of water quality analysis called for.
% 
% Arguments:
% qualcode:	water quality analysis code (see below)	
% chemname:	name of the chemical being analyzed
% chemunits:	units that the chemical is measured in
% tracenode:	ID of node traced in a source tracing analysis
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
% Chemical name and units can be an empty string if the analysis is not for a chemical. The same holds for the trace node if the analysis is not for source tracing.
% 
% Note that the trace node is specified by ID and not by index.
% 
% See Also:
% ENgetqualtype
% 
% Version 2.00.07 (January 2001)

global ENDLLNAME;
%global EN_CONSTANT;

qualcode=int32(qualcode);
[errcode]=calllib(ENDLLNAME,'ENsetqualtype',qualcode,chemname,chemunits,tracenode);
if errcode ENerror(errcode); end
