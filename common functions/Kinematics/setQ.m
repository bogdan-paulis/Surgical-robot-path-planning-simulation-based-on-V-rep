function setQ( q )
%inverseKin
%send the corect values
%TODO get corect readings
global vrep clientID;
global prismaticJointS22 prismaticJointS21;
global prismaticJointS12 prismaticJointS11;
global prismaticJointS01;

if iscolumn(q)
      q = q';
 end
 
q0=q(1,1);
q1=q(1,2);
q2=q(1,3);
q3=q(1,4);
q4=q(1,5);
q5=q(1,6);

if (clientID>-1)
    disp('Connected');
    % code
    % Set joint position
    

    [returnCode] = vrep.simxSetJointTargetPosition(clientID, prismaticJointS22, q0,vrep.simx_opmode_blocking);
    [returnCode] = vrep.simxSetJointTargetPosition(clientID, prismaticJointS21, q1,vrep.simx_opmode_blocking);
    
    [returnCode] = vrep.simxSetJointTargetPosition(clientID, prismaticJointS11, q2,vrep.simx_opmode_blocking);
    [returnCode] = vrep.simxSetJointTargetPosition(clientID, prismaticJointS12, q3,vrep.simx_opmode_blocking);
 
    [returnCode] = vrep.simxSetJointTargetPosition(clientID, prismaticJointS01, q4,vrep.simx_opmode_blocking);
    
    
end

end

