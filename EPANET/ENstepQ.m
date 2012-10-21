function [errcode, tleft] = ENstepQ()
% Declaration:
% [errcode, tleft] = ENstepQ(void)
% 
% Description:
%  Advances the water quality simulation one water quality time step. 
%  The time remaining in the overall simulation is returned in tleft.  
% 
%Arguments:  
%  tleft: seconds remaining in the overall simulation duration.  
% 
% Returns:
%  Returns an error code.
% 
%Notes:
%  This function is used in a do-while loop with ENrunQ to perform 
%  an extended period water quality simulation. It allows you to 
%  access water quality results at each water quality time step of 
%  the simulation, rather than at the start of each hydraulic period as with ENnextQ. 
%
%  Use the argument tleft to determine when no more calls to ENrunQ are 
%  needed because the end of the simulation period has been reached (i.e., when tleft = 0).  
%  
%  Treat tleft as a read-only variable (do not assign it a value).  
% 
%Example:
%long t, tleft;  
% ENsolveH(); /* Generate & save hydraulics */  
% ENopenQ();  
% ENinitQ(0);  
% do {   
%   ENrunQ(&t);  
%  /* Monitor results at time t */  
%  ENstepQ(&tleft);  
% } while (tleft > 0);  
% ENcloseQ();     % 
%
%See Also:
%  ENopenQ, ENinitQ, ENrunQ, ENcloseQ  
%
% Version 2.00.07 (August 2008)
global ENDLLNAME;
tleft=int32(0);
%p=libpointer('int32Ptr',tleft);
[errcode,tleft]=calllib(ENDLLNAME,'ENstepQ',tleft);
if errcode ENerror(errcode); end
%tleft=get(p,'Value');
