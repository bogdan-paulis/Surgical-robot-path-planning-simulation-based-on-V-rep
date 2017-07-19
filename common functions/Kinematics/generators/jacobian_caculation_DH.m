%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%This program gives the caculation of Jacobian.
%The input is the DH matrix.
%Author: Mingchuan Zhou
%Date:2017/6/20
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc;close all;clear
joint_num = 6;
% theta_all = sym('theta',[joint_num,1]);
% d_all = sym('d',[joint_num,1]);
% a_all = sym('a',[joint_num,1]);
% alpha_all = sym('alpha',[joint_num,1]);
% T_all = sym('T',[joint_num,1]);
% A_all = sym('A',[joint_num,1]);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
syms  Ltool L1 L2 L3 L4 L5 L6 lamda real
q = sym('q', [1 6]);


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

L1=d1;
L3= d2;
L2=l1;
L4=d3;
L5=l3;
L6=d4;


%DH=[theta_all,d_all,a_all,alpha_all];
DH=[      0, q0+L1,    0, -pi/2;
    q1-pi/2,    L3,   L2,     0;
       pi/2, L4+q2,    0,  pi/2;
    pi/2+q3,     0,   L5, -pi/2;
          0, L6+q4,    0,     0;
         q5,     0,    0,     0];
Temp = 1;
O{1} = [0;0;0];
Z{1} =[0;0;1];
for i=1:joint_num
    %    A=[cos(theta_all(i)), -cos(alpha_all(i))*sin(theta_all(i)),  sin(alpha_all(i))*sin(theta_all(i)), a_all(i)*cos(theta_all(i));
    %           sin(theta_all(i)),  cos(alpha_all(i))*cos(theta_all(i)), -sin(alpha_all(i))*cos(theta_all(i)), a_all(i)*sin(theta_all(i));
    %                           0,                    sin(alpha_all(i)),                    cos(alpha_all(i)),                   d_all(i);
    %                           0,                                    0,                                   0,                          1;
    %    ];
    A=[cos(DH(i,1)), -cos(DH(i,4))*sin(DH(i,1)),  sin(DH(i,4))*sin(DH(i,1)), DH(i,3)*cos(DH(i,1));
        sin(DH(i,1)),  cos(DH(i,4))*cos(DH(i,1)), -sin(DH(i,4))*cos(DH(i,1)), DH(i,3)*sin(DH(i,1));
        0,               sin(DH(i,4)),               cos(DH(i,4)),              DH(i,2);
        0,                          0,                          0,                    1;
        ];
    A_all{i} = A;
    Temp = Temp*A;
    T_all{i} = Temp;
    O{i+1} = T_all{i}(1:3,4);
    Z{i+1} = T_all{i}(1:3,3);
end

for i=1:joint_num
    if i==2||i==4||i==6
        J{i} = simplify([cross(Z{i},(O{joint_num+1}-O{i}));Z{i}]);
        %      J{i} = ([cross(Z{i},(O{joint_num+1}-O{i}));Z{i}]);
    else
        J{i}=[Z{i};[0,0,0]'];
        try
            J{i}=simplify(J{i});
        end
    end
end
J1_6 = [J{1},J{2},J{3},J{4},J{5},J{6}];
J1_5 = [J{1},J{2},J{3},J{4},J{5}];
Jtool=subs(J1_5,L6,Ltool);
J=J1_5+lamda*(Jtool-J1_5);

matlabFunction(Jtool,'file','j_Tool.m')
matlabFunction(J,'file','j_Extended.m')

%I have no idea of ptool and p5,





