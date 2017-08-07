function [R]=getRot(p1,p2)

v=p2-p1;
u=cross([1;0;0],v);
angle=acos(dot(u,v));

axang = [u' angle];
R = axang2rotm(axang);
quat = rotm2quat(R);
eul = rotm2eul(R,'ZYX');