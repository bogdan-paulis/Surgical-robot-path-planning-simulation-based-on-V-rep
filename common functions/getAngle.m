function [ theta ] = getAngle( l1, l2 )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
d= 17e-3;
theta= atan((l2-l1)/d);

end

