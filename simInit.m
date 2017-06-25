% V-REP Simulink Surgical Robot Init

disp('V-Rep Simulation should be running before starting this script');
global vrep clientID tunicExt tunicInt retinaPoint1 retinaPoint2;
global retinaPoint3 retinaPoint4 needleTip;
global prismaticJointS22 prismaticJointS21 prismaticJointS11 
global prismaticJointS12 prismaticJointS00 prismaticJointS01
global revoluteJointS21 revoluteJointS22 revoluteJointS11

%read key points for path planning
import_data;

vrep=remApi('remoteApi'); % using the prototype file (remoteApiProto.m)
vrep.simxFinish(-1); % just in case, close all opened connections
clientID=vrep.simxStart('127.0.0.1',19999,true,true,5000,5);
mode= vrep.simx_opmode_blocking;
if (clientID>-1)
    disp('Connected');
    
    % code
    
    % Parameters
    minJointPos = -15 * 10^(-3); %-0.015; % -15mm
    maxJointPos = 15 * 10^(-3); % 0.015;  % +15mm
    jointPrecision = 1 * 10^(-6); % 1um
    transientTime = 0.1; % time until considered steady-state;
    blocking= vrep.simx_opmode_blocking;
    oneShot=vrep.simx_opmode_oneshot;
      
    % Handles
    [returnCode,tunicExt] = vrep.simxGetObjectHandle(clientID,'STL_Imported_sub0',mode);
    vrep_checkReturnCode( returnCode, 'tunicExt');
    
    [returnCode,tunicInt] = vrep.simxGetObjectHandle(clientID,'STL_Imported_sub10',mode);
    vrep_checkReturnCode( returnCode, 'tunicInt');
    
    [returnCode,retinaPoint1] = vrep.simxGetObjectHandle(clientID,'STL_Imported_sub4',mode);
    vrep_checkReturnCode( returnCode, 'retinaPoint1');
    
    [returnCode,retinaPoint2] = vrep.simxGetObjectHandle(clientID,'STL_Imported_sub6',mode);
    vrep_checkReturnCode( returnCode, 'retinaPoint2');
    
    [returnCode,retinaPoint3] = vrep.simxGetObjectHandle(clientID,'STL_Imported_sub8',mode);
    vrep_checkReturnCode( returnCode, 'retinaPoint3');
    
    [returnCode,retinaPoint4] = vrep.simxGetObjectHandle(clientID,'STL_Imported_sub9',mode);
    vrep_checkReturnCode( returnCode, 'retinaPoint4');
    
    [returnCode,needleTip] = vrep.simxGetObjectHandle(clientID,'NeedleTip',mode);
    vrep_checkReturnCode( returnCode, 'needleTip');
    
    [returnCode,prismaticJointS22] = vrep.simxGetObjectHandle(clientID,'Prismatic_joint_S22',mode);
    vrep_checkReturnCode( returnCode, 'prismaticJointS22');
    
    [returnCode,prismaticJointS21] = vrep.simxGetObjectHandle(clientID,'Prismatic_joint_S21',mode);
    vrep_checkReturnCode( returnCode, 'prismaticJointS21');
    
    [returnCode,prismaticJointS11] = vrep.simxGetObjectHandle(clientID,'Prismatic_joint_S11',mode);
    vrep_checkReturnCode( returnCode, 'prismaticJointS11');
    
    [returnCode,prismaticJointS12] = vrep.simxGetObjectHandle(clientID,'Prismatic_joint_S12',mode);
    vrep_checkReturnCode( returnCode, 'prismaticJointS12');
    
    [returnCode,prismaticJointS00] = vrep.simxGetObjectHandle(clientID,'Prismatic_jointS00',mode);
    vrep_checkReturnCode( returnCode, 'prismaticJointS00');
    
    [returnCode,prismaticJointS01] = vrep.simxGetObjectHandle(clientID,'Prismatic_joint_S01',mode);
    vrep_checkReturnCode( returnCode, 'prismaticJointS01');
    %%rotational joints
    
    [returnCode,revoluteJointS21] = vrep.simxGetObjectHandle(clientID,'Revolute_joint_S21',mode);
    vrep_checkReturnCode( returnCode, 'revoluteJointS21');
    
    [returnCode,revoluteJointS22] = vrep.simxGetObjectHandle(clientID,'Revolute_joint_S22',mode);
    vrep_checkReturnCode( returnCode, 'revoluteJointS22');
    
    [returnCode,revoluteJointS11] = vrep.simxGetObjectHandle(clientID,'Revolute_joint_S11',mode);
    vrep_checkReturnCode( returnCode, 'revoluteJointS11');
    
    
    
  
    
    % First read from V-REP of a particular object position
    [returnCode,prismaticJointS22Pos] = vrep.simxGetJointPosition(clientID,prismaticJointS22, mode);
    vrep_checkReturnCode( returnCode, 'prismaticJointS22Pos');
    
    [returnCode,prismaticJointS21Pos] = vrep.simxGetJointPosition(clientID,prismaticJointS21, mode);
    vrep_checkReturnCode( returnCode, 'prismaticJointS21Pos');
    
    [returnCode,prismaticJointS11Pos] = vrep.simxGetJointPosition(clientID,prismaticJointS11, mode);
    vrep_checkReturnCode( returnCode, 'prismaticJointS11Pos');
   
    [returnCode,prismaticJointS12Pos] = vrep.simxGetJointPosition(clientID,prismaticJointS12, mode);
    vrep_checkReturnCode( returnCode, 'prismaticJointS12Pos');
    
    [returnCode,prismaticJointS01Pos] = vrep.simxGetJointPosition(clientID,prismaticJointS01, mode);
    vrep_checkReturnCode( returnCode, 'prismaticJointS01Pos');
    %rotational Joints
    [returnCode,revoluteJointS21Pos] = vrep.simxGetJointPosition(clientID,revoluteJointS21, mode);
     vrep_checkReturnCode( returnCode, 'revoluteJointS21Pos');
     
    [returnCode,revoluteJointS22Pos] = vrep.simxGetJointPosition(clientID,revoluteJointS22, mode);
    vrep_checkReturnCode( returnCode, 'revoluteJointS22Pos');
    
    [returnCode,revoluteJointS11Pos] = vrep.simxGetJointPosition(clientID,revoluteJointS11, mode);
    vrep_checkReturnCode( returnCode, 'revoluteJointS11Pos');
    
    pause(0.1);
    
end