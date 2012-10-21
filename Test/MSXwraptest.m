% Tests all the existing Matlab wrappers for the MSX toolkit functions
global MSX_CONSTANT
global EN_CONSTANT

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
exist('onepipetest.inp')% returns 2
%export Epanet inp file (network) example network Net1.net in order to use ENopen:
exist('MSXtest.msx')% returns 2

%call ENopen
[errcode] = ENopen('Net2.inp', 'test.rpt', '');
% Open the MSX toolkit

%[errcode] = MSXopen('MSXtest.msx');
[errcode] = MSXopen('net2-cl2.msx');
%[errcode,errmsg] = MSXgeterror(501,80);
 
 
% Hydraulic analysis
[errcode] = MSXsolveH();
[errcode]=  ENsaveH();
[errcode] = ENsavehydfile('test.hyd');

[errcode] = MSXusehydfile('test.hyd');

[errcode] = MSXsolveQ();
[errcode] = MSXsaveoutfile('test.bin');


[errcode] = MSXaddpattern('testpat');
multi = [0.1 0.1 1 1 1];
len = 5;
[errcode, index] = MSXgetindex(MSX_CONSTANT.MSX_PATTERN,'testpat');
[errcode] = MSXsetpattern(index, multi, len)
[errcode, index] = MSXgetindex(MSX_CONSTANT.MSX_PATTERN,'testpat');
period = 1;
[errcode, value] = MSXgetpatternvalue(index,period);

node = 1;
spec=1;
[errcode,type, level, pat] = MSXgetsource(node,spec);
type = 0;
level=0.2;
pat = 1;
[errcode] = MSXsetsource(node,spec,type, level, pat);
[errcode,type, level, pat] = MSXgetsource(node,spec);
patindex =1;
[errcode,patlen] = MSXgetpatternlen(pat);

[errcode, value] = MSXgetpatternvalue(patindex,period);
value = 0.3;
[errcode] = MSXsetpatternvalue(patindex, period, value);
[errcode, value] = MSXgetpatternvalue(patindex,period);

[errcode, index] = MSXgetindex(MSX_CONSTANT.MSX_SPECIES,'CL2');
[errcode, len] = MSXgetIDlen(MSX_CONSTANT.MSX_SPECIES,index);
[errcode, id] = MSXgetID(MSX_CONSTANT.MSX_SPECIES,index,len);

index = 1;
[errcode, value] = MSXgetconstant(index);
value = value+10;
[errcode] = MSXsetconstant(index, value);
[errcode, value] = MSXgetconstant(index);


type=MSX_CONSTANT.MSX_LINK;
index =1;
param = 1;
[errcode, value] = MSXgetparameter(type,index,param);
value = 3;
[errcode] = MSXsetparameter(type, index, param, value);
[errcode, value] = MSXgetparameter(type,index,param);

species = 1;
[errcode, value] = MSXgetqual(type,index,species);
[errcode, value] = MSXgetinitqual(type,index,species);
value = value+3;
[errcode] = MSXsetinitqual(type,index,species,value);
[errcode, value] = MSXgetinitqual(type,index,species);

[errcode, type, units, atol, rtol] = MSXgetspecies(index);
[errcode,count] = MSXgetcount(MSX_CONSTANT.MSX_SPECIES);

[errcode,errmsg] = MSXgeterror(501,80);

[errcode] = MSXsavemsxfile('msxsavedtest.msx');
[errcode] = MSXreport();
MSXclose();

[errcode] = MSXopen('net2-cl2.msx');
[errcode] = MSXusehydfile('test.hyd');
[errcode] = MSXinit(0);
tleft=1;
while (tleft > 0 && errcode == 0)
    [errcode, t, tleft] = MSXstep();
    
    % Use MSXgetqual to retrieve results at time t
    [errcode, value] = MSXgetqual(MSX_CONSTANT.MSX_NODE,1,1);
    [errcode, value] = MSXgetqual(MSX_CONSTANT.MSX_LINK,1,1);

end

[errcode] = MSXreport();


% close the toolkits

MSXclose();
ENclose();

ENMatlabCleanup();
MSXMatlabCleanup();
