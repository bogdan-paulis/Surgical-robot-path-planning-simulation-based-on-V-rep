function [ l1 ] = getL1(l2,theta)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
d= 17e-3;
l1=l2-tan(theta)*d;
%theta= atan((l2-l1)/d);
%tan(theta)*d= l2-l1
end

