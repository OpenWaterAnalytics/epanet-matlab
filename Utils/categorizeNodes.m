function [errcode,Itank,Ijunc] = categorizeNodes(nnodes)
% Constructs binary arrays Itank and Ijunc that record whether or not each
% node is a tank node or a junction node.
global EN_CONSTANT;

Itank = false(nnodes,1);
Ijunc = false(nnodes,1);
for i=1:nnodes
    [errcode, type] = ENgetnodetype(i);
    if errcode return; end
    if type == EN_CONSTANT.EN_JUNCTION
        Ijunc(i) = true;
    else
        Itank(i) = true;
    end
end
