function [q] = vrep_getq(clientID, opmod)
%VREP_GETQ Summary of this function goes here
%   Detailed explanation goes here

global prismaticJointS22 prismaticJointS21 prismaticJointS11 
global prismaticJointS12 prismaticJointS00 prismaticJointS01

q(1,1)=vrep_getjointPos(clientID,prismaticJointS00, opmod);

q2_temp=vrep_getjointPos(clientID,prismaticJointS01, opmod);
q(1,2)=getAngle(q(1,1),q2_temp);

q(1,3)=vrep_getjointPos(clientID,prismaticJointS11, opmod);

q4_temp=vrep_getjointPos(clientID,prismaticJointS12, opmod);
q(1,2)=getAngle(q(1,3),q4_temp);

q(1,5)=vrep_getjointPos(clientID,prismaticJointS21, opmod);

q6_temp=vrep_getjointPos(clientID,prismaticJointS22, opmod);
 q(1,6)=getAngle(q(1,5),q6_temp);

% q= ones(1,6);
end

