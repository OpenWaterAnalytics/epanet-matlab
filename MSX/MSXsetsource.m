function [errcode] = MSXsetsource(node,species,type,level,pat)
% Declaration:
%  [errcode] = MSXsetsource(node,species,type,level,pat);
% 
% Description:
%  Sets the attributes of an external source of a particular chemical
%  species to a specific node of the pipe network.
% 
% Arguments:
%  node is the internal sequence number (starting from 1) assigned to the
%  node of interest;
% 
%  species is the sequence number of the species of interest (starting from
%  1 as listed in the MSX input file);
% 
%  type is the type of external source to be utilized and will be one of the
%  following pre-defined constants:
%   MSX_NOSOURCE		(defined as -1) for no source,
%   MSX_CONCEN		(defined as 0) for a concentration source,
%   MSX_MASS		(defined as 1) for a mass booster source,
%   MSX_SETPOINT		(defined as 2) for a setpoint source,
%   MSX_FLOWPACED	(defined as 3) for a flow paced source;
%  The meaning of these source types can be found in the description of the
%  [SOURCES] section of the MSX input file in section 4 of this manual.
% 
%  level is the baseline concentration (or mass flow rate) of the source;
% 
%  pat is the index of the time pattern used to add variability to the
%  source’s baseline level (use 0 if the source has a constant strength).
% 
% Returns:
%  Returns an error code or 0 for no error.
% 
% Notes:
%  The EPANET toolkit function ENgetnodeindex can be used to identify the
%  index of a node from its ID name; 
%  Concentrations are expressed as mass units per liter for bulk species 
%  and as mass per unit area for surface species.

global MSXDLLNAME;
%global MSX_CONSTANT;

node=int32(node);
species=int32(species);
type=int32(type);
level=double(level);
pat=int32(pat);
[errcode]=calllib(MSXDLLNAME,'MSXsetsource',node,species,type,level,pat);
if errcode MSXerror(errcode); end
