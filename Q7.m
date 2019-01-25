a = [1,0,0];
b = [0,1,0];
% quat = quaternion(deg2rad([30,45,0]),'euler','ZYX','point');

eul =[pi/3 pi/4 pi/2];
rotm = eul2rotm(eul);



% quat = rotm2quat(rotm);
% 
% rP = rotate(quat,[a;b]);
% 
rP = (rotm*(horzcat(a',b')))';
a = [1,0,0];
b = [0,1,0];
% quat = quaternion(deg2rad([30,45,0]),'euler','ZYX','point');

eul =[pi/3 pi/4 pi/2];
rotm = eul2rotm(eul);

rP = (rotm*([horzcat(a',b')]))';

plot3(a(1),a(2),a(3),'bo');



hold on
grid on
axis([-1 1 -1 1 -1 1]);
xlabel('x');
ylabel('y');
zlabel('z');

plot3(b(1),b(2),b(3),'bo');
plot3(rP(1,1),rP(1,2),rP(1,3),'rd');
plot3(rP(2,1),rP(2,2),rP(2,3),'rd');

plot3([0;rP(1,1)],[0;rP(1,2)],[0;rP(1,3)],'k');
plot3([0;rP(2,1)],[0;rP(2,2)],[0;rP(2,3)],'k');
plot3([0;a(1)],[0;a(2)],[0;a(3)],'k');
plot3([0;b(1)],[0;b(2)],[0;b(3)],'k');

