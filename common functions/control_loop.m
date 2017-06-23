% input: k_p, k_ext, x
% x_d= x;
% lambda= 1;
% 
% while true:
% q= vrep_getq;
% x=fKin(q);
% x_d=x_d+v_desired()*timeDelta;
% e= x_d-x;
% 
% if mode = Vfix then
% 	e_ext=getExtendedError(e,lambda)
% 	j_ext=j_Ext(q,lambda);
% 	[q_dot, lambda_dot] = trans(J_ext)*K_ext*e_ext;
% 	lambda = lambda + lambda_dot*timeDelta;
% 
% 	else
% 	J=j_std(q);
% 	q_dot=trans(J)*K_p*e;
% 
% end if;
% vrep_set(q,q_dot);

% k_p=0
% k_ext=0
% x=[0 0 0];

x_d= zeros(1,3);

%lambda is how far the needle went into the virtual fixture point
lambda= 1;

timeDelta=10e-3;

q= vrep_getq();
H=fKin(q);
x=H(1:3,4)';
x_d=x_d+v_desired()*timeDelta;
e= x_d-x;


% if mode == Vfix then

% 	e_ext=getExtendedError(e,lambda)
% 	j_ext=j_Extend(q,lambda);
% 	[q_dot, lambda_dot] = transpose(J_ext)*K_ext*e_ext;
% 	lambda = lambda + lambda_dot*timeDelta;

% 	else

    %6x6 Jacobian
	J_temp=j_std(q);
    %6x3 Jacobian
    J=J_temp(:,4:6);
    
	q_dot=transpose(J)*K_p*e;

% end if;
vrep_set(q,q_dot);