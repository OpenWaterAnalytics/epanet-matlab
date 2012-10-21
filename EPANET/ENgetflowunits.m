function [errcode,unitscode] = ENgetflowunits()
% Declaration:
% [unitscode,errcode] = ENgetflowunits()
% 
% Description:
% Retrieves a code number indicating the units used to express all flow rates.
% 
% Arguments:
% unitscode:	value of a flow units code number (see below).
% 
% Returns:
% Returns an error code.
% 
% Notes:
% Flow units codes are as follows:
% 
% 0	= EN_CFS	cubic feet per second
% 1	= EN_GPM	gallons per minute
% 2	= EN_MGD	million gallons per day
% 3	= EN_IMGD	Imperial mgd
% 4	= EN_AFD	acre-feet per day
% 5	= EN_LPS	liters per second
% 6	= EN_LPM	liters per minute
% 7	= EN_MLD	million liters per day
% 8	= EN_CMH	cubic meters per hour
% 9	= EN_CMD	cubic meters per day
% 
% Flow units are specified in the [OPTIONS] section of the EPANET Input file. 
% 
% Flow units in liters or cubic meters implies that metric units are used for 
% all other quantities in addition to flow. Otherwise US units are employed. (See Units of Measurement).
% 
% Version 2.00.07 (January 2001)

global ENDLLNAME;
unitscode=int32(0);
%pu=libpointer('int32Ptr',unitscode);
[errcode, unitscode]=calllib(ENDLLNAME,'ENgetflowunits',unitscode);
if errcode ENerror(errcode); end
%unitscode=get(pu,'Value');
