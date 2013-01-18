function [errcode, value] = ENgetnodevalue(index, paramcode)
% Declaration:
% [errcode, value] = ENgetnodevalue( int index, int paramcode )
% 
% Description:
% Retrieves the value of a specific link parameter.
% 
% Arguments:
% index:  node index
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
%
% The following parameter codes apply only to storage tank nodes:  
% EN_INITVOLUME  14  Initial water volume 
% EN_MIXMODEL  15  Mixing model code (see below) 
% EN_MIXZONEVOL  16  Inlet/Outlet zone volume in a 2-compartment tank 
% EN_TANKDIAM  17 Tank diameter 
% EN_MINVOLUME  18  Minimum water volume 
% EN_VOLCURVE  19  Index of volume versus depth curve (0 if none assigned) 
% EN_MINLEVEL  20  Minimum water level 
% EN_MAXLEVEL  21  Maximum water level 
% EN_MIXFRACTION  22  Fraction of total volume occupied by the inlet/outlet zone in a 2-compartment tank 
% EN_TANK_KBULK  23  Bulk reaction rate coefficient 
%
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
% The codes for the various tank mixing model choices are as follows:  
%  
% EN_MIX1  0  Single compartment, complete mix model 
% EN_MIX2 1 Two-compartment, complete mix model 
% EN_FIFO  2  Plug flow, first in, first out model 
% EN_LIFO  3  Stacked plug flow, last in, first out model 
%
% Values are returned in units which depend on the units used for flow rate in the EPANET input file (see Units of Measurement).
% 
% Version 2.00.12 (March 2008)

global ENDLLNAME;
value=single(0);
%p=libpointer('singlePtr',value);
index=int32(index);
paramcode=int32(paramcode);
[errcode, value]=calllib(ENDLLNAME,'ENgetnodevalue',index, paramcode, value);
if errcode ENerror(errcode); end
%value=get(p,'Value');
