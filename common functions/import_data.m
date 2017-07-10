disp('loading data points for square');
square = dlmread('square.txt', ' ');
xs_square = square(:,2);
ys_square = square(:,3);
zs_square = square(:,4);

disp('loading data points for circle');
circle = dlmread('circle.txt', ' ');
xs_circle = circle(:,2);
ys_circle = circle(:,3);
zs_circle = circle(:,4);

disp('loading data points for heart');
heart = dlmread('heart.txt', ' ');
xs_heart = heart(:,2);
ys_heart = heart(:,3);
zs_heart = heart(:,4);