function [errcode, value] = ENgetnodevalue(index, paramcode)
% Declaration:
% [errcode, value] = ENgetnodevalue( int index, int paramcode )
% 
% Description:
% Retrieves the value of a specific link parameter.
% 
% Arguments:
% index:	node index
% paramcode:	parameter code (see below)
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
% EN_BASEDEMAND	1	Base demand
% EN_PATTERN	2	Demand pattern index
% EN_EMITTER	3	Emitter coeff.
% EN_INITQUAL	4	Initial quality
% EN_SOURCEQUAL	5	Source quality
% EN_SOURCEPAT	6	Source pattern index
% EN_SOURCETYPE	7	Source type(See note below)
% EN_TANKLEVEL	8	Initial water level in tank
% EN_DEMAND     9	Actual demand
% EN_HEAD       10	Hydraulic head
% EN_PRESSURE	11	Pressure
% EN_QUALITY	12	Actual quality
% EN_SOURCEMASS	13	Mass flow rate per minute of a chemical source 
% Parameters 9 - 13 (EN_DEMAND through EN_SOURCEMASS) are computed values. The others are input design parameters.
% 
% Source types are identified with the following constants:
% 
% EN_CONCEN	0
% EN_MASS	1
% EN_SETPOINT	2
% EN_FLOWPACED	3
% See [SOURCES] for a description of these source types.
% 
% Values are returned in units which depend on the units used for flow rate in the EPANET input file (see Units of Measurement).
% 
% Version 2.00.07 (January 2001)

global ENDLLNAME;
value=single(0);
%p=libpointer('singlePtr',value);
index=int32(index);
paramcode=int32(paramcode);
[errcode, value]=calllib(ENDLLNAME,'ENgetnodevalue',index, paramcode, value);
if errcode ENerror(errcode); end
%value=get(p,'Value');
