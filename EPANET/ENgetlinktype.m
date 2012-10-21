function [errcode, type] = ENgetlinktype(index)
% Declaration:
% [errcode, type] = ENgetlinktype(index)
% 
% Description:
%  Retrieves the link-type code for a specific link.  
% 
% Arguments:
%  index:	link index
%  typecode:	link-type code (see below)
% 
% Returns:
% Returns an error code.
% 
% Notes:
%  Link indexes are consecutive integers starting from 1.  
%  Link type codes consist of the following constants:  
%   EN_CVPIPE   0   Pipe with Check Valve 
%   EN_PIPE     1   Pipe 
%   EN_PUMP     2   Pump 
%   EN_PRV      3   Pressure Reducing Valve 
%   EN_PSV      4   Pressure Sustaining Valve 
%   EN_PBV      5   Pressure Breaker Valve 
%   EN_FCV      6   Flow Control Valve 
%   EN_TCV      7   Throttle Control Valve 
%   EN_GPV      8   General Purpose Valve 
%
%See Also: 
% ENgetlinkindex  
% 
% Version 2.00.07 (January 2001)

global ENDLLNAME;
type=int32(0);
%p=libpointer('int32Ptr',type);
index=int32(index);
[errcode,type]=calllib(ENDLLNAME,'ENgetlinktype',index,type);
if errcode ENerror(errcode); end
%type=get(p,'Value');
