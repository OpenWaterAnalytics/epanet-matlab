function [errcode] = MSXopen(msxname)
% Declaration:
%   [errcode] =  MSXopen( msxname )
% 
% Description:
%   Opens the MSX Toolkit to analyze a particular distribution system.
%   Defines global structure ENMSX_SIZE.
% 
% Arguments:
%   msxname:	name of an EPANET-MSX Input file
% 
% Returns:
%   Returns an error code.
%
% Notes: 
%  The standard EPANET toolkit function ENopen must have been called
%  first to open the EPANET toolkit along with an associated EPANET 
%  input file for the network being analyzed as well as to identify 
%  the name of a report file to which results are written.
%
%   MSX_SIZE is a global structure that contains the msx size: nspecies,
%   nterms, nparams, nconstants, npats.
%   This structure is defined for user convenience.
% 
%   MSXopen must be called before any of the other msx toolkit functions 
%   are used.
% 
% See Also:  
%   ENclose

global MSXDLLNAME;
global MSX_CONSTANT;
global MSX_SIZE;

%errcode = 0;

[errcode] = calllib(MSXDLLNAME,'MSXopen',msxname);
if errcode MSXerror(errcode); end
if (errcode == 520)
   disp('current MSX project will be closed and the new project will be opened');
   [errcode] = MSXclose(); 
   if errcode MSXerror(errcode); 
   else 
       [errcode] = calllib(MSXDLLNAME,'MSXopen',msxname);
       if errcode MSXerror(errcode); end 
   end
end

  
    
    
[errcode,nspecies] = MSXgetcount(MSX_CONSTANT.MSX_SPECIES);
if errcode MSXerror(errcode); end

[errcode,nparams] = MSXgetcount(MSX_CONSTANT.MSX_PARAMETER);
if errcode MSXerror(errcode); end

[errcode,nconstants] = MSXgetcount(MSX_CONSTANT.MSX_CONSTANT);
if errcode MSXerror(errcode); end

[errcode,npats] = MSXgetcount(MSX_CONSTANT.MSX_PATTERN);
if errcode MSXerror(errcode); end

MSX_SIZE = struct(...
    'nspecies', nspecies,...
    'nparams', nparams,...
    'npats',  npats,...
    'nconstants',nconstants);
