function [ q_out] = Q_prismCorrection( q )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
%#codegen
 if iscolumn(q)
       q = q';
 end
q_out=zeros(1, 6,'single');

q1=q(1,1);
q2=q(1,2);
q3=q(1,3);
q4=q(1,4);
q2_temp= getL2(q1,q2*1.05);
q4_temp= getL2(q3,q4);

% end


q_out(1,1) = q1;
q_out(1,2) = q2_temp;
q_out(1,3) = q3;
q_out(1,4) = q4_temp;
q_out(1,5) = q(1,5);
q_out(1,6) = q(1,6);
end

