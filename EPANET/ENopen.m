function [errcode] = ENopen(inpname,repname,binname)
% Declaration:
% [errcode] =  ENopen( inpname, repname, binname )
% 
% Description:
% Opens the Toolkit to analyze a particular distribution system.
% Defines global structure EN_SIZE.
% 
% Arguments:
% inpname:	name of an EPANET Input file
% repname:	name of an output Report file
% binname:	name of an optional binary Output file.
% 
% Returns:
% Returns an error code.
% EN_SIZE is a global structure that contains the network size: nnodes, 
% ntanks, nlinks, npats, ncurves, ncontrols.  This structure is defined for
% convenience.
% 
% Notes:
% If there is no need to save EPANET's binary Output file then f3 can be an empty string ("").
% If f2 is an empty string, then reporting will be made to the operating system's stdout device (which is usually the console).
% ENopen must be called before any of the other toolkit functions (except ENepanet) are used.
% 
% See Also:  
% ENclose
% 
% Version 2.00.07 (January 2001)

global ENDLLNAME;
%global EN_CONSTANT;
global EN_SIZE;

errcode=calllib(ENDLLNAME,'ENopen',inpname,repname,binname);
if errcode ENerror(errcode); end

[nnodes,ntanks,nlinks,npats,ncurves,ncontrols,errcode] = ENgetnetsize();
if errcode ENerror(errcode); end

EN_SIZE = struct(...
    'nnodes', nnodes,...
    'ntanks', ntanks,...
    'nlinks', nlinks,...
    'npats',  npats,...
    'ncurves',ncurves,...
    'ncontrols',ncontrols);
