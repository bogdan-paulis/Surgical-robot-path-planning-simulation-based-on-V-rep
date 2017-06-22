function returnCode = cmdPrismaticJointS22(jointPos)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
    global vrep clientID prismaticJointS22;
    [returnCode] = vrep.simxSetJointTargetPosition(clientID, prismaticJointS22, jointPos,vrep.simx_opmode_blocking);

end
