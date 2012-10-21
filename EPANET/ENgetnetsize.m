function [nnodes,ntanks,nlinks,npats,ncurves,ncontrols,errcode] = ENgetnetsize()
% Declaration:
% [nnodes,ntanks,nlinks,npats,ncurves,ncontrols,errcode] = ENgetnetsize()
%
% PURPOSE:
%   Retreive number of network components
%
% NOTES:
% Called by ENopen()
%
% OUTPUT:
%   nnodes       number of network nodes
%   ntanks       number of network tanks/reservoirs
%   nlinks       number of network links
%   npats        number of time patterns
%   ncurves      number of curves
%   ncontrols    number of simple controls
%   errcode      epanet error code

global ENDLLNAME;
global EN_CONSTANT;

nnodes=int32(0);
p=libpointer('int32Ptr',nnodes);
[errcode]=calllib(ENDLLNAME,'ENgetcount',EN_CONSTANT.EN_NODECOUNT,p);
if errcode ENerror(errcode); end
nnodes=get(p,'Value');

ntanks=int32(0);
p=libpointer('int32Ptr',ntanks);
[errcode]=calllib(ENDLLNAME,'ENgetcount',EN_CONSTANT.EN_TANKCOUNT,p);
if errcode ENerror(errcode); end
ntanks=get(p,'Value');

nlinks=int32(0);
p=libpointer('int32Ptr',nlinks);
[errcode]=calllib(ENDLLNAME,'ENgetcount',EN_CONSTANT.EN_LINKCOUNT,p);
if errcode ENerror(errcode); end
nlinks=get(p,'Value');

npats=int32(0);
p=libpointer('int32Ptr',npats);
[errcode]=calllib(ENDLLNAME,'ENgetcount',EN_CONSTANT.EN_PATCOUNT,p);
if errcode ENerror(errcode); end
npats=get(p,'Value');

ncurves=int32(0);
p=libpointer('int32Ptr',ncurves);
[errcode]=calllib(ENDLLNAME,'ENgetcount',EN_CONSTANT.EN_CURVECOUNT,p);
if errcode ENerror(errcode); end
ncurves=get(p,'Value');

ncontrols=int32(0);
p=libpointer('int32Ptr',ncontrols);
[errcode]=calllib(ENDLLNAME,'ENgetcount',EN_CONSTANT.EN_CONTROLCOUNT,p);
if errcode ENerror(errcode); end
ncontrols=get(p,'Value');
