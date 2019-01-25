%pts2D is a NX2 matrix where n is the number of points


function [normPts2D, T] = normalize2DPoints(pts2D)

if size(pts2D,2) ~= 2
    error('invalid dimensions pts2D no of columns should be 2');
end

mu = mean(pts2D);
%disp(mu)
%return

d = 0;

for i = 1:size(pts2D,1)
    %d = d + (1/size(pts2D,1))*(sqrt((pts2D(i,1)-mu(1,1))*(pts2D(i,1)-mu(1,1))+((pts2D(i,2)-mu(1,2))*(pts2D(i,2)-mu(1,2)))));
    d = d + (1/size(pts2D,1))*(sqrt((pts2D(i,1))*(pts2D(i,1))+((pts2D(i,2))*(pts2D(i,2)))));


end
%disp(d)


%the scale factor
scale = sqrt(2)/d;
%disp(scale)
%return

T = [scale,0,-1*scale*mean(1,1);0,scale,-1*scale*mean(1,2);0,0,1];

%disp(T)


pts2D = [pts2D ones(size(pts2D,1),1)];

normPts2D = (T*(pts2D'))';
normPts2D = normPts2D(:,1:2);

%disp(T)
%disp(normPts2D)

