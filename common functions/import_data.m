disp('loading data points for square');
square = dlmread('square.txt', ' ');
xs_square = [square(:,1) square(:,2)];
ys_square = [square(:,1) square(:,3)];
zs_square = [square(:,1) square(:,4)];

disp('loading data points for circle');
circle = dlmread('circle.txt', ' ');
xs_circle = [circle(:,1) circle(:,2)];
ys_circle = [circle(:,1) circle(:,3)];
zs_circle = [circle(:,1) circle(:,4)];

disp('loading data points for heart');
heart = dlmread('heart.txt', ' ');
xs_heart = [heart(:,1) heart(:,2)];
ys_heart = [heart(:,1) heart(:,3)];
zs_heart = [heart(:,1) heart(:,4)];

