function q = getQ()
%inverseKin
%send the corect values
%TODO get corect readings
global vrep clientID;
global prismaticJointS22 prismaticJointS21;
global prismaticJointS12 prismaticJointS11;
global prismaticJointS01;

if (clientID>-1)
    disp('Connected');
    % code
    %vrep_getangles
    %vrep_setangles
    
    % First read from V-REP of a particular object position
    %[returnCode,prismaticJointS22Pos] = vrep.simxGetJointPosition(clientID,prismaticJointS22, vrep.simx_opmode_streaming);
    %[returnCode,prismaticJointS21Pos] = vrep.simxGetJointPosition(clientID,prismaticJointS21, vrep.simx_opmode_streaming);
    
    %[returnCode,prismaticJointS11Pos] = vrep.simxGetJointPosition(clientID,prismaticJointS11, vrep.simx_opmode_streaming);
    %[returnCode,prismaticJointS12Pos] = vrep.simxGetJointPosition(clientID,prismaticJointS12, vrep.simx_opmode_streaming);
    
    %[returnCode,prismaticJointS01Pos] = vrep.simxGetJointPosition(clientID,prismaticJointS01, vrep.simx_opmode_streaming);

    
    %pause(0.1);
    % Further reads of the same object position
    [returnCode,prismaticJointS22Pos] = vrep.simxGetJointPosition(clientID,prismaticJointS22, vrep.simx_opmode_buffer);
    [returnCode,prismaticJointS21Pos] = vrep.simxGetJointPosition(clientID,prismaticJointS21, vrep.simx_opmode_buffer);

    [returnCode,prismaticJointS11Pos] = vrep.simxGetJointPosition(clientID,prismaticJointS11, vrep.simx_opmode_buffer);
    [returnCode,prismaticJointS12Pos] = vrep.simxGetJointPosition(clientID,prismaticJointS12, vrep.simx_opmode_buffer);
    
    [returnCode,prismaticJointS01Pos] = vrep.simxGetJointPosition(clientID,prismaticJointS01, vrep.simx_opmode_buffer);
    
    q(1,1)=prismaticJointS22Pos;
    q(1,2)=prismaticJointS21Pos;
    q(1,3)=prismaticJointS11Pos;
    q(1,4)=prismaticJointS12Pos;
    q(1,5)=prismaticJointS01Pos;
    q(1,6)=0;
    
    
end



end

