function [errcode, type] = ENgetnodetype(index)
% Declaration:
% [errcode type] =  ENgetnodetype( int index )
% 
% Description:
% Retrieves the node-type code for a specific node.
% 
% Arguments:
% index:	node index
% typecode:	node-type code (see below)
% 
% Returns:
% Returns an error code.
% 
% Notes:
% Node indexes are consecutive integers starting from 1.
% Node type codes consist of the following constants:
% 
% EN_JUNCTION	0	Junction node
% EN_RESERVOIR	1	Reservoir node
% EN_TANK	2	Tank node
% 
% Version 2.00.07 (January 2001)

global ENDLLNAME;
type=int32(0);
p=libpointer('int32Ptr',type);
index=int32(index);
[errcode]=calllib(ENDLLNAME,'ENgetnodetype',index,p);
if errcode ENerror(errcode); end
type=get(p,'Value');
