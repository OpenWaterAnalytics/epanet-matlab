function [errcode, tstep] = ENnextQ()
% Declaration:
% [errcode, tstep] = ENnextQ( )
% 
% Description:
% Advances the water quality simulation to the start of the next hydraulic 
% time period.
% 
% Arguments:
% tstep:	time (in seconds) until next hydraulic event occurs or 0 if at 
% the end of the simulation period.
% 
% Returns:
% Returns an error code.
% 
% Notes:
% This function is used in a do-while loop with ENrunQ to perform an 
% extended period water quality analysis. It allows you to access water 
% quality results at each hydraulic period of the simulation. The water 
% quality routing and reactions are carried out internally at a much 
% smaller time step. Use ENstepQ instead of this function if you need 
% to access results after each water quality time step.
% The value of tstep is determined from information saved with the hydraulic 
% analysis that preceded the water quality analysis. Treat it as a 
% read-only variable.
% 
% Example:
% 
% long t, tstep;
% ENsolveH(); /* Generate & save hydraulics */
% ENopenQ();
% ENinitQ(0);
% do
% {   
%     ENrunQ(&t);
%     /*
%        Monitor results at time t, which
%        begins a new hydraulic time period   
%     */   
%     ENnextQ(&tstep);
% }  while (tstep > 0)
% ENcloseQ();
%     
% See Also:  
% ENopenQ, ENinitQ, ENrunQ, ENcloseQ
% 
% Version 2.00.07 (January 2001)

global ENDLLNAME;
tstep=int32(0);
%p=libpointer('int32Ptr',tstep);
[errcode,tstep]=calllib(ENDLLNAME,'ENnextQ',tstep);
if errcode ENerror(errcode); end
%tstep=get(p,'Value');
tstep = double(tstep);

