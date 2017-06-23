function [ out ] = Vrep_setJointPos( clientID,jointHandler, jointPos, opmode )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
 %global vrep clientID prismaticJointS22;
 % vrep.simx_opmode_blocking
 %vrep object
 %client Id from Vrep
 % joint handler: example prismaticJointS22
 %joinPos[rad]
 %position mode
 global vrep;
 
 [out] = vrep.simxSetJointTargetPosition(clientID, jointHandler, jointPos,opmode);

 

end

