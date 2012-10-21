function [errcode,from,to] = ENgetalllinknodes()
% Declaration:
% [errcode,from,to]=ENgetalllinknodes()
%
% Description:
% Gets the node indices associated with all network links
%
% Returns:
% Returns integer lists (from,to) of node indices, in link index order.
% Returns an error code.
%
% Notes:
% Not toolkit function written for matlab. Uses ENgetlinknodes
%
% See Also:
% ENgetlinknodes
%
global ENDLLNAME;
%global EN_CONSTANT;
global EN_SIZE;

fval1=int32(0);
fval2=int32(0);
p1=libpointer('int32Ptr',fval1);
p2=libpointer('int32Ptr',fval2);
i=int32(1);
from=int32(zeros(EN_SIZE.nlinks,1));
to=int32(zeros(EN_SIZE.nlinks,1));
for i=1:EN_SIZE.nlinks
    [errcode]=calllib(ENDLLNAME,'ENgetlinknodes',i,p1,p2);
    if errcode ENerror(errcode); end
    from(i)=get(p1,'Value');
    to(i)=get(p2,'Value');
end
