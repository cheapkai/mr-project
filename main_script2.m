I1 = rgb2gray(imread('/home/mehthab/Assignment_3/images/img1.png'));
I2 = rgb2gray(imread('/home/mehthab/Assignment_3/images/img2.png'));

points1 = detectSURFFeatures(I1,'MetricThreshold',10);
points2 = detectSURFFeatures(I2,'MetricThreshold',10);

[features1,valid_points1] = extractFeatures(I1,points1);
[features2,valid_points2] = extractFeatures(I2,points2);

indexPairs = matchFeatures(features1,features2);

matchedPoints1 = valid_points1(indexPairs(:,1),:);
matchedPoints2 = valid_points2(indexPairs(:,2),:);

%figure; showMatchedFeatures(I1,I2,matchedPoints1,matchedPoints2);

%figure;
%showMatchedFeatures(I1,I2,matchedPoints1,matchedPoints2,'montage','PlotOptions',{'ro','go','y--'});

% 
% %disp(size(matchedPoints1));
% %disp(size(matchedPoints2));
% 
% %%%%%%%%%%I believe this is how we ge the 2d%%%%%%%%%%points!!!Confirm!!!%%%%%%%%%%%%
% 
 pts2D_1 = matchedPoints1.Location;
 pts2D_2 = matchedPoints2.Location;

%VVYIMPORTANTSEE what i did to coordinates below 
 
%plot(flipud(pts2D_1(:,1)),-1*flipud(pts2D_1(:,2)),'r+',flipud(pts2D_2(:,1)),-1*flipud(pts2D_2(:,2)),'bo');
 
%plot(flipud(pts2D_1(:,1)),-1*flipud(pts2D_1(:,2))+2*240.2395,'r+',flipud(pts2D_2(:,1)),-1*flipud(pts2D_2(:,2))+2*240.2395,'bo');

%plot(flipud(pts2D_1(:,1)),-1*flipud(pts2D_1(:,2))+2*240.2395,'bo',flipud(pts2D_2(:,1)),-1*flipud(pts2D_2(:,2))+2*240.2395,'bo',310.3210,240.2395,'r+');

pts2D_1(:,2) = -1*pts2D_1(:,2) + 2*240.2395;
pts2D_2(:,2) = -1*pts2D_2(:,2) + 2*240.2395;

pts2D_1v = pts2D_1;
pts2D_2v = pts2D_2;

Ox = 310.3210;
Oy = 240.2395;


%%%%%NOW in pixel%%%%%coordinates%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

K = [558.7087 0.0000 310.3210;0.0000 558.2827 240.2395;0.0000 0.0000 1.0000];
%%%%%%%THis is Wrong%%%%%%%%%%%%%%%%
%Xw = inv(K)*([pts2D_1 ones(size(pts2D_1,1),1)]');
%Xw = Xw';



%plot3(Xw(:,1),Xw(:,2),Xw(:,3),'bo');

pts2D_1(:,1) = pts2D_1(:,1) - Ox*ones(size(pts2D_1,1),1);

pts2D_1(:,2) = pts2D_1(:,2) - Oy*ones(size(pts2D_1,1),1);

pts2D_2(:,1) = pts2D_2(:,1) - Ox*ones(size(pts2D_2,1),1);

pts2D_2(:,2) = pts2D_2(:,2) - Oy*ones(size(pts2D_2,1),1);


%plot(flipud(pts2D_1(:,1)),flipud(pts2D_1(:,2)),'r+',flipud(pts2D_2(:,1)),flipud(pts2D_2(:,2)),'bo',0,0,'r+');









%SOMEHOW get 2D points of correspondences%%%%%%%%%%%%%%%%%
%They  are pts2D_1 and pts2D_2

K = [558.7087 0.0000 310.3210;0.000 558.2827 240.2395;0.0000 0.0000 1.0000];


[normPts2D_1,T1] = normalize2DPoints(pts2D_1);
[normPts2D_2,T2] = normalize2DPoints(pts2D_2);

%plot(normPts2D_1(:,1),normPts2D_1(:,2),'+',normPts2D_2(:,1),normPts2D_2(:,2),'o');



[normPts2D_1v,T1v] = normalize2DPoints(pts2D_1v);
[normPts2D_2v,T2v] = normalize2DPoints(pts2D_2v);
plot(normPts2D_1v(:,1),normPts2D_1v(:,2),'+',normPts2D_2v(:,1),normPts2D_2v(:,2),'o');


F_norm = estimateFundamentalMatrixRANSAC(normPts2D_1,normPts2D_2);
F = (T2')*F_norm*(T1);
disp(F)

% 

E = (K')*F*K;

[u,d,v] = svd(E);
new_d = diag([(d(1,1)+d(2,2))/2, (d(1,1)+d(2,2))/2 , 0]);
E = u * new_d * v' ;%v or v' check!!!!!!!!!!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%[pts2D_1 ones((size(pts2D_1,1)),1)]'

% 
% 
% 

% 

[R t] = decomposeEssentialMatrix(E, [pts2D_1v ones((size(pts2D_1v,1)),1)]',[pts2D_2v ones((size(pts2D_2v,1)),1)]', K); %these points are normalized or not%%%%%%%%%%%%%
%[R t] = decomposeEssentialMatrix(E, [normPts2D_1v ones((size(normPts2D_1v,1)),1)]',[normPts2D_2v ones((size(normPts2D_2v,1)),1)]', K); %these points are normalized or not%%%%%%%%%%%%%


ProjMat_1 = K*[eye(3,3) [0 0 0]'];
ProjMat_2 = K*[R t];

pts3D = algebraicTriangulation([pts2D_1v ones((size(pts2D_1v,1)),1)]',[pts2D_2v ones((size(pts2D_2v,1)),1)]',ProjMat_1,ProjMat_2);
%pts3D = algebraicTriangulation([normPts2D_1v ones((size(normPts2D_1v,1)),1)]',[normPts2D_2v ones((size(normPts2D_2v,1)),1)]',ProjMat_1,ProjMat_2);


pts3D = pts3D';
%disp(pts3D(:,1));

 pts3D(:,1) = pts3D(:,1)./pts3D(:,4);
 %disp(pts3D(:,1));
 pts3D(:,2) = pts3D(:,2)./pts3D(:,4);
 pts3D(:,3) = pts3D(:,3)./pts3D(:,4);
%axis([-10 10 -10 10 -10 10]);

pts3Dx = [0 0 0];

for i=1:size(pts3D,1)
   
    if (pts3D(i,1) <= 20) && (pts3D(i,1) >= -20) && (pts3D(i,2) >= -20) && (pts3D(i,2) <= 20) && (pts3D(i,3) >= -20) && (pts3D(i,3)<=20)
        pts3Dx = vertcat(pts3Dx,pts3D(i,1:3));
        
    end    
    
end


plot3(pts3Dx(:,1),pts3Dx(:,2),pts3Dx(:,3),'bo'); 
 
 

% mu = mean(pts3Dx);
% %disp(mu)
% %return
% 
% d = 0;
% 
% for i = 1:size(pts3Dx,1)
%     d = d + (1/size(pts3Dx,1))*(sqrt((pts3Dx(i,1)-mu(1,1))*(pts3Dx(i,1)-mu(1,1))+((pts3Dx(i,2)-mu(1,2))*(pts3Dx(i,2)-mu(1,2)))+((pts3Dx(i,3)-mu(1,3))*(pts3Dx(i,3)-mu(1,3)))));
%     %d = d + (1/size(pts2D,1))*(sqrt((pts2D(i,1))*(pts2D(i,1))+((pts2D(i,2))*(pts2D(i,2)))+));
% 
% 
% end
% %disp(d)
% 
% %pts3Dx = (1/d)*(pts3Dx - (ones(size(pts3Dx,1),1)*mu))
% 
% %plot3(pts3Dx(:,1),pts3Dx(:,2),pts3Dx(:,3),'bo'); 
%  
% 
% 
% %the scale factor
% %scale = sqrt(3)/d;
% %disp(scale)
% %return
% 
% %T = [scale,0,-1*scale*mean(1,1);0,scale,-1*scale*mean(1,2);0,0,1];
% 
% %disp(T)
% 
% 
% %pts3Dx = [pts3Dx ones(size(pts3Dx,1),1)];
% 
% %normPts2D = (T*(pts2D'))';
% %normPts2D = normPts2D(:,1:2);
% 
% %disp(T)
% %disp(normPts2D)
% 
% 
% 

 
%%%%Normalize pts3D%%%%%%%%%%%%5

%axis([-0.9 0.9 -0.9 0.9 -0.9 0.9]);
% plotCameraFrustum([eye(3,3) [0 0 0]';0 0 0 1],'red',2);
% hold on
% plotCameraFrustum([R t;0 0 0 1],'magenta',2);
% hold on
% 
% 
% %pts2D_1 
% axis([-20 20 -20 20 -20 20]);
% plot3(pts3D(:,1),pts3D(:,2),pts3D(:,3),'o');
% hold on
% pose = [R t;0 0 0 1];
% % pose2 = [
% plotCameraFrustum(pose,'red',0.01,);
% 
disp('F')
disp(F);
disp('R')
disp(R);
disp('t')
disp(t);


