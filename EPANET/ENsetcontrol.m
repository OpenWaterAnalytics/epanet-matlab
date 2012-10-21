function [errcode] = ENsetcontrol(cindex,ctype,lindex,setting,nindex,level)
% Declaration:
% [errcode] = ENsetcontrol(cindex,ctype,lindex,setting,nindex,level)
% 
% Description:
%  Sets the parameters of a simple control statement.  
% 
%Arguments: 
%  cindex:  control statement index 
%  ctype:   control type code 
%  lindex:  index of link being controlled 
%  setting: value of the control setting 
%  nindex:  index of controlling node 
%  level:   value of controlling water level or pressure for 
%           level controls or of time of control action 
%           (in seconds) for time-based controls 
%
% Returns:
%  Returns an error code.
% 
%Notes:
% Controls are indexed starting from 1 in the order in which they were 
% entered into the [CONTROLS] section of the EPANET input file.  
%
% Control type codes consist of the following:  
%  EN_LOWLEVEL      0   Control applied when tank level or node pressure drops below specified level 
%  EN_HILEVEL       1   Control applied when tank level or node pressure rises above specified level 
%  EN_TIMER         2   Control applied at specific time into simulation 
%  EN_TIMEOFDAY     3   Control applied at specific time of day 
% 
% For pipes, a setting of 0 means the pipe is closed and 1 means it is open. 
% For a pump, the setting contains the pump's speed, with 0 meaning the pump
% is closed and 1 meaning it is open at its normal speed. 
% For a valve, the setting refers to the valve's pressure, flow, or 
% loss coefficient, depending on valve type.  
%
% For Timer or Time-of-Day controls set the nindex parameter to 0.  
% For level controls, if the controlling node nindex is a tank then 
% the level parameter should be a water level above the tank bottom 
% (not an elevation). Otherwise level should be a junction pressure.  
%
% To remove a control on a particular link, set the lindex parameter to 0. 
% Values for the other parameters in the function will be ignored.  
% 
% Example: 
% This example uses ENgetcontrol and ENsetcontrol to change the low level
% setting on the node that controls a link with index thelink to a new value newlevel.
%
% [errcode, numctrls] = ENgetcount(EN_CONTROLS)
% for (i=1:1:numctrls)  
%   [errcode, ctype,lindex,setting,nindex,level] = ENgetcontrol(i) 
%   if (ctype == EN_LOWLEVEL && lindex == 1)  
%       [errcode] = ENsetcontrol(i,ctype,lindex,setting,nindex,level)
%   end; 
% end;  
%
%See Also:
% ENgetcontrol  
%
% Version 2.00.07 (August 2008)


global ENDLLNAME;
global EN_CONSTANT;

ctype=int32(ctype);
lindex=int32(lindex);
setting=single(setting);
nindex=int32(nindex);
level=single(level);

[errcode]=calllib(ENDLLNAME,'ENsetcontrol',cindex,ctype,lindex,setting,nindex,level);
if errcode ENerror(errcode); end




