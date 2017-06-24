%vrep test set joint pos file

vrep_checkReturnCode(Vrep_setJointPos( clientID,prismaticJointS00, 50, blocking));
vrep_checkReturnCode(Vrep_setJointPos( clientID,prismaticJointS00, 50, vrep.simx_opmode_oneshot));
vrep_checkReturnCode(Vrep_setJointPos( clientID,prismaticJointS00, 50, vrep.simx_opmode_streaming));


