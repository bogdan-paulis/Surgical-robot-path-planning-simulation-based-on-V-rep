function [q] = vrep_getQ(clientID, opmod)
%VREP_GETQ Summary of this function goes here
%   Detailed explanation goes here

global prismaticJointS22 prismaticJointS21 prismaticJointS11 
global prismaticJointS12 prismaticJointS00 prismaticJointS01
global revoluteJointS21 revoluteJointS22 revoluteJointS11

if (clientID>-1)
%q1 Translational joint
%q1 is needs calibration
q(1,1)=vrep_getjointPos(clientID,prismaticJointS22, opmod);

%%q2 Rotational Joint
%q2 is needs calibration
q(1,2)=vrep_getjointPos(clientID,revoluteJointS21, opmod);
% q2_temp=vrep_getjointPos(clientID,prismaticJointS01, opmod);
% q(1,2)=getAngle(q(1,1),q2_temp);

%q3 Translational joint
%q3 is needs calibration
q(1,3)=vrep_getjointPos(clientID,prismaticJointS12, opmod);

%q4 Rotational Joint
q(1,4)=-vrep_getjointPos(clientID,revoluteJointS11, opmod);
% q4_temp=vrep_getjointPos(clientID,prismaticJointS12, opmod);
% q(1,2)=getAngle(q(1,3),q4_temp);

%q5 Translational joint
q(1,5)=vrep_getjointPos(clientID,prismaticJointS01, opmod);

%q6 Translational joint
q(1,6)=-vrep_getjointPos(clientID,prismaticJointS00, opmod);

% q= ones(1,6);
else
    disp('no valid ClientID provided');
end
end

