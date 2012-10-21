function example(msxfn,inpfn,rptfn)
% Declaration:
%   MSXexample
%Description:
%   This example uses the network file Net2.inp and the msx file net2-cl2.msx
%   (distributed with the MSX toolkit as example 2)
%   to plot the CL2 data of node 1, linke 1, node 17 and link 17. 
%===============================================================
global EN_CONSTANT
global MSX_CONSTANT
%global
%global 

if nargin < 2
    msxfn ='net2-cl2.msx'
end;
if nargin < 1
    inpfn = 'Net2.inp'
end;
if nargin < 3
    [pathstr, name, ext, versn] = fileparts(msxfn);
    rptfn =[name,'.rpt'];
end;
[pathstr, name, ext, versn] = fileparts(msxfn);
hydrfn = [name,'.hyd'];

%start epanet
%exist('epanet2.dll')%returns 3 MEX-file on MATLAB's search path seems to be right
%exist('epanet2.h')%return 2
ENMatlabSetup('epanet2','epanet2.h');% seems to work
%check with
%libisloaded('epanet2')% returns 1 =true
%libfunctions('epanet2', '-full')%shows libaryfunction loaded

%start MSX
%exist('epanetmsx.dll')%returns 3 MEX-file on MATLAB's search path seems to be right
%exist('epanetmsx.h')
%open MSX
MSXMatlabSetup('epanetmsx','epanetmsx.h');
%libisloaded('epanetmsx')% returns 1 =true
%libfunctions('epanetmsx', '-full')%shows libaryfunction loaded
%export Epanet inp file (network) example network Net1.net in order to use ENopen:
%exist('net3-bio.inp')% returns 2
%export Epanet inp file (network) example network Net1.net in order to use ENopen:
%exist('net3-bio.msx')% returns 2

%open hydraulic network
[errcode] = ENopen(inpfn, rptfn, '');

% Open the MSX toolkit
[errcode] = MSXopen(msxfn);


% Hydraulic analysis
[errcode] = MSXsolveH();
[errcode]= ENsaveH();
[errcode]= ENsavehydfile(hydrfn);

[errcode] = MSXusehydfile(hydrfn);

% Solve WQ in stepwize fashion
[errcode,speccnt] = MSXgetcount(MSX_CONSTANT.MSX_SPECIES);

tleft = 1;
i = 1;
MSXinit(1);
while (tleft > 0 && errcode == 0)
    [errcode, t, tleft] = MSXstep();
    % Use MSXgetqual to retrieve results at time t
    %collect Pb data
    [errcode, bnvalue] = MSXgetqual(MSX_CONSTANT.MSX_NODE,1,1);
    CL2n1v(i)= bnvalue;
    [errcode, blvalue] = MSXgetqual(MSX_CONSTANT.MSX_LINK,1,1);
    CL2l1v(i)= blvalue;
    [errcode, bnvalue] = MSXgetqual(MSX_CONSTANT.MSX_NODE,17,1);
    CL2n17v(i)= bnvalue;
    [errcode, blvalue] = MSXgetqual(MSX_CONSTANT.MSX_LINK,17,1);
    CL2l17v(i)= blvalue;
    tspan(i) = t;
    i=i+1;
end
%plot results
%tspan = [0 :stepsize: t-1];
 figure
 %subplot of bulk concentration node 1 index 1???
    subplot(2,1,1)
    plot(tspan,CL2n1v);
    title({'Node 1'});
    ylabel('CL2 at Node 1');
    xlabel('time');
%subplot of bulk concentration link 1 index1 ??? 
    subplot(2,1,2)
    plot(tspan,CL2l1v);
    title('Link 1');
    ylabel('CL2 in Link 1');
    xlabel('time');
    
  figure
 %subplot of bulk concentration node 1 index 1???
    subplot(2,1,1)
    plot(tspan,CL2n17v);
    title({'Node 17'});
    ylabel('CL2 in Node 17');
    xlabel('time');
%subplot of bulk concentration link 1 index1 ??? 
    subplot(2,1,2)
    plot(tspan,CL2l17v);
    title('Link 17');
    ylabel('CL2 in Link 17');
    xlabel('time');
[errcode] = MSXreport();
MSXclose();
ENclose();

ENMatlabCleanup();
MSXMatlabCleanup();