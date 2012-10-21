function [errcode] = ENsetoption(optioncode,value)
% Declaration:
% [errcode] = ENsetoption(optioncode,value)
% 
% Description:
%  Sets the value of a particular analysis option.   
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
% ENgetoption 
%
% Version 2.00.07 (August 2008)


global ENDLLNAME;
global EN_CONSTANT;

optioncode=int32(optioncode);
value=single(value);

[errcode]=calllib(ENDLLNAME,'ENsetoption',optioncode,value);
if errcode ENerror(errcode); end





