function [errcode,index] = ENgetnodeindex(id)
% Declaration:
% [errcode, index] = ENgetnodeindex(id)
% 
% Description:
% Retrieves the index of a node with a specified ID.
% 
% Arguments:
% id:	node ID label
% index:	node index
% 
% Returns:
% Returns an error code.
% 
% Notes:
% Node indexes are consecutive integers starting from 1.
% 
% See Also:  
% ENgetnodeid
% 
% Version 2.00.07 (January 2001)

global ENDLLNAME;
%global EN_CONSTANT;
index=int32(0);
%pidx=libpointer('int32Ptr',index);
[errcode, id, index]=calllib(ENDLLNAME,'ENgetnodeindex',id,index);
if errcode ENerror(errcode); end
%index=get(pidx,'Value');
