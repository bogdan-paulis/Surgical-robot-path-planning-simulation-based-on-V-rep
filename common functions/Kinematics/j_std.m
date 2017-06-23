function J = j_std(q)
%J_STD
%    J = J_STD(Q2,Q4,Q5)

%    This function was generated by the Symbolic Math Toolbox version 7.0.
%    23-Jun-2017 17:13:47
if iscolumn(q)
      q = q';
 end
 

q1=q(1,1);
q2=q(1,2);
q3=q(1,3);
q4=q(1,4);
q5=q(1,5);
q6=q(1,6);

t2 = sin(q2);
t3 = cos(q2);
t4 = cos(q4);
t5 = sin(q4);
t6 = q5+5.535e-2;
t7 = t2.*t4;
J = reshape([0.0,0.0,1.0,0.0,1.0,0.0,t2.*(-1.33e-3)+t3.*(1.3e1./4.0e2)+t2.*t5.*4.05e-2+t2.*t4.*t6,0.0,t2.*(-1.3e1./4.0e2)-t3.*1.33e-3+t3.*t5.*4.05e-2+t3.*t4.*t6,0.0,0.0,0.0,0.0,1.0,0.0,0.0,0.0,0.0,t3.*t4.*(-4.05e-2)+t3.*t5.*t6,t5.*(-4.05e-2)-t4.*t6,t2.*t4.*4.05e-2-t2.*t5.*t6,t2,0.0,t3,-t3.*t4,-t5,t7,0.0,0.0,0.0,0.0,0.0,0.0,-t3.*t4,-t5,t7],[6,6]);