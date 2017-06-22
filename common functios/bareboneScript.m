% V-REP Matlab Surgical Robot

vrep=remApi('remoteApi'); % using the prototype file (remoteApiProto.m)
vrep.simxFinish(-1); % just in case, close all opened connections
clientID=vrep.simxStart('127.0.0.1',19999,true,true,5000,5);

if (clientID>-1)
    disp('Connected');
    
    % code
    
    % Handles
    [returnCode,needleTip] = vrep.simxGetObjectHandle(clientID,'NeedleTip',vrep.simx_opmode_blocking);
    
    [returnCode,prismaticJointS22] = vrep.simxGetObjectHandle(clientID,'Prismatic_joint_S22',vrep.simx_opmode_blocking);
    [returnCode,prismaticJointS21] = vrep.simxGetObjectHandle(clientID,'Prismatic_joint_S21',vrep.simx_opmode_blocking);
    [returnCode,prismaticJointS11] = vrep.simxGetObjectHandle(clientID,'Prismatic_joint_S11',vrep.simx_opmode_blocking);
    [returnCode,prismaticJointS12] = vrep.simxGetObjectHandle(clientID,'Prismatic_joint_S12',vrep.simx_opmode_blocking);

    [returnCode,prismaticJointS00] = vrep.simxGetObjectHandle(clientID,'Prismatic_joint_S00',vrep.simx_opmode_blocking);
    [returnCode,prismaticJointS01] = vrep.simxGetObjectHandle(clientID,'Prismatic_joint_S01',vrep.simx_opmode_blocking);
   
    % First read from V-REP of a particular object position
 	[returnCode,needleTipPos] = vrep.simxGetObjectPosition(clientID,needleTip,-1, vrep.simx_opmode_streaming);
    
    % Further reads of the same object position
    [returnCode,needleTipPos] = vrep.simxGetObjectPosition(clientID,needleTip,-1, vrep.simx_opmode_buffer);

    % Set joint position
    joint1 = 0.01;
    [returnCode] = vrep.simxSetJointTargetPosition(clientID, prismaticJointS22,joint1,vrep.simx_opmode_blocking);

    pause(2);
    % end code
    
    % Close connection
    vrep.simxFinish(-1);
    
end

% Delete vrep object
vrep.delete();