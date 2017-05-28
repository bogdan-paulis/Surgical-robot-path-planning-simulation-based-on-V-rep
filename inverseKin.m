function inverseKin( dx,dy,dz )
%inverseKin
%send the corect values
%TODO get corect readings


vrep=remApi('remoteApi'); % using the prototype file (remoteApiProto.m)
vrep.simxFinish(-1); % just in case, close all opened connections
clientID=vrep.simxStart('127.0.0.1',19999,true,true,5000,5);


if (clientID>-1)
    disp('Connected');
    % code
    
    % Handles
    [returnCode,trcar] = vrep.simxGetObjectHandle(clientID,'STL_Trcar',vrep.simx_opmode_blocking);
    [returnCode,needleTip] = vrep.simxGetObjectHandle(clientID,'NeedleTip',vrep.simx_opmode_blocking);
    
    [returnCode,prismaticJointS22] = vrep.simxGetObjectHandle(clientID,'Prismatic_joint_S22',vrep.simx_opmode_blocking);
    [returnCode,prismaticJointS21] = vrep.simxGetObjectHandle(clientID,'Prismatic_joint_S21',vrep.simx_opmode_blocking);
    [returnCode,prismaticJointS11] = vrep.simxGetObjectHandle(clientID,'Prismatic_joint_S11',vrep.simx_opmode_blocking);
    [returnCode,prismaticJointS12] = vrep.simxGetObjectHandle(clientID,'Prismatic_joint_S12',vrep.simx_opmode_blocking);
    
    %[returnCode,prismaticJointS00] = vrep.simxGetObjectHandle(clientID,'Prismatic_joint_S00',vrep.simx_opmode_blocking);
    [returnCode,prismaticJointS01] = vrep.simxGetObjectHandle(clientID,'Prismatic_joint_S01',vrep.simx_opmode_blocking);
    
    % First read from V-REP of a particular object position
    [returnCode,trcarPos] = vrep.simxGetObjectPosition(clientID,trcar,-1, vrep.simx_opmode_streaming);
    pause(0.1);
     % Further reads of the same object position
    [returnCode,trcarPos] = vrep.simxGetObjectPosition(clientID,trcar,-1, vrep.simx_opmode_buffer);
    
    [returnCode,needleTipPos] = vrep.simxGetObjectPosition(clientID,needleTip,-1, vrep.simx_opmode_streaming);
    pause(0.1);
    [returnCode,needleTipPos] = vrep.simxGetObjectPosition(clientID,needleTip,-1, vrep.simx_opmode_buffer);


   
    [returnCode,prismaticJointS22Pos] = vrep.simxGetJointPosition(clientID,prismaticJointS22, vrep.simx_opmode_streaming);
    pause(0.1);
    [returnCode,prismaticJointS22Pos] = vrep.simxGetJointPosition(clientID,prismaticJointS22, vrep.simx_opmode_buffer)

    [returnCode,prismaticJointS21Pos] = vrep.simxGetJointPosition(clientID,prismaticJointS21, vrep.simx_opmode_streaming);
    pause(0.1);
    [returnCode,prismaticJointS21Pos] = vrep.simxGetJointPosition(clientID,prismaticJointS21, vrep.simx_opmode_buffer)

    
    
    [returnCode,prismaticJointS11Pos] = vrep.simxGetJointPosition(clientID,prismaticJointS11, vrep.simx_opmode_streaming);
    pause(0.1);
    [returnCode,prismaticJointS11Pos] = vrep.simxGetJointPosition(clientID,prismaticJointS11, vrep.simx_opmode_buffer);
    
    [returnCode,prismaticJointS12Pos] = vrep.simxGetJointPosition(clientID,prismaticJointS12, vrep.simx_opmode_streaming);
    pause(0.1);
    [returnCode,prismaticJointS12Pos] = vrep.simxGetJointPosition(clientID,prismaticJointS12, vrep.simx_opmode_buffer);
    
    [returnCode,prismaticJointS01Pos] = vrep.simxGetJointPosition(clientID,prismaticJointS01, vrep.simx_opmode_streaming);
    pause(0.1);
    [returnCode,prismaticJointS01Pos] = vrep.simxGetJointPosition(clientID,prismaticJointS01, vrep.simx_opmode_buffer);
    
    
    
    % Set joint position
    d=0.017;
    needleEyeD=pdist([needleTipPos;trcarPos]);
    D=1000;
    s22=0.0071;
    s21=-0.0120;
    s11=0;
    s12=0;
    
    joint2=prismaticJointS22Pos+dx;
    [returnCode] = vrep.simxSetJointTargetPosition(clientID, prismaticJointS22, joint2,vrep.simx_opmode_blocking);
    %theta1=atan((eyeX-joint2)/eyeDx);
    %joint1=joint2-d*tan(theta1);
    temp1=(joint2-s22)*(D-d)/D;
    joint1=s21-temp1;
    %joint1=prismaticJointS21Pos-dx;
    [returnCode] = vrep.simxSetJointTargetPosition(clientID, prismaticJointS21, joint1,vrep.simx_opmode_blocking);
    
    joint3=prismaticJointS11Pos+dy;
    [returnCode] = vrep.simxSetJointTargetPosition(clientID, prismaticJointS11, joint3,vrep.simx_opmode_blocking);
    %theta2=atan((joint3-eyeY)/eyeDy);
    %joint4=joint3+d*tan(theta2);
    temp2=(joint3-s11)*(D-d)/D;
    joint4=s12-temp2;
    %joint4=prismaticJointS12Pos-dy;
    [returnCode] = vrep.simxSetJointTargetPosition(clientID, prismaticJointS12, joint4,vrep.simx_opmode_blocking);
 
    [returnCode] = vrep.simxSetJointTargetPosition(clientID, prismaticJointS01, prismaticJointS01Pos+dz,vrep.simx_opmode_blocking);
    
    %pause(2);
    % end code
    
    % Close connection
    vrep.simxFinish(-1);
    
end



end

