function [errcode] = ENsettimeparam(paramcode, timevalue)
% Declaration:
% [errcode] = ENsettimeparam(paramcode, timevalue)
%
% Description:
% Sets the value of a time parameter.
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
% EN_STATISTIC	8	Type of time series post-processing to use:EN_NONE (0) = noneEN_AVERAGE (1) = averagedEN_MINIMUM (2) = minimumsEN_MAXIMUM (3) = maximumsEN_RANGE (4) = ranges
% Do not change time parameters after calling ENinitH in a hydraulic analysis or ENinitQ in a water quality analysis.
% 
% Version 2.00.07 (January 2001)

global ENDLLNAME;
%global EN_CONSTANT;
paramcode=int32(paramcode);
timevalue=int32(timevalue);
[errcode]=calllib(ENDLLNAME,'ENsettimeparam',paramcode,timevalue);
if errcode ENerror(errcode); end
