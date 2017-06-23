
%Jextended Summary of this function goes here
%   Detailed explanation goes here

q = sym('q', [1 6]);
% syms l1 l2 l3 d1 d2 d3 d4;
syms lambda;


q0=q(1,1);
q1=q(1,2);
q2=q(1,3);
q3=q(1,4);
q4=q(1,5);
q5=q(1,6);

l1= 32.5e-3;
l2= 1.33e-3;
l3= 40.5e-3;
d1= 22e-3;
d2= 20e-3;
d3= 22e-3;
d4= 55.35e-3;

s1= sin(q1);
s2= sin(q2);
s3= sin(q3);
s4= sin(q4);
s5= sin(q5);
s0= sin(q0);

c1= cos(q1);
c2= cos(q2);
c3= cos(q3);
c4= cos(q4);
c5= cos(q5);
c0= cos(q0);

j12= l1*c1-l2*s1+c3*s1*(d4+q4)+l3*s1*s3;
j14= c1*s3*(d4+q4)-l3*c1*c3;
j15= -c1*c3;
j24= s1;
j26= -c1*c3;
j32=1;
j36= -s3;
j44= c1;
j46= c3*s1;
j52= l1*c1-l2*s1+l3*s3*s1+lambda*c3*s1*(d4+q4);
j54= lambda*c1*s3*(d4+q4) -l3*c1*c3;
j55= - lambda*c1*c3;
j57= -c1*c3*(d4+q4);
j63= 1;
j64= -l3*s3-lambda*c3*(d4+q4);
j65= -lambda*s3;
j67= -s3*(d4+q4);
j71=1;
j72= l3*c1*s3-l1*s1-l2*c1+lambda*c1*c3*(d4+q4);
j74= l3*c3*s1-lambda*s1*s3*(d4+q4);
j75= lambda*c3*s1;
j77= c3*s1*(d4+q4);
J= [0, j12, 0, j14, j15,0,0;
    0,0,0,j24,0,j26,0;
    0,j32,0,0,0,j36,0;
    0,0,0,j44,0,j46,0;
    0,j52,0,j54,j55,0,j57;
    0,0,j63,j64,j65,0,j67;
    j71,j72,0,j74,j75,0,j77];


matlabFunction(J,'file','j_Extend.m')
