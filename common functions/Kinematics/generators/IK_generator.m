
%FKIN Summary of this function goes here
%   Detailed explanation goes here

syms q0 q1 q2 q3 q4 q5;
syms x y z;
H = sym('H', [4 4]);


x = H(1,4);
y = H(2,4);
z= H(3,4);

l1= 32.5e-3;
l2= 1.33e-3;
l3= 40.5e-3;
d1= 22e-3;
d2= 20e-3;
d3= 22e-3;
d4= 55.35e-3;

s0= sin(q0);
s1= sin(q1);
s2= sin(q2);
s3= sin(q3);



c0= cos(q0);
c1= cos(q1);
c2= cos(q2);
c3= cos(q3);

% a= H(3,3);
% b = H(1,3);
% c= H(2,3);
% d= H(1,3);
% q1= atan2(a, -b);
% 
% q3= atan2(-c, -d/c1);



q1= atan2(H(3,3), -H(1,3));

q3= atan2(-H(2,3), -H(1,3)/c1);

q4= -(x-l2*c1-l1*s1+d4*c1*c3+l3*c1*s3)/(c1*c3);
q5= atan2(-H(2,2),H(2,1));
q0= z - d1 - l1*c1+l2*s1-c3*s1*(d4+q4) - l3*s1*s3;
q2= y - d3 - d2 +s3*(d4+q4)-l3*c3;
q = [q0, q1, q2, q3 ,q4 , q5];

matlabFunction(q,'file','IK.m')