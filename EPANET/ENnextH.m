function [errcode, tstep] = ENnextH()
% Declaration:
% [errcode,tstep] = ENnextH(void)
% 
% Description:
%  Determines the length of time until the next hydraulic event occurs in 
%  an extended period simulation.   
% 
%Arguments: 
% tstep:  time (in seconds) until next hydraulic event occurs or 0 if at the end of the simulation period. 
%
% Returns:
%  Returns an error code.
% 
%Notes:
% This function is used in conjunction with ENrunH to perform an extended 
% period hydraulic analysis (see example below).  
%
% The value of tstep should be treated as a read-only variable. 
%It is automatically computed as the smaller of:  
%   · the time interval until the next hydraulic time step begins  
%   · the time interval until the next reporting time step begins  
%   · the time interval until the next change in demands occurs  
%   · the time interval until a tank becomes full or empty  
%   · the time interval until a control or rule fires  
% 
%Example: 
% long t, tstep;  
% ENopenH();  
% ENinitH(0);  
% do {  
%  ENrunH(&t);  
%  /* Retrieve hydraulic results for time t */  
%  ENnextH(&tstep);  
% } while (tstep > 0);  
% ENcloseH();       
%
%See Also:
% ENopenH, ENinitH, ENrunH, ENcloseH, ENsettimeparam  
%
% Version 2.00.07 (August 2008)
global ENDLLNAME;
tstep=int32(0);
%p=libpointer('int32Ptr',tstep);
[errcode,tstep]=calllib(ENDLLNAME,'ENnextH',tstep);
if errcode ENerror(errcode); end
%tstep=get(p,'Value');