function [errcode, t, tleft] = MSXstep()
% Declaration:
%  [errcode, t, tleft] = MSXstep(void);
%
% Description:
%  Advances the water quality solution through a single water quality time
%  step when performing a step-wise simulation. 
%
% Arguments: 
%  Upon returning, t will contain the current simulation time at the end 
%  of the step (in seconds) while tleft will contain the time left in the 
%  simulation (also in seconds). 
%
% Returns: 
%  Returns an error code or 0 for no error. 
%
% Notes: 
%  This function should be placed in a loop that repeats until the value 
%  of tleft becomes 0. MSXinit should be called before beginning the loop. 
%
%  The water quality time step used by this function is specified in the
%  [OPTIONS] section of the MSX input file. 


global MSXDLLNAME;

t=int32(0);
tleft=int32(0);
[errcode,t,tleft]=calllib(MSXDLLNAME,'MSXstep',t,tleft);
if errcode MSXerror(errcode); end
t = double(t);
tleft = double(tleft);

