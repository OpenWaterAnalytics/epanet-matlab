function [errcode, value] = ENgetoption(optioncode)
% Declaration:
% [errcode, value] = ENgetoption(optioncode)
% 
% Description:
%   Retrieves the value of a particular analysis option.     
% 
%Arguments: 
%  optioncode: an option code (see below) 
%  value: an option value 
%
% Returns:
%  Returns an error code.
% 
%Notes:
%  Option codes consist of the following constants: 
%
%   EN_TRIALS       0  
%   EN_ACCURACY     1 
%   EN_TOLERANCE    2  
%   EN_EMITEXPON    3 
%   EN_DEMANDMULT   4   
%
%See Also:
% ENsetoption
%
% Version 2.00.07 (August 2008)


global ENDLLNAME;
global EN_CONSTANT;

value=single(0);
pvalue=libpointer('singlePtr',value);
optioncode=int32(optioncode);
[errcode]=calllib(ENDLLNAME,'ENgetoption',optioncode,pvalue);
if errcode ENerror(errcode); end

value=get(pvalue,'Value');





