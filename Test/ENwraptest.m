
global EN_CONSTANT

%start epanet
%exist('epanet2.dll')%returns 3 MEX-file on MATLAB's search path seems to be right
%exist('epanet2.h')%return 2
[errcode]=ENMatlabSetup('epanet2','epanet2.h');% seems to work
%check with
%libisloaded('epanet2')% returns 1 =true
%libfunctions('epanet2', '-full')%shows libaryfunction loaded

%start MSX
%exist('epanetmsx.dll')%returns 3 MEX-file on MATLAB's search path seems to be right
%exist('epanetmsx.h')
%open MSX
%MSXMatlabSetup('epanetmsx','epanetmsx.h');

%libisloaded('epanetmsx')% returns 1 =true
%libfunctions('epanetmsx', '-full')%shows libaryfunction loaded

%export Epanet inp file (network) example network Net1.net in order to use ENopen:
exist('Net2.inp');% returns 2
%export Epanet inp file (network) example network Net1.net in order to use ENopen:
%exist('net3-bio.msx')% returns 2

%call ENopen
[errcode] = ENopen('Net2.inp', 'TEST.rpt', '');
% Open the MSX toolkit

%[errcode] = MSXopen('net3-bio.msx')
%[errcode,errmsg] = MSXgeterror(501,80);

% Hydraulic analysis
[errcode] = ENsolveH();
[errcode] = ENsaveH();
[errcode] = ENsavehydfile('Net2test.hyd');

%[errcode]= calllib('epanet2','ENsavehydfile','net3-bio.hyd');
%????????????does not save hydraulic results?????
[errcode] = ENusehydfile('Net2test.hyd');

[errcode] = ENsolveQ();

[errcode] = ENwriteline('KKKKKKKKKKKKK');

[errcode] = ENresetreport();
str = 'STATUS YES';
[errcode] = ENsetreport(str);
[errcode] = ENsetstatusreport(0);
[errcode] = ENreport();

id = '1';
[errcode, index] = ENgetpatternindex(id);
index = 2;
[errcode, id] = ENgetpatternid(index);

[errcode, value] = ENgetoption(EN_CONSTANT.EN_TOLERANCE);
value = 0.0200;
[errcode] = ENsetoption(EN_CONSTANT.EN_TOLERANCE,value);
%[errcode, value] = ENgetoptionnolib(EN_CONSTANT.EN_TOLERANCE);
[errcode, value] = ENgetoption(EN_CONSTANT.EN_TOLERANCE);
[errcode, numctrls] = ENgetcount(EN_CONSTANT.EN_CONTROLCOUNT);
 for (i=1:1:numctrls)  
   [errcode, ctype,lindex,setting,nindex,level] = ENgetcontrol(i); 
   level = 101;
   lindex = 1;
   if (ctype == EN_CONSTANT.EN_LOWLEVEL && lindex == 1)  
       [errcode] = ENsetcontrol(i,ctype,lindex,setting,nindex,level);
       [errcode, ctype,lindex,setting,nindex,level] = ENgetcontrol(i);
   end; 
 end; 

 
[errcode,unitscode] = ENgetflowunits();
index = 1;
[errcode,id] = ENgetlinkid(index);
id = '20';

[errcode,index] = ENgetlinkindex(id);
[errcode, type] = ENgetlinktype(index);
[errcode, value] = ENgetlinkvalue(index,EN_CONSTANT.EN_LENGTH);
value = value+100;
[errcode] = ENsetlinkvalue(index, EN_CONSTANT.EN_LENGTH, value);
[errcode, value] = ENgetlinkvalue(index,EN_CONSTANT.EN_LENGTH);

[errcode,from,to] = ENgetlinknodes(30);
[errcode,from1,to1] = ENgetalllinknodes();

[errcode, index] = ENgetnodeindex(id);
[errcode,id] = ENgetnodeid(index);
[errcode, type] = ENgetnodetype(index);
[errcode, value] = ENgetnodevalue(index, EN_CONSTANT.EN_BASEDEMAND);
value = value+4;
[errcode] = ENsetnodevalue(index, EN_CONSTANT.EN_BASEDEMAND, value);
[errcode, value] = ENgetnodevalue(index, EN_CONSTANT.EN_BASEDEMAND);

[nnodes,ntanks,nlinks,npats,ncurves,ncontrols,errcode] = ENgetnetsize();
% close the toolkits

id='2';
[errcode, index] = ENgetpatternindex(id);
[errcode, len] = ENgetpatternlen(index);
[errcode, value] = ENgetpatternvalue(index, 1);
facts=[1,2,3,4,5];
[errcode] = ENsetpattern(index, facts, 5);
[errcode, value] = ENgetpatternvalue(index, 1);
[errcode] = ENsetpatternvalue(index, 1, 80);
[errcode, value] = ENgetpatternvalue(index, 1);

[e, errmsg] = ENgeterror(101);

[errcode,timevalue] = ENgettimeparam(EN_CONSTANT.EN_HYDSTEP);
timevalue = timevalue +4;
[errcode] = ENsettimeparam(EN_CONSTANT.EN_HYDSTEP,timevalue);
[errcode,timevalue] = ENgettimeparam(EN_CONSTANT.EN_HYDSTEP );

[errcode,qualcode,tracenode] = ENgetqualtype();
tracenode = '0';
[errcode] = ENsetqualtype(qualcode,'Pb','pfu',tracenode)
[errcode,qualcode,tracenode] = ENgetqualtype();

[errcode] = ENsaveinpfile('ENtest.inp');

ENclose();

[errcode] = ENopen('Net2.inp', 'TESTst.rpt', '');
[errcode] = ENopenH();
[errcode] = ENinitH(1);

[errcode,step] = ENnextH();
while(step > 0 && errcode == 0)
    [errcode,t] = ENrunH();
    [errcode,step] = ENnextH();
end;
[errcode] = ENsavehydfile('Net2test2.hyd');
[errcode] = ENcloseH();

ENclose();

[errcode] = ENopen('Net2.inp', 'TESTst.rpt', '');

[errcode] = ENusehydfile('Net2test2.hyd');
[errcode] = ENopenQ();
[errcode] = ENinitQ(1);
[errcode,tstep] = ENnextQ();
%step 0 why
while(tstep > 0 && errcode == 0)   
    [errcode,t] = ENrunQ();
    [errcode,tstep] = ENnextQ(); 
end;
[errcode] = ENcloseQ();

ENclose();
ENMatlabCleanup();

