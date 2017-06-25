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
    
    [returnCode, trcar] = vrep.simxGetObjectHandle(clientID,'STL_Trcar',vrep.simx_opmode_blocking);
    [returnCode, ref1] = vrep.simxGetObjectHandle(clientID,'STL_Imported_sub38',vrep.simx_opmode_blocking);
    [returnCode, ref2] = vrep.simxGetObjectHandle(clientID,'Base1',vrep.simx_opmode_blocking);
    [returnCode, needle] = vrep.simxGetObjectHandle(clientID,'STL_Imported_sub5',vrep.simx_opmode_blocking);
    
    %entry is the entrypoint to the trcar
    [returnCode, entry] = vrep.simxGetObjectHandle(clientID,'STL_Imported_sub0',vrep.simx_opmode_blocking);
    %exit is the exitpoint of the trcar and the point through which the
    %needle must go at all times
    [returnCode, exit] = vrep.simxGetObjectHandle(clientID,'STL_Imported_sub10',vrep.simx_opmode_blocking);
    
    %Get the point coordinates in relation to ref1
    [returnCode,entryPoint] = vrep.simxGetObjectPosition(clientID,entry,ref1, vrep.simx_opmode_blocking);
    [returnCode,exitPoint] = vrep.simxGetObjectPosition(clientID,exit,ref1, vrep.simx_opmode_blocking);
    
    %Compute the distance between S21 and S22 for the correct angle
    dist1 = (abs(exitPoint(3) - entryPoint(3)) / abs(exitPoint(2) - entryPoint(2))) * 0.017;
    dist2 = (abs(exitPoint(1) - entryPoint(1)) / sqrt((exitPoint(2) - entryPoint(2))^2 + (exitPoint(3) - entryPoint(3))^2)) * 0.017;
    
    [returnCode, s21pos] = vrep.simxGetObjectPosition(clientID,prismaticJointS21,ref1,vrep.simx_opmode_blocking);
    [returnCode, s22pos] = vrep.simxGetObjectPosition(clientID,prismaticJointS22,ref1,vrep.simx_opmode_blocking);
    
    currDist1 = s21pos - s22pos;
    joint1 = dist1 + currDist1(3);
    [returnCode] = vrep.simxSetJointTargetPosition(clientID, prismaticJointS22,joint1,vrep.simx_opmode_blocking);
    pause(2);
    
    %TODO IMPORTANT: Currently it is assumed that s11 and s12 are are both in the same position
    
    [returnCode, s11pos] = vrep.simxGetObjectPosition(clientID,prismaticJointS11,ref1,vrep.simx_opmode_blocking);
    [returnCode, s12pos] = vrep.simxGetObjectPosition(clientID,prismaticJointS12,ref1,vrep.simx_opmode_blocking);
    
    currDist2 = s11pos-s12pos;
    joint2 = dist2;
    [returnCode] = vrep.simxSetJointTargetPosition(clientID,prismaticJointS12,joint2,vrep.simx_opmode_blocking);
    pause(2);
    
    %Get the needle close to the eye to reduce errors
    [returnCode] = vrep.simxSetJointTargetPosition(clientID, prismaticJointS01,0.015,vrep.simx_opmode_blocking);
    pause(2);
    
    %Now, compute the coordinates of the point where the needletip needs to
    %be for entry into the eye
    [returnCode, tipPos] = vrep.simxGetObjectPosition(clientID,needleTip,ref1,vrep.simx_opmode_blocking);
    %Adjust the needle, so we have its center
    tipPos = tipPos + [-0.0004, 0, 0.0005];
    v = entryPoint - exitPoint;
    t = (tipPos(2) - exitPoint(2)) / v(2);
    targetPoint = exitPoint + t * v;
    moveVec = targetPoint - tipPos;
    
    [returnCode, s21curr] = vrep.simxGetJointPosition(clientID,prismaticJointS21,vrep.simx_opmode_blocking);
    [returnCode, s22curr] = vrep.simxGetJointPosition(clientID,prismaticJointS22,vrep.simx_opmode_blocking);
    
    [returnCode] = vrep.simxSetJointTargetPosition(clientID, prismaticJointS21,-moveVec(3) - s21curr,vrep.simx_opmode_blocking);
    [returnCode] = vrep.simxSetJointTargetPosition(clientID, prismaticJointS22,moveVec(3) + s22curr,vrep.simx_opmode_blocking);
    
    pause(4);
    
    [returnCode, s11curr] = vrep.simxGetJointPosition(clientID,prismaticJointS11,vrep.simx_opmode_blocking);
    [returnCode, s12curr] = vrep.simxGetJointPosition(clientID,prismaticJointS12,vrep.simx_opmode_blocking);
    
    [returnCode] = vrep.simxSetJointTargetPosition(clientID, prismaticJointS11,moveVec(1) + s11curr,vrep.simx_opmode_blocking);
    [returnCode] = vrep.simxSetJointTargetPosition(clientID, prismaticJointS12,-moveVec(1) + s12curr,vrep.simx_opmode_blocking);
    
    pause(10);
    
    [returnCode] = vrep.simxSetJointTargetPosition(clientID, prismaticJointS01,0.02,vrep.simx_opmode_blocking);
    
    % Close connection
    vrep.simxFinish(-1);
    
end

% Delete vrep object
vrep.delete();