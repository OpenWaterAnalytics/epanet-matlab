function [errcode, version] = ENgetversion()
% Declaration:
% [errcode version] =  ENgetversion( )
% 
% Description:
% Retrieves the EPANET code version
% 
% Arguments:
% version:   The EPANET code version
% 
% Returns:
% Returns an error code.
% 

global ENDLLNAME;
version=int32(0);
%p=libpointer('int32Ptr',version);
[errcode,version]=calllib(ENDLLNAME,'ENgetversion',version);
if errcode ENerror(errcode); end
%version=get(p,'Value');
