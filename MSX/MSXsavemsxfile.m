function [errcode] = MSXsavemsxfile(outfname)
% Declaration: 
%  [errcode] = MSXsavemsxfile(outfname);
% 
% Description: 
%  Saves the data associated with the current MSX project into
%  a new MSX input file.
% 
% Arguments: 
%  outfname is a  string containing the name of the
%  file to which data are saved.
% 
% Returns: 
%  Returns an error code or 0 for no error.
% 
% Notes: 
%  For a step-wise simulation using MSXstep, this function only
%  applies if MSXinit was called with its saveFlag parameter set to 1 (see
%  MSXinit). The format of the binary results file is described in Appendix
%  B of the MSX user's guide.

global MSXDLLNAME;

[errcode] = calllib(MSXDLLNAME,'MSXsavemsxfile',outfname);
if errcode MSXerror(errcode); end
