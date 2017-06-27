function retCode=controlLoop(Kp,Kext,xinit,v_desired,timeDelta)

global clientID;
global blocking;

x_d=xinit;

q= vrep_getQ(clientID, blocking);
H=fKin(q);
x=H(1:3,4)'
x_d=x_d+v_desired*timeDelta;

initP=x;
pos=x;
distance=x_d-x;
rate=10;
r = robotics.Rate(rate);
reset(r)

stepSize=v_desired/rate;
error=1e-6;

step=stepSize*distance/norm(distance);

%pdist([pos;initP+distance]);


while pdist([pos;initP+distance])>=error
    
    if pdist([pos;initP+distance])<norm(step)
        pos=initP+distance;
    else
        pos=pos+step;
    end
    
    %pdist([pos;initP+distance])
    
    H(1:3,4)=pos';
    %e= x_d-x;
    q_new=IK(H);
    vrep_setQ(q_new, clientID, blocking);
    
    
    time = r.TotalElapsedTime;
    fprintf('Iteration: %f  Time Elapsed: %f\n',pdist([pos;initP+distance]),time)
    waitfor(r);
end
ret=x_d;
end