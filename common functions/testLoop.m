initP=[0,0,0];
pos=[0,0,0];
distance=[2,0,1];
stepSize=0.1;
error=1e-6;

step=stepSize*distance/norm(distance);

pdist([pos;initP+distance]);
r = robotics.Rate(1);
reset(r)
while pdist([pos;initP+distance])>=error
    
    if pdist([pos;initP+distance])<norm(step)
        pos=initP+distance;
    else
        pos=pos+step;
    end
    
    %pdist([pos;initP+distance])
    
    
	time = r.TotalElapsedTime;
	fprintf('Iteration: %f  Time Elapsed: %f\n',pdist([pos;initP+distance]),time)
	waitfor(r);
end
    