function [pts3D] = algebraicTriangulation(pts2D_1, pts2D_2, ProjMat_1, ProjMat_2)

%pts2D_1 3xN
%pts2D_2 3xN
%ProjMat_1 3x4
%ProjMat_2 3x4
%pts3D     4xN


n_1 = size(pts2D_1,2);
n_2 = size(pts2D_2,2);

if n_1 ~= n_2
    error('invalid dimensions:dont match');    
end    
%%%%%%%%%%%%doubt clarified the matrix V contains right singular vectors as
%%%%%%%%%%%%columns if svd is being used for finding vectors solution then
%%%%%%%%%%%%last column 

%%%%%%%%%for what this assignemtn asks us to perform on F and E for rank
%%%%%%%%%reduction use v' as we need to mulitply with trans of right
%%%%%%%%%eigenvectors%%%%%%%%%%%%%%

pts3D = rand(4,1);


for k=1:n_1
    
    A = [pts2D_1(2,k)*ProjMat_1(3,:) - ProjMat_1(2,:);pts2D_1(1,k)*ProjMat_1(3,:) - ProjMat_1(1,:);pts2D_2(2,k)*ProjMat_2(3,:) - ProjMat_2(2,:);pts2D_2(1,k)*ProjMat_2(3,:) - ProjMat_2(1,:)];
    [u,s,v] = svd(A);
    X = v(:,end);
    pts3D = horzcat(pts3D,X);
    
 
end

pts3D = pts3D(:,2:end);


