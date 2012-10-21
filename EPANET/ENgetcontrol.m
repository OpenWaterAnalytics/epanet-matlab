function [errcode, ctype,lindex,setting,nindex,level] = ENgetcontrol(cindex)
% Declaration:
% [errcode, ctype,lindex,setting,nindex,level] = ENgetcontrol(cindex)
% 
% Description:
%  Retrieves the parameters of a simple control statement. The index of the
%  control is specified in cindex and the remaining arguments return the 
%  control's parameters.   
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
%  Controls are indexed starting from 1 in the order in which they 
%  were entered into the [CONTROLS] section of the EPANET input file. 
%
% Control type codes consist of the following:  
%   - 0 (Low Level Control) applies when tank level or node pressure drops below specified level 
%   - 1 (High Level Control) applies when tank level or node pressure rises above specified level 
%   - 2 (Timer Control) applies at specific time into simulation 
%   - 3 (Time-of-Day Control) applies at specific time of day 
%
% For pipes, a setting of 0 means the pipe is closed and 1 means it is open.
% For a pump, the setting contains the pump's speed, with 0 meaning the pump
% is closed and 1 meaning it is open at its normal speed.
% For a valve, the setting refers to the valve's pressure, flow, or loss 
% coefficient value, depending on valve type.
%
% For Timer or Time-of-Day controls the nindex parameter equals 0.  
%
% See ENsetcontrol for an example of using this function. 
%
%See Also:
% ENsetcontrol  
%
% Version 2.00.07 (August 2008)


global ENDLLNAME;

ctype=int32(0);
lindex=int32(0);
setting=single(0);
nindex=int32(0);
level=single(0);

cindex=int32(cindex);

pctype=libpointer('int32Ptr',ctype);
plindex=libpointer('int32Ptr',lindex);
psetting=libpointer('singlePtr',setting);
pnindex=libpointer('int32Ptr',nindex);
plevel=libpointer('singlePtr',level);

[errcode]=calllib(ENDLLNAME,'ENgetcontrol',cindex,pctype,plindex,psetting,pnindex,plevel);
if errcode ENerror(errcode); end

ctype=get(pctype,'Value');
lindex=get(plindex,'Value');
setting=get(psetting,'Value');
nindex=get(pnindex,'Value');
level=get(plevel,'Value');









