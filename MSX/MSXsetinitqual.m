function [errcode] = MSXsetinitqual(type,index,species,value)
% Declaration:
%  [errcode] = MSXsetinitqual(type,index,species,value)
% 
% Description:
%   Assigns an initial concentration of a particular chemical species to a
%   specific node or link of the pipe network.
% 
% Arguments:
%  type: is type of object being queried and must be either:
%        MSX_NODE (defined as 0) for a node
%        MSX_LINK (defined as 1) for a link;
% 
%  index: is the internal sequence number (starting from 1) assigned to the
%         node or link;
% 
%  species: is the sequence number of the species (starting from 1 as listed
%           in the MSX input file);
% 
%  value: is the initial concentration of the species to be applied at the
%         node or link of interest.
% 
% Returns:
%   Returns an error code or 0 for no error.
% 
% Notes:
%  The EPANET toolkit functions ENgetnodeindex and ENgetlinkindex can be
%  used to identify the index of a node or link from its ID name;
% 
%  Concentrations are expressed as mass units per liter for bulk species and
%  as mass per unit area for surface species.

global MSXDLLNAME;

type=int32(type);
index=int32(index);
species=int32(species);
value=double(value);
[errcode]=calllib(MSXDLLNAME,'MSXsetinitqual',type,index,species,value);
if errcode MSXerror(errcode); end
