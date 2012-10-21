%% Function getQualityData
function [V,L,T,errcode] = getQualityData(bulkSpecieID,wallSpecieID,...
    msxFname,inpFname)
%% Synopsis
%   [V,L,T,errcode] =
%   getQualityData(bulkSpecieID,wallSpecieID,msxFname,inpFname) Returns
%   vertex (V) and link (L) data from running the Epanet or Epanet-MSX
%   simulation defined by the input files msxFname and inpFname. For MSX
%   simulations the data in V is data defined on all network vertices
%   (nodes) for the bulk specie ID bulkSpecieID, and L is data defined on
%   all network links (pipes) for the wall specie ID wallSpecieID. For an
%   ordinary Epanet simulation, msxFname would be a blank character string
%   (msxFname='') or an empty matrix (msxFname=[]).  In this case both
%   bulkSpecieID and wallSpecieID are ignored, since Epanet does not know
%   about bulk or wall species; accordingly, for an ordinary Epanet
%   simulation, the return value of V contains the single-specie simulation
%   water quality data as defined in inpFname, while L=[].  For both MSX
%   and ordinary Epanet simulations, the ordering in V and/or L is node
%   and/or link index order. The output vector T contains the simulation
%   times (in seconds) associated with each frame.
%
%   errcode = 0 if Epanet and Epanet-MSX simulations complete normally;
%   otherwise an error message is printed and errcode > 0 corresponds to an
%   Epanet or Epanet-MSX error code.
%
%   If defined, the output matrices V, L, and T are (nnodex x nframes),
%   (nlinks x nframes), and (nframes x 1) respectively.  The value of
%   nframes is determined differently for Epanet and Epanet-MSX
%   simulations:
%
%   Epanet simulations: nframes is defined by the values of REPORT START
%   and REPORT STEP in the Epanet input file.  Specifically, frames are
%   stored only when Epanet simulation time t satisfies: (t >= REPORT_START
%   && mod(t,REPORT_STEP) == 0).
%
%   Epanet-MSX simulations: nframes is defined by the values of REPORT
%   START in the Epanet input file the value of TIMESTEP in the Epanet-MSX
%   input file.  Specifically, frames are stored only when Epanet-MSX
%   simulation time t satisfies: (t >= REPORT_START && mod(t,TIMESTEP) ==
%   0).
%
%% Global Declarations
% defined for MATLAB versions of Epanet and MSX programmer's toolkits.  See
% ENMatlabSetup() and MSXMatlabSetup()
global MSX_CONSTANT
global EN_CONSTANT
global EN_SIZE
%% Initialize MATLAB EPANET and MSX
% Note that Matlab must be able to find the libraries epanet2.dll
% or epanet2.so, epanetmsx.dll or epanetmsx.so, and the header files
% epanet2.h and epanetmsx.h

% setup Epanet
ENMatlabSetup('epanet2','epanet2.h');

% open Epanet
[errcode] = ENopen(inpFname, 'epanet.rpt', '');
if errcode; return; end

if ~isempty(msxFname)
    % setup MSX
    MSXMatlabSetup('epanetmsx','epanetmsx.h');

    % Open MSX
    [errcode] = MSXopen(msxFname);
    if errcode; return; end
end

%% Hydraulic and Water Quality Analyses
T = [];         % The output times
V = [];         % The vertex data
L = [];         % The link data
if ~isempty(msxFname)
    % MSX simulation

    % Get the simulation time parameters
    [errcode, reportStart] = ENgettimeparam(EN_CONSTANT.EN_REPORTSTART);
    if errcode; return; end

    % Hydraulic analysis
    [errcode] = MSXsolveH();
    if errcode; return; end

    % Specie information
    bulkSpecieIndex=0;
    wallSpecieIndex=0;
    if ~isempty(bulkSpecieID)
        [errcode,bulkSpecieIndex] = ...
            MSXgetindex(MSX_CONSTANT.MSX_SPECIES,bulkSpecieID);
        [errcode,bulkSpecieType,units,atol,rtol] = ...
            MSXgetspecies(bulkSpecieIndex);
        if bulkSpecieType ~= MSX_CONSTANT.MSX_BULK
            disp 'Specified bulk specie ID is incorrect type'
            return
        end
        if errcode; return; end
    end
    if ~isempty(wallSpecieID)
        [errcode,wallSpecieIndex] = ...
            MSXgetindex(MSX_CONSTANT.MSX_SPECIES,wallSpecieID);
        [errcode,wallSpecieType,units,atol,rtol] = ...
            MSXgetspecies(wallSpecieIndex);
        if wallSpecieType ~= MSX_CONSTANT.MSX_WALL
            disp 'Specified wall specie ID is incorrect type'
            return
        end
        if errcode return; end
    end

    tleft = 1;      % Time left in simulation
    iframe = 1;     % frame index
    MSXinit(1);
    while (tleft > 0 && errcode == 0)
        [errcode, t, tleft] = MSXstep();

        if t >= reportStart
            % Retrieve results at time t
            if bulkSpecieIndex
                V = [V zeros(EN_SIZE.nnodes,1)];
                for in=1:EN_SIZE.nnodes
                    [errcode, V(in,iframe)] = ...
                        MSXgetqual(MSX_CONSTANT.MSX_NODE,in,bulkSpecieIndex);
                end
            end
            if wallSpecieIndex
                L = [L zeros(EN_SIZE.nlinks,1)];
                for in=1:EN_SIZE.nlinks
                    [errcode, L(in,iframe)] = ...
                        MSXgetqual(MSX_CONSTANT.MSX_LINK,in,wallSpecieIndex);
                end
            end
            T = [T; t];

            iframe = iframe + 1;
        end
    end
else
    % Ordinary Epanet simulation

    % Get the simulation time parameters
    [errcode, reportStart] = ENgettimeparam(EN_CONSTANT.EN_REPORTSTART);
    if errcode; return; end
    [errcode, reportStep] = ENgettimeparam(EN_CONSTANT.EN_REPORTSTEP);
    if errcode; return; end

    % Hydraulic analysis
    [errcode] = ENsolveH();
    if errcode>100; return; end

    tleft = 1;      % Time left in simulation
    iframe = 1;     % frame index
    [errcode] = ENopenQ();
    if errcode; return; end
    [errcode] = ENinitQ(0);
    if errcode; return; end
    while (tleft > 0 && errcode == 0)
        [errcode, t] = ENrunQ();

        if t >= reportStart && ~mod(t,reportStep)
            % Retrieve results at time t
            V = [V zeros(EN_SIZE.nnodes,1)];
            for in=1:EN_SIZE.nnodes
                [errcode, V(in,iframe)] = ...
                    ENgetnodevalue(in, EN_CONSTANT.EN_QUALITY);
            end
            T = [T; t];
            
            iframe = iframe + 1;
        end
        
        [errcode, tleft] = ENnextQ();
    end
    [errcode] = ENcloseQ();
    if errcode; return; end
end
%% Matlab Epanet cleanup
ENclose();
ENMatlabCleanup();
if ~isempty(msxFname)
    MSXclose();
    MSXMatlabCleanup();
end
