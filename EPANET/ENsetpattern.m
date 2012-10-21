function [errcode] = ENsetpattern(index, factors, nfactors)
% Declaration:
% [errcode] = ENsetpattern(index, factors, nfactors)
% 
% Description:
%  Sets all of the multiplier factors for a specific time pattern.  
% 
%Arguments: 
% index: time pattern index 
% factors: multiplier factors for the entire pattern 
% nfactors: number of factors in the pattern 
%
% Returns:
%  Returns an error code.
% 
%Notes:
%  Pattern indexes are consecutive integers starting from 1.  
%
% factors points to a zero-based array that contains nfactors elements.  
%
% Use this function to redefine (and resize) a time pattern all at once; 
% use ENsetpatternvalue to revise pattern factors in specific time periods of a pattern.  
%
%See Also:
%  ENgetpatternindex, ENgetpatternlen, ENgetpatternvalue,
%  ENsetpatternvalue, ENaddpattern   
%
% Version 2.00.07 (August 2008)

global ENDLLNAME;
index=int32(index);
nfactors=int32(nfactors);
p=libpointer('singlePtr',factors);
[errcode]=calllib(ENDLLNAME,'ENsetpattern',index,p,nfactors);
if errcode ENerror(errcode); end
