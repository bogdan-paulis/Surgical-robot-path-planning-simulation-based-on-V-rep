function [ q ] = IK_Simulink( H )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

q = IK(H)';
q1=q(1,1);
q2=q(2,1);
q3=q(3,1);
q4=q(4,1);
q2_temp= getL2(q1,q2);
q4_temp= getL2(q3,q4);
q(2,1)=q2_temp;
q(4,1)=q4_temp;

end

