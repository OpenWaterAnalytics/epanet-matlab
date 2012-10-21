function [errcode, t] = ENrunH()
% Declaration:
% [errcode,t] = ENrunH( void )
% 
% Description:
%  Clears any report formatting commands that either appeared in the [REPORT] 
%  section of the EPANET Input file or were issued with the ENsetreport function.  
% 
%Arguments: 
%
% Returns:
%  Returns an error code.
% 
%Notes:
%  After calling this function the default reporting options are in effect. These are:  
%   · No status report  
%   · No energy report  
%   · No nodes reported on  
%   · No links reported on  
%   · Node variables reported to 2 decimal places  
%   · Link variables reported to 2 decimal places (3 for friction factor)  
%   · Node variables reported are elevation, head, pressure, and quality  
%   · Link variables reported are flow, velocity, and head loss  
%
%See Also:
% ENreport, ENsetreport, ENsetstatusreport  
%
% Version 2.00.07 (August 2008)

global ENDLLNAME;
t=int32(0);
%p=libpointer('int32Ptr',t);
[errcode,t]=calllib(ENDLLNAME,'ENrunH',t);
if errcode ENerror(errcode); end
%t=get(p,'Value');
