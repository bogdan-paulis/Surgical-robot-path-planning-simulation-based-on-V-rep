function [ returnCode ] = Vrep_setJointTargetPos( clientID,jointHandler, jointPos, opmode )
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

  [returnCode] = vrep.simxSetJointTargetPosition(clientID, jointHandler, jointPos,opmode);
  if returnCode ~= vrep.simx_return_ok 
      vrep_checkReturnCode( returnCode, 'Vrep_setJointPos');
  end
  
end

