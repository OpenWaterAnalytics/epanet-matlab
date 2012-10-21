function [errcode] = ENusehydfile(hydfname)
% Declaration:
% [errcode] = ENusehydfile( hydfname )
% 
% Description:
%  Uses the contents of the specified file as the current binary hydraulics file.  
% 
%Arguments: 
% fname: name of the file containing hydraulic analysis results for the 
% current network. 
%
% Returns:
%  Returns an error code.
% 
%Notes:
% Call this function to refuse a set of hydraulic analysis results saved 
% previously. These results are checked to see if they match the following 
% the parameters associated with the current network being analyzed: 
% number of nodes, number of tanks and reservoirs, number of links, 
% number of pumps, number of valves, and simulation duration.  
%
% Do not call this function when the hydraulics analysis system is still 
% opened (i.e., ENopenH has been called but ENcloseH has not).  
%
%See Also:
% ENsavehydfile
%
% Version 2.00.07 (August 2008)

global ENDLLNAME;

[errcode]=calllib(ENDLLNAME,'ENusehydfile',hydfname);
if errcode ENerror(errcode); end