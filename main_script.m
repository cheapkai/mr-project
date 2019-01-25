for i = 1:5
  imageFileName = sprintf('img%d.png', i);
  imageFileNames{i} = fullfile(matlabroot,'toolbox','vision',...
       'visiondata','calibration','webcam',imageFileName);
end

[imagePoints,boardSize,imagesUsed] = detectCheckerboardPoints(imageFileNames);

imageFileNames = imageFileNames(imagesUsed);


squareSize = 24;  % in units of 'millimeters'
worldPoints = generateCheckerboardPoints(boardSize, squareSize);

X1 = worldPoints(1,1);
X2 = worldPoints(6,1);
X3 = worldPoints(43,1);
X4 = worldPoints(48,1);

Y1 = worldPoints(1,2);
Y2 = worldPoints(6,2);
Y3 = worldPoints(43,2);
Y4 = worldPoints(48,2);

x11 = imagePoints(1,1,1);
x12 = imagePoints(6,1,1);
x13 = imagePoints(43,1,1);
x14 = imagePoints(48,1,1);

y11 = imagePoints(1,2,1);
y12 = imagePoints(6,2,1);
y13 = imagePoints(43,2,1);
y14 = imagePoints(48,2,1);


a11 = [-X1,-Y1,-1,0,0,0,x11*X1,x11*Y1,x11];
a12 = [0,0,0,-X1,-Y1,-1,y11*X1,y11*Y1,y11];

a21 = [-X2,-Y2,-1,0,0,0,x12*X2,x12*Y2,x12];
a22 = [0,0,0,-X2,-Y2,-1,y12*X2,y12*Y2,y12];

a31 = [-X3,-Y3,-1,0,0,0,x13*X3,x13*Y3,x13];
a32 = [0,0,0,-X3,-Y3,-1,y13*X3,y13*Y3,y13];

a41 = [-X4,-Y4,-1,0,0,0,x14*X4,x14*Y4,x14];
a42 = [0,0,0,-X4,-Y4,-1,y14*X4,y14*Y4,y14];

[U,S,V] = svd([a11;a12;a21;a22;a31;a32;a41;a42]);


H1 = [V(1,9) V(2,9) V(3,9);V(4,9) V(5,9) V(6,9);V(7,9) V(8,9) V(9,9)];
x11 = imagePoints(1,1,3);
x12 = imagePoints(6,1,3);
x13 = imagePoints(43,1,3);
x14 = imagePoints(48,1,3);

y11 = imagePoints(1,2,3);
y12 = imagePoints(6,2,3);
y13 = imagePoints(43,2,3);
y14 = imagePoints(48,2,3);

a11 = [-X1,-Y1,-1,0,0,0,x11*X1,x11*Y1,x11];
a12 = [0,0,0,-X1,-Y1,-1,y11*X1,y11*Y1,y11];

a21 = [-X2,-Y2,-1,0,0,0,x12*X2,x12*Y2,x12];
a22 = [0,0,0,-X2,-Y2,-1,y12*X2,y12*Y2,y12];

a31 = [-X3,-Y3,-1,0,0,0,x13*X3,x13*Y3,x13];
a32 = [0,0,0,-X3,-Y3,-1,y13*X3,y13*Y3,y13];

a41 = [-X4,-Y4,-1,0,0,0,x14*X4,x14*Y4,x14];
a42 = [0,0,0,-X4,-Y4,-1,y14*X4,y14*Y4,y14];

[U,S,V] = svd([a11;a12;a21;a22;a31;a32;a41;a42]);

H2 = [V(1,9) V(2,9) V(3,9);V(4,9) V(5,9) V(6,9);V(7,9) V(8,9) V(9,9)];

x11 = imagePoints(1,1,3);
x12 = imagePoints(6,1,3);
x13 = imagePoints(43,1,3);
x14 = imagePoints(48,1,3);

y11 = imagePoints(1,2,3);
y12 = imagePoints(6,2,3);
y13 = imagePoints(43,2,3);
y14 = imagePoints(48,2,3);

a11 = [-X1,-Y1,-1,0,0,0,x11*X1,x11*Y1,x11];
a12 = [0,0,0,-X1,-Y1,-1,y11*X1,y11*Y1,y11];

a21 = [-X2,-Y2,-1,0,0,0,x12*X2,x12*Y2,x12];
a22 = [0,0,0,-X2,-Y2,-1,y12*X2,y12*Y2,y12];

a31 = [-X3,-Y3,-1,0,0,0,x13*X3,x13*Y3,x13];
a32 = [0,0,0,-X3,-Y3,-1,y13*X3,y13*Y3,y13];

a41 = [-X4,-Y4,-1,0,0,0,x14*X4,x14*Y4,x14];
a42 = [0,0,0,-X4,-Y4,-1,y14*X4,y14*Y4,y14];

[U,S,V] = svd([a11;a12;a21;a22;a31;a32;a41;a42]);

H2 = [V(1,9) V(2,9) V(3,9);V(4,9) V(5,9) V(6,9);V(7,9) V(8,9) V(9,9)];

x11 = imagePoints(1,1,5);
x12 = imagePoints(6,1,5);
x13 = imagePoints(43,1,5);
x14 = imagePoints(48,1,5);

y11 = imagePoints(1,2,5);
y12 = imagePoints(6,2,5);
y13 = imagePoints(43,2,5);
y14 = imagePoints(48,2,5);

a11 = [-X1,-Y1,-1,0,0,0,x11*X1,x11*Y1,x11];
a12 = [0,0,0,-X1,-Y1,-1,y11*X1,y11*Y1,y11];

a21 = [-X2,-Y2,-1,0,0,0,x12*X2,x12*Y2,x12];
a22 = [0,0,0,-X2,-Y2,-1,y12*X2,y12*Y2,y12];

a31 = [-X3,-Y3,-1,0,0,0,x13*X3,x13*Y3,x13];
a32 = [0,0,0,-X3,-Y3,-1,y13*X3,y13*Y3,y13];

a41 = [-X4,-Y4,-1,0,0,0,x14*X4,x14*Y4,x14];
a42 = [0,0,0,-X4,-Y4,-1,y14*X4,y14*Y4,y14];

[U,S,V] = svd([a11;a12;a21;a22;a31;a32;a41;a42]);

H3 = [V(1,9) V(2,9) V(3,9);V(4,9) V(5,9) V(6,9);V(7,9) V(8,9) V(9,9)];

V12 = [(H1(1,1)*H1(1,2));(H1(1,1)*H1(2,2) + H1(2,1)*H1(1,2));(H1(3,1)*H1(1,2) + (H1(1,1)*H1(3,2)));(H1(2,1)*H1(2,2));(H1(3,1)*H1(1,2)+H1(2,1)*H1(3,2));(H1(3,1)*H1(3,2))]';

V11 = [(H1(1,1)*H1(1,1));(H1(1,1)*H1(2,1) +H1(2,1)*H1(1,1));(H1(3,1)*H1(1,1) + H1(1,1)*H1(3,1));H1(2,1)*H1(2,1);(H1(3,1)*H1(2,1) + H1(2,1)*H1(3,1));H1(3,1)*H1(3,1)]';

V22 = [(H1(1,2)*H1(1,2));(H1(1,2)*H1(2,2) + H1(2,2)*H1(1,2));(H1(3,2)*H1(1,2) + H1(1,2)*H1(3,2));(H1(2,2)*H1(2,2));(H1(3,2)*H1(2,2) + H1(2,2)*H1(3,2));(H1(3,2)*H1(3,2))]';

V1 = [V12;(V11 - V22)];

V12 = [(H2(1,1)*H2(1,2));(H2(1,1)*H2(2,2) + H2(2,1)*H2(1,2));(H2(3,1)*H2(1,2) + (H2(1,1)*H2(3,2)));(H2(2,1)*H2(2,2));(H2(3,1)*H2(1,2)+H2(2,1)*H2(3,2));(H2(3,1)*H2(3,2))]';

V11 = [(H2(1,1)*H2(1,1));(H2(1,1)*H2(2,1) +H2(2,1)*H2(1,1));(H2(3,1)*H2(1,1) + H2(1,1)*H2(3,1));H2(2,1)*H2(2,1);(H2(3,1)*H2(2,1) + H2(2,1)*H2(3,1));H2(3,1)*H2(3,1)]';

V22 = [(H2(1,2)*H2(1,2));(H2(1,2)*H2(2,2) + H2(2,2)*H2(1,2));(H2(3,2)*H2(1,2) + H2(1,2)*H2(3,2));(H2(2,2)*H2(2,2));(H2(3,2)*H2(2,2) + H2(2,2)*H2(3,2));(H2(3,2)*H2(3,2))]';

V2 =  [V12;(V11 - V22)];

V12 = [(H3(1,1)*H3(1,2));(H3(1,1)*H3(2,2) + H3(2,1)*H3(1,2));(H3(3,1)*H3(1,2) + (H3(1,1)*H3(3,2)));(H3(2,1)*H3(2,2));(H3(3,1)*H3(1,2)+H3(2,1)*H3(3,2));(H3(3,1)*H3(3,2))]';

V11 = [(H3(1,1)*H3(1,1));(H3(1,1)*H3(2,1) +H3(2,1)*H3(1,1));(H3(3,1)*H3(1,1) + H3(1,1)*H3(3,1));H3(2,1)*H3(2,1);(H3(3,1)*H3(2,1) + H3(2,1)*H3(3,1));H3(3,1)*H3(3,1)]';

V22 = [(H3(1,2)*H3(1,2));(H3(1,2)*H3(2,2) + H3(2,2)*H3(1,2));(H3(3,2)*H3(1,2) + H3(1,2)*H3(3,2));(H3(2,2)*H3(2,2));(H3(3,2)*H3(2,2) + H3(2,2)*H3(3,2));(H3(3,2)*H3(3,2))]';

V3 =  [V12;(V11 - V22)];


[U,S,A] = svd([V1;V2;V3]);


b = A(:,6);

B = [b(1,1) b(2,1) b(3,1);b(2,1) b(4,1) b(5,1);b(3,1) b(4,1) b(6,1)];
T = chol(B);

K = inv(T);

 r1 = T*H1(:,1);
    r2 = T*H1(:,2);
    r1 = (1/norm(r1))*r1;
    r2 = (1/(norm(r2)))*r2;
    r3 = cross(r1,r2);
    r3 = (1/norm(r3))*r3;

 R1 = horzcat(r1,r2,r3);
 
 t1 = T*H1(:,3);
 
 
 
 r1 = T*H2(:,1);
    r2 = T*H2(:,2);
    r1 = (1/norm(r1))*r1;
    r2 = (1/(norm(r2)))*r2;
    r3 = cross(r1,r2);
    r3 = (1/norm(r3))*r3;
 
 R2 = horzcat(r1,r2,r3);

 t2 = T*H2(:,3);
 
  r1 = T*H3(:,1);
    r2 = T*H3(:,2);
    r1 = (1/norm(r1))*r1;
    r2 = (1/(norm(r2)))*r2;
    r3 = cross(r1,r2);
    r3 = (1/norm(r3))*r3;
 
 R3 = horzcat(r1,r2,r3);
 
 t3 = T*H3(:,3);
 
 x11 = imagePoints(1,1,2);
x12 = imagePoints(6,1,2);
x13 = imagePoints(43,1,2);
x14 = imagePoints(48,1,2);

y11 = imagePoints(1,2,2);
y12 = imagePoints(6,2,2);
y13 = imagePoints(43,2,2);
y14 = imagePoints(48,2,2);


a11 = [-X1,-Y1,-1,0,0,0,x11*X1,x11*Y1,x11];
a12 = [0,0,0,-X1,-Y1,-1,y11*X1,y11*Y1,y11];

a21 = [-X2,-Y2,-1,0,0,0,x12*X2,x12*Y2,x12];
a22 = [0,0,0,-X2,-Y2,-1,y12*X2,y12*Y2,y12];

a31 = [-X3,-Y3,-1,0,0,0,x13*X3,x13*Y3,x13];
a32 = [0,0,0,-X3,-Y3,-1,y13*X3,y13*Y3,y13];

a41 = [-X4,-Y4,-1,0,0,0,x14*X4,x14*Y4,x14];
a42 = [0,0,0,-X4,-Y4,-1,y14*X4,y14*Y4,y14];

[U,S,V] = svd([a11;a12;a21;a22;a31;a32;a41;a42]);

H4 = [V(1,9) V(2,9) V(3,9);V(4,9) V(5,9) V(6,9);V(7,9) V(8,9) V(9,9)]; 
 
r1 = T*H4(:,1);
    r2 = T*H4(:,2);
    r1 = (1/norm(r1))*r1;
    r2 = (1/(norm(r2)))*r2;
    r3 = cross(r1,r2);
    r3 = (1/norm(r3))*r3;
 
 R4 = horzcat(r1,r2,r3);
 
 t4 = T*H4(:,3);
 
 x11 = imagePoints(1,1,4);
x12 = imagePoints(6,1,4);
x13 = imagePoints(43,1,4);
x14 = imagePoints(48,1,4);

y11 = imagePoints(1,2,4);
y12 = imagePoints(6,2,4);
y13 = imagePoints(43,2,4);
y14 = imagePoints(48,2,4);


a11 = [-X1,-Y1,-1,0,0,0,x11*X1,x11*Y1,x11];
a12 = [0,0,0,-X1,-Y1,-1,y11*X1,y11*Y1,y11];

a21 = [-X2,-Y2,-1,0,0,0,x12*X2,x12*Y2,x12];
a22 = [0,0,0,-X2,-Y2,-1,y12*X2,y12*Y2,y12];

a31 = [-X3,-Y3,-1,0,0,0,x13*X3,x13*Y3,x13];
a32 = [0,0,0,-X3,-Y3,-1,y13*X3,y13*Y3,y13];

a41 = [-X4,-Y4,-1,0,0,0,x14*X4,x14*Y4,x14];
a42 = [0,0,0,-X4,-Y4,-1,y14*X4,y14*Y4,y14];

[U,S,V] = svd([a11;a12;a21;a22;a31;a32;a41;a42]);

H5 = [V(1,9) V(2,9) V(3,9);V(4,9) V(5,9) V(6,9);V(7,9) V(8,9) V(9,9)]; 
 
r1 = T*H5(:,1);
    r2 = T*H5(:,2);
    r1 = (1/norm(r1))*r1;
    r2 = (1/(norm(r2)))*r2;
    r3 = cross(r1,r2);
    r3 = (1/norm(r3))*r3;
 
 R5 = horzcat(r1,r2,r3);
 
 t5 = T*H5(:,3);
 
 %WR = [X1 Y1 0 1;X2 Y2 0 1;X3 Y3 0 1;X4 Y4 0 1];
 
 %CR1 = [R1 t1]*(WR');
 
 WR = worldPoints';
 
 WR = vertcat(WR,zeros(1,size(WR,2)),ones(1,size(WR,2)));
 
 %CR1 = [R1 t1;0 0 0 1]*(WR);
 CR1 = [R5 t5;0 0 0 1]*(WR);
 
 CX1 = CR1(1,:); CY1 = CR1(2,:); CZ1 = CR1(3,:);
 
 plot3(CX1,CY1,CZ1,'o');
 
%  F = K*[R1 t1]*WR;
%  
%  F = (F./(F(3,:)));
%  F = abs(F);
 disp(K);
%  
 
 
 

 
