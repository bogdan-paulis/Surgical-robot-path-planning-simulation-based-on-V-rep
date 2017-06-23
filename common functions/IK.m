function q = IK(H)
%IK
% input H -> Homogeneous Transform lof tcp
%  
%    This function was generated by the Symbolic Math Toolbox version 7.0.
%    23-Jun-2017 16:14:43

H1_3= H(1,3);
H1_4= H(1,4);
H2_1= H(2,1);
H2_2= H(2,2);
H2_3= H(2,3);
H2_4= H(2,4);
H3_3= H(3,3);
H3_4= H(3,4);

q1= atan2(H3_3, -H1_3);
t2 = sin(q1);
t3 = cos(q1);
q3= atan2(-H2_3, -H1_3/t3);
t4 = cos(q3);
t5 = sin(q3);
t6 = 1.0./t3;
t7 = 1.0./t4;
t8 = t3.*t4.*5.535e-2;
t9 = t3.*t5.*4.05e-2;
t13 = t3.*1.33e-3;
t14 = t2.*(1.3e1./4.0e2);
t10 = H1_4+t8+t9-t13-t14;
t11 = t6.*t7.*t10;
t12 = t11-5.535e-2;



q = [H3_4+t2.*1.33e-3-t3.*(1.3e1./4.0e2)-t2.*t5.*4.05e-2+t2.*t4.*t12-1.1e1./5.0e2,angle(-H1_3+H3_3.*1i),H2_4-t4.*4.05e-2-t5.*t12-2.1e1./5.0e2,angle(H2_3.*-1i-H1_3.*t6),-t11,angle(H2_1-H2_2.*1i)];