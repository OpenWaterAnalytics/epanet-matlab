function [errcode] = ENsetnodevalue(index, paramcode, value)
% Declaration:
% [errcode] = ENsetnodevalue(index, paramcode, value)
% 
% Description:
% Sets the value of a parameter for a specific node.
% 
% Arguments:
% index:		node index
% paramcode:		parameter code (see below)
% value:	parameter value
% 
% Returns:
% Returns an error code.
% 
% Notes:
% Node indexes are consecutive integers starting from 1.
% Node parameter codes consist of the following constants:
% 
% EN_ELEVATION	0	Elevation
% EN_BASEDEMAND	1	Baseline demand
% EN_PATTERN	2	Time pattern index
% EN_EMITTER	3	Emitter coefficient
% EN_INITQUAL	4	Initial quality
% EN_SOURCEQUAL	5	Source quality
% EN_SOURCEPAT	6	Source pattern
% EN_SOURCETYPE	7	Source type:(See note below)
% EN_TANKLEVEL	8	Initial water level in tank
% Source types are identified with the following constants:
% 
% EN_CONCEN	0
% EN_MASS	1
% EN_SETPOINT	2
% EN_FLOWPACED	3
% See [SOURCES] for a description of these source types.
% 
% Values are supplied in units which depend on the units used for flow rate in the EPANET input file (see Units of Measurement).
% 
% Version 2.00.07 (January 2001)

global ENDLLNAME;
%global EN_CONSTANT;
index=int32(index);
paramcode=int32(paramcode);
value=single(value);
[errcode]=calllib(ENDLLNAME,'ENsetnodevalue',index, paramcode, value);
if errcode ENerror(errcode); end
