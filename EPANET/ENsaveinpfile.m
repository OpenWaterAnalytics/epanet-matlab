function [errcode] = ENsaveinpfile(inpname)
% Declaration:
% [errcode] = ENsaveinpfile(inpname)
% 
% Description:
% 
% Writes all current network input data to a file using the format of an EPANET input file.
% 
% Arguments:
% 
% fname:	name of the file where data is saved.
% Returns:
% 
% Returns an error code.
% 
% Notes:
% 
% The data saved reflect any changes made by calls to the ENsetxxx family of 
% functions since EPANET data was first loaded using ENopen. 
% 
global ENDLLNAME;
%global EN_CONSTANT;
errcode=calllib(ENDLLNAME,'ENsaveinpfile',inpname);
if errcode ENerror(errcode); end
