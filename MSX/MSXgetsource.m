function [errcode, type, level, pat] = MSXgetsource(node,species)
% Declaration:
%  [errcode, type, level, pat] = MSXgetsource(int node, int species);
% 
% Description:
%  Retrieves information on any external source of a particular chemical
%  species assigned to a specific node of the pipe network.
% 
% Arguments:
%  node is the internal sequence number (starting from 1) assigned to the
%  node of interest;
% 
%  species is the sequence number of the species of interest (starting from
%  1 as listed in the MSX input file);
% 
%  type is returned with the type of external source and will be one of the
%  following pre-defined constants:
%   MSX_NOSOURCE		(defined as -1) for no source,
%   MSX_CONCEN		(defined as 0) for a concentration source,
%   MSX_MASS		(defined as 1) for a mass booster source,
%   MSX_SETPOINT		(defined as 2) for a setpoint source,
%   MSX_FLOWPACED	(defined as 3) for a flow paced source;
%  The meaning of these source types can be found in the description of the
%  [SOURCES] section of the MSX input file in section 4 of this manual.
% 
%   level is returned with the baseline concentration (or mass flow rate) of
%   the source;
% 
%   pat is returned with the index of the time pattern used to add
%   variability to the source’s baseline level (and will be 0 if no pattern
%   was defined for the source).
% 
% Returns: 
%  Returns an error code or 0 for no error.


global MSXDLLNAME;
%global MSX_CONSTANT;

node=int32(node);
species=int32(species);
type=int32(0);
level=0;
pat=int32(0);
[errcode,type,level,pat]=calllib(MSXDLLNAME,'MSXgetsource',node,species,type,level,pat);
if errcode MSXerror(errcode); end
