function [ l2 ] = getL2(l1,theta)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
d= 17e-3;
l2=tan(theta-0.0012)*d +l1;
%theta= atan((l2-l1)/d);
end

