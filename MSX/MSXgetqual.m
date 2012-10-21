function [errcode, value] = MSXgetqual(obj,index,species)
% Declaration: 
%  [errcode, value] = MSXgetqual(obj,index,species)
% 
% Purpose: 
%  Retrieves a chemical species concentration at a given node or
%  the average concentration along a link at the current simulation time
%  step.
% 
% Arguments: 
%  obj: is type of object being queried and must be either:
%   MSX_NODE (defined as 0) for a node 
%   MSX_LINK (defined as 1) for a link;
% 
%  index: is the internal sequence number (starting from 1) assigned to the
%         node or link;
% 
%  species: is the sequence number of the species (starting from 1 as listed
%           in the MSX input file);
% 
%  value: is returned with the computed concentration of the species at the
%         current time period. 
% 
% Returns: 
%  Returns an error code or 0 for no error.
%
% Notes: 
%  The EPANET toolkit functions ENgetnodeindex and ENgetlinkindex can
%  be used to identify the index of a node or link from its ID name; 
%
%  Concentrations are expressed as mass units per liter for bulk species 
%  and as mass per unit area for surface species.

global MSXDLLNAME;
%global MSX_CONSTANT; 

obj=int32(obj);
index=int32(index);
species=int32(species);
value=0;
[errcode,value]=calllib(MSXDLLNAME,'MSXgetqual',obj,index,species,value);
if errcode MSXerror(errcode); end
