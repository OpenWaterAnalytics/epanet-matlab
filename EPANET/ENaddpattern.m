function [errcode] = ENaddpattern(patid)
% Declaration: 
%  int ENaddpattern( char* id ) 
% Description: 
%  Adds a new time pattern to the network.  
% Arguments: 
%  id: 
%  ID label of pattern 
% Returns: 
%  Returns an error code.  
% Notes: 
%  The ID label should contain no more than 31 characters.  
%  The new pattern will contain a single time period whose multiplier factor is 1.  
%  Use the ENsetpattern function to populate the pattern with a specific set of multipliers after first retrieving its index with the ENgetpatternindex function.  
% Example: 
%  char  patId[] = "NewPattern";  
%  float patFactors[] = {0.8, 1.1, 1.4, 1.1, 0.8, 0.7};  
%  int   patIndex;  
%  ENaddpattern(patId);  
%  ENgetpatternindex(patId, patIndex);  
%  ENsetpattern(patIndex, patFactors, 6);

global ENDLLNAME;

errcode=calllib(ENDLLNAME,'ENaddpattern',patid);
if errcode ENerror(errcode); end
