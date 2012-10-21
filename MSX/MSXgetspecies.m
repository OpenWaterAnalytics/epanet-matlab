function [errcode, type, units, atol, rtol] = MSXgetspecies(index)
% Declaration: 
%  [errcode, type, units, atol, rtol] = MSXgetspecies(index)
%
% Description: 
%  Retrieves the attributes of a chemical species given its
%  internal index number.
%
% Arguments: 
%  index: is the sequence number of the species (starting from
%           1 as listed in the MSX input file); 
%
%  type: is returned with one of the following pre-defined constants: 
%           MSX_BULK (defined as 0) for a bulk water species, 
%           MSX_WALL (defined as 1) for a pipe wall surface species; 
%
%  units: is a C-style character string array that is returned with the 
%         mass units that were defined for the species in question. 
%         It must be sized to hold a maximum of 15 characters plus the 
%         terminating null character (for a total of 16). 
%
%  aTol: is returned with the absolute concentration tolerance defined
%        for the species (in concentration units); 
%
%  rTol: is returned with the relative concentration tolerance defined for the species.
%
%       index = index (base 1) of the species in the list of all species.
%
%
%  Returns:
%    Returns an error code or 0 for no error.

global MSXDLLNAME;
%global MSX_CONSTANT;
errcode = 0;


index=int32(index);
type=int32(0);
units=char(32*ones(1,16));
rtol=double(0);
atol=double(0);
[errcode,type,units,atol,rtol]=calllib(MSXDLLNAME,'MSXgetspecies',index,type,units,atol,rtol);
if errcode MSXerror(errcode); end
