function [errcode] = MSXsaveoutfile(outfname)
%Declaration:
%   [errcode] = MSXsaveoutfile(outfname)
%
%  Purpose:
%    Saves water quality results computed for each node, link and reporting time period to a named binary file.
%
%  Input:
%    outfname = name of the binary results file.
%
%  Returns:
%    an error code (or 0 for no error).
%
% Notes: 
%  For a step-wise simulation using MSXstep, this function only
%  applies if MSXinit was called with its saveFlag parameter set to 1 (see MSXinit).
%  The format of the binary results file is described in Appendix B.


global MSXDLLNAME;

[errcode] = calllib(MSXDLLNAME,'MSXsaveoutfile',outfname);
if errcode MSXerror(errcode); end
