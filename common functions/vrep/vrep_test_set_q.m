%vrep test set joint pos file

Vrep_setJointPos( clientID,prismaticJointS11,0.02, blocking);
% Vrep_setJointPos( clientID,prismaticJointS01, 0, vrep.simx_opmode_oneshot);
% Vrep_setJointPos( clientID,prismaticJointS01, 0, vrep.simx_opmode_streaming);
Vrep_setJointPos(clientID, prismaticJointS21,0.02,blocking);
