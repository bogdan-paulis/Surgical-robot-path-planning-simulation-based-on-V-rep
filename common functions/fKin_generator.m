
%FKIN Summary of this function goes here
%   Detailed explanation goes here

% syms q0 q1 q2 q3 q4 q5;
q = sym('q', [1 6]);
syms l1 l2 l3 d1 d2 d3 d4;


% if iscolumn(v)
%      v = v';
     
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


%h11=-sin(q1)*sin(q5)- cos(q1)*cos(q5)*sin(q3);
h11=-s1*s5- c1*c5*s3;
h12= c1*s3*s5-c5*s1;
h13= -c1*c3;
h14= l2*c1+l1*s1-c1*c3*(d4+q4) -l3*c1*s3;
h21 = c3*c5;
h22= -c3*s5;
h23= -s3;
h24= d2+d3+q2-s3*(d4+q4)+l3*c3;
h31= c5*s1*s3-c1*s5;
h32= -c1*c5-s1*s3*s5;
h33= c3*s1;
h34= d1 + q0 + l1*c1-l2*s1+c3*s1*(d4+q4)+l3*s1*s3;

H=[h11,h12,h13,h14;
h21, h22,h23,h24;
h31,h32,h33,h34;
0,0,0,1];

matlabFunction(H,'file','fKin.m')


