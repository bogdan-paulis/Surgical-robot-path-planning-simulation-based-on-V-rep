function [ outputFile ] = scaleTo(inputFile,desiredSize)
%example
%%desiredSize= 0.02;
%%inputFile= xs_circle;


[r,c]=size(inputFile);

MAX=0;
MIN=0;
for j=1:c
if MAX<= inputFile(j,2);
MAX=inputFile(2,j);
end
if MIN>= inputFile(j,2);
MIN=inputFile(2,j);
end
end

disp(MAX);
disp(MIN);

delta=MAX-MIN;
sizeNew=desiredSize/delta;
outputFile=inputFile;
outputFile(:,2)=inputFile(:,2).*sizeNew;

