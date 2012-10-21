function [errcode] = ENwriteline (line)
% Declaration:
% [errcode] = ENwriteline  (line)
% 
% Description:
%  Writes a line of text to the EPANET report file.    
% 
%Arguments: 
%  line: text to be written to file.  
%
% Returns:
%  Returns an error code.
% 
%Notes:  
%
%See Also:
% 
%
% Version 2.00.07 (August 2008)
global ENDLLNAME;

[errcode]=calllib(ENDLLNAME,'ENwriteline',line);
if errcode ENerror(errcode); end
