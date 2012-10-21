%% Function getHydraulicData
function [V,L,T,errcode] = getHydraulicData(NodeType,LinkType,inpFname)
%% Synopsis
%   [V,L,T,errcode] = getHydraulicData(NodeType,LinkType,inpFname) Returns
%   vertex (V) and link (L) data from running an Epanet hydraulic
%   simulation defined by the input file inpFname. The return value of V
%   contains the node data of type NodeType, while L contains the link data
%   of type LinkType. NodeType and LinkType are character strings as
%   defined in the Epanet toolkit documentation (i.e. 'EN_...').  The
%   ordering in V and/or L is node and/or link index order. The output
%   vector T contains the simulation times (in seconds) associated with
%   each frame.  If either of NodeType or LinkType are undefined then V or
%   L will be empty.
%
%   errcode = 0 if Epanet simulation completes normally; otherwise an error
%   message is printed and errcode > 0 corresponds to an Epanet error code.
%
%   If defined, the output matrices V, L, and T are (nnodes x nframes),
%   (nlinks x nframes), and (nframes x 1) respectively.  The value of
%   nframes is defined by the values of REPORT START and REPORT STEP in the
%   Epanet input file.  Specifically, frames are stored only when Epanet
%   simulation time t satisfies: (t >= REPORT_START && mod(t,REPORT_STEP)
%   == 0).
%% Global Declarations
% defined for MATLAB versions of Epanet programmer's toolkits.  See
% ENMatlabSetup()
global EN_CONSTANT
global EN_SIZE
%% Initialize MATLAB EPANET
% Note that Matlab must be able to find the libraries epanet2.dll
% or epanet2.so, and the header file epanet2.h

% setup Epanet
ENMatlabSetup('epanet2','epanet2.h');

% open Epanet
[errcode] = ENopen(inpFname, 'epanet.rpt', '');
if errcode; return; end
%% Hydraulic Analysis
T = [];         % The time data
V = [];         % The vertex data
L = [];         % The link data
% Get the simulation time parameters
[errcode, reportStart] = ENgettimeparam(EN_CONSTANT.EN_REPORTSTART);
if errcode; return; end
[errcode, reportStep] = ENgettimeparam(EN_CONSTANT.EN_REPORTSTEP);
if errcode; return; end

tleft = 1;      % Time left in simulation
iframe = 1;     % frame index
[errcode] = ENopenH();
if errcode; return; end
[errcode] = ENinitH(0);
if errcode; return; end
while (tleft > 0 && errcode == 0)
    [errcode, t] = ENrunH();

    if t >= reportStart && ~mod(t,reportStep)
        % Retrieve results at time t
        V = [V zeros(EN_SIZE.nnodes,1)];
        for in=1:EN_SIZE.nnodes
            [errcode, V(in,iframe)] = ...
                ENgetnodevalue(in, EN_CONSTANT.(NodeType));
        end
        L = [L zeros(EN_SIZE.nlinks,1)];
        for in=1:EN_SIZE.nlinks
            [errcode, L(in,iframe)] = ...
                ENgetlinkvalue(in, EN_CONSTANT.(LinkType));
        end
        T = [T; t];

        iframe = iframe + 1;
    end

    [errcode, tleft] = ENnextH();
end
[errcode] = ENcloseH();
if errcode; return; end
%% Matlab Epanet cleanup
ENclose();
ENMatlabCleanup();
