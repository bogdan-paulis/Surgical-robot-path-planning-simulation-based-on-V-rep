
%Jextended Summary of this function goes here
%   Detailed explanation goes here

q = sym('q', [1 6]);
%  syms l1 l2 l3 d1 d2 d3 d4;



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
j23=1;
j24= -c3*(d4+q4)-l3*s3;
j25= -s3;
j31=1;
j32=c1*c3*(d4+q4)-l1*s1-l2*c1+l3*c1*s3;
j34= l3*c3*s1-s1*s3*(d4+q4);
j35= c3*s1;
j44= s1;
j46= -c1*c3;
j51=1;
j56= -s3;
j64= c1;
j66= c3*s1;


J= [0, j12, 0, j14, j15,0;
    0,0,j23,j24,j25,0;
    j31,j32,0,j34,j35,0;
    0,0,0,j44,0,j46;
    j51,0,0,0,0,j56;
    0,0,0,j64,0,j66]
    


 matlabFunction(J,'file','j_std.m')
