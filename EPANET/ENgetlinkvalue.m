function [errcode, value] = ENgetlinkvalue(index, paramcode)
% Declaration:
% [errcode,value] = ENgetlinkvalue(index, paramcode)
% 
% Description:
%  Retrieves the value of a specific link parameter.   
% 
%Arguments: 
% index: link index 
% paramcode: parameter code (see below) 
% value: parameter value 
%
% Returns:
%  Returns an error code.
% 
%Notes:
%  Link indexes are consecutive integers starting from 1.  
% 
%  Link parameter codes consist of the following constants:  
% EN_DIAMETER       0    Diameter 
% EN_LENGTH         1    Length 
% EN_ROUGHNESS      2    Roughness coeff. 
% EN_MINORLOSS      3    Minor loss coeff. 
% EN_INITSTATUS     4    Initial link status (0 = closed, 1 = open) 
% EN_INITSETTING    5    Roughness for pipes,initial speed for pumps,initial setting for valves 
% EN_KBULK          6    Bulk reaction coeff.  
% EN_KWALL          7    Wall reaction coeff. 
% EN_FLOW           8    Flow rate 
% EN_VELOCITY       9    Flow velocity 
% EN_HEADLOSS       10   Head loss 
% EN_STATUS         11   Actual link status (0 = closed, 1 = open) 
% EN_SETTING        12   Roughness for pipes, actual speed for pumps, actual setting for valves 
% EN_ENERGY         13   Energy expended in kwatts 
%
% Parameters 8 - 13 (EN_FLOW through EN_ENERGY) are computed values. The others are design parameters.  
%
% Flow rate is positive if the direction of flow is from the designated 
% start node of the link to its designated end node, and negative otherwise.  
%
% Values are returned in units which depend on the units used for flow rate 
% in the EPANET input file (see Units of Measurement).   
%
%See Also:
% ENgetlinkindex  
%
% Version 2.00.07 (August 2008)

global ENDLLNAME;
%global EN_CONSTANT;
value=single(0);
%pv=libpointer('singlePtr',value);
index=int32(index);
paramcode=int32(paramcode);
[errcode,value]=calllib(ENDLLNAME,'ENgetlinkvalue',index, paramcode, value);
if errcode ENerror(errcode); end
%value=get(pv,'Value');