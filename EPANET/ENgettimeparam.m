function [errcode, timevalue] = ENgettimeparam(paramcode)
% Declaration:
% [errcode,timevalue] = ENgettimeparam( paramcode )
% 
% Description:
% Retrieves the value of a specific analysis time parameter.
% 
% Arguments:
% paramcode:	time parameter code (see below)
% timevalue:	value of time parameter in seconds
% 
% Returns:
% Returns an error code.
% 
% Notes:
% Time parameter codes consist of the following constants:
% 
% EN_DURATION	0	Simulation duration
% EN_HYDSTEP	1	Hydraulic time step
% EN_QUALSTEP	2	Water quality time step
% EN_PATTERNSTEP	3	Time pattern time step
% EN_PATTERNSTART	4	Time pattern start time
% EN_REPORTSTEP	5	Reporting time step
% EN_REPORTSTART	6	Report starting time
% EN_RULESTEP	7	Time step for evaluating rule-based controls
% EN_STATISTIC	8	Type of time series post-processing used:0 = none1 = averaged2 = minimums3 = maximums4 = ranges
% EN_PERIODS	9	Number of reporting periods saved to binary output file
% 
% Version 2.00.07 (January 2001)

global ENDLLNAME;
%global EN_CONSTANT;
timevalue=int32(0);
%p=libpointer('int32Ptr',timevalue);
paramcode=int32(paramcode);
[errcode,timevalue]=calllib(ENDLLNAME,'ENgettimeparam',paramcode,timevalue);
if errcode ENerror(errcode); end
%timevalue=get(p,'Value');
