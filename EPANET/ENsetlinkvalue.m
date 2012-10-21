function [errcode] = ENsetlinkvalue(index, paramcode, value)
% Declaration:
% [errcode] = ENsetlinkvalue(index, paramcode, value)
% 
% Description:
%  Sets the value of a parameter for a specific link.  
% 
%Arguments: 
% index:  link index 
% paramcode: parameter code (see below) 
% value: parameter value  
%
% Returns:
%  Returns an error code.
% 
%Notes:
% Link indexes are consecutive integers starting from 1.  
% Link parameter codes consist of the following constants:  
% EN_DIAMETER       0       Diameter 
% EN_LENGTH         1       Length 
% EN_ROUGHNESS      2       Roughness coeff. 
% EN_MINORLOSS      3       Minor loss coeff. 
% EN_INITSTATUS     4       Initial link status (0 = closed, 1 = open) 
% EN_INITSETTING    5       Roughness for pipes, initial speed for pumps, initial setting for valves 
% EN_KBULK          6       Bulk reaction coeff. 
% EN_KWALL          7       Wall reaction coeff. 
% EN_STATUS         11      Current pump or valve status (0 = closed, 1 = open) 
% EN_SETTING         12      Roughness for pipes, current speed for pumps, current setting for valves 
% 
% Values are supplied in units which depend on the units used for flow rate
% in the EPANET input file (see Units of Measurement).  
%
% Use EN_INITSTATUS and EN_INITSETTING to set the design value for a 
% link's status or setting that exists prior to the start of a simulation. 
% Use EN_STATUS and EN_SETTING to change these values while a simulation is 
% being run (within the ENrunH - ENnextH loop).  
%
% If a control valve has its status explicitly set to OPEN or CLOSED, 
% then to make it active again during a simulation you must provide a 
% new valve setting value using the EN_SETTING parameter.  
%
% For pipes, either EN_ROUGHNESS or EN_INITSETTING can be used to change roughness.   
%
%See Also:
% 

% Version 2.00.07 (August 2008)

global ENDLLNAME;
%global EN_CONSTANT;
index=int32(index);
paramcode=int32(paramcode);
value=single(value);
[errcode]=calllib(ENDLLNAME,'ENsetlinkvalue',index, paramcode, value);
if errcode ENerror(errcode); end
