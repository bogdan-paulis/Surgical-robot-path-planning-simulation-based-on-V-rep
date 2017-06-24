function [jointPos] = vrep_getjointPos(clientID,jointHandler, opmod)
%VREP_GETQ Summary of this function goes here
%   Detailed explanation goes here
global vrep;
 [returnCode ,jointPos] = vrep.simxGetJointPosition(clientID,jointHandler, opmod);

% q= ones(1,6);
end

