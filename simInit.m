% V-REP Simulink Surgical Robot Init

global vrep clientID tunicExt tunicInt retinaPoint1 retinaPoint2;
global retinaPoint3 retinaPoint4 needleTip;
global prismaticJointS22 prismaticJointS21 prismaticJointS11 
global prismaticJointS12 prismaticJointS00 prismaticJointS01

vrep=remApi('remoteApi'); % using the prototype file (remoteApiProto.m)
vrep.simxFinish(-1); % just in case, close all opened connections
clientID=vrep.simxStart('127.0.0.1',19999,true,true,5000,5);

if (clientID>-1)
    disp('Connected');
    
    % code
    
    % Parameters
    minJointPos = -15 * 10^(-3); %-0.015; % -15mm
    maxJointPos = 15 * 10^(-3); % 0.015;  % +15mm
    jointPrecision = 1 * 10^(-6); % 1um
    transientTime = 0.1; % time until considered steady-state;
    
    % Handles
    [returnCode,tunicExt] = vrep.simxGetObjectHandle(clientID,'STL_Imported_sub0',vrep.simx_opmode_blocking);
    [returnCode,tunicInt] = vrep.simxGetObjectHandle(clientID,'STL_Imported_sub10',vrep.simx_opmode_blocking);
    [returnCode,retinaPoint1] = vrep.simxGetObjectHandle(clientID,'STL_Imported_sub4',vrep.simx_opmode_blocking);
    [returnCode,retinaPoint2] = vrep.simxGetObjectHandle(clientID,'STL_Imported_sub6',vrep.simx_opmode_blocking);
    [returnCode,retinaPoint3] = vrep.simxGetObjectHandle(clientID,'STL_Imported_sub8',vrep.simx_opmode_blocking);
    [returnCode,retinaPoint4] = vrep.simxGetObjectHandle(clientID,'STL_Imported_sub9',vrep.simx_opmode_blocking);
    [returnCode,needleTip] = vrep.simxGetObjectHandle(clientID,'NeedleTip',vrep.simx_opmode_blocking);
    
    [returnCode,prismaticJointS22] = vrep.simxGetObjectHandle(clientID,'Prismatic_joint_S22',vrep.simx_opmode_blocking);
    [returnCode,prismaticJointS21] = vrep.simxGetObjectHandle(clientID,'Prismatic_joint_S21',vrep.simx_opmode_blocking);
    [returnCode,prismaticJointS11] = vrep.simxGetObjectHandle(clientID,'Prismatic_joint_S11',vrep.simx_opmode_blocking);
    [returnCode,prismaticJointS12] = vrep.simxGetObjectHandle(clientID,'Prismatic_joint_S12',vrep.simx_opmode_blocking);
    [returnCode,prismaticJointS00] = vrep.simxGetObjectHandle(clientID,'Prismatic_joint_S00',vrep.simx_opmode_blocking);
    [returnCode,prismaticJointS01] = vrep.simxGetObjectHandle(clientID,'Prismatic_joint_S01',vrep.simx_opmode_blocking);

    
end