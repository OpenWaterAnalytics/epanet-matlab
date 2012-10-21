function [errcode] = ENsavehydfile(fname)
%Declaration:
% [errcode] = ENsavehydfile(fname)
%
%Description:
% Saves the current contents of the binary hydraulics file to a file.
%
%Arguments:
%  fname:name of the file where the hydraulics results should be saved.
%
%Returns:
% Returns an error code.
%
%Notes:
% Use this function to save the current set of hydraulics results to a file,
% either for post-processing or to be used at a later time by calling the 
% ENusehydfile function.
% The hydraulics file contains nodal demands and heads and link flows, 
% status, and settings for all hydraulic time steps, even intermediate ones.
% Before calling this function hydraulic results must have been generated 
% and saved by having called ENsolveH or the ENinitH - ENrunH - ENnextH 
% sequence with the saveflag parameter of ENinitH set to 1.
%
%See Also:
% ENusehydfile, ENsolveH, ENinitH
%
% Version 2.00.07 (August 2008)


global ENDLLNAME;

[errcode]=calllib(ENDLLNAME,'ENsavehydfile',fname);
if errcode ENerror(errcode); end