function [norm_F] = estimateFundamentalMatrixRANSAC(corresponding_pts1, corresponding_pts2)

%here corresponding_pts(&2) is a nx2 where n is the number of correspondences

%M is margin

%RANSAC number of iterations = 10 i.e, 50 estimations best will be picked
%from

n = size(corresponding_pts1,1);
%disp(size(corresponding_pts1,2))
%return

max_inliers = 0 ;
index_maxF = 0 ;

ct1 = corresponding_pts1;
ct2 = corresponding_pts2;

M = 0.9 ; %margin

R = randi(n,1,8); %each row is the row of indices for that iteration in ransac
%disp(R)
%return

for i = 1:100
   R = vertcat(R,(randi(n,1,8)));
     
end

R = R(2:end,:);

error =1000;
for i = 1:100
   A = rand(1,9);
   
   for j = 1:8
    
       a = [ct1(abs(R(i,j)),1)*ct2(abs(R(i,j)),1),ct1(abs(R(i,j)),1)*ct2(abs(R(i,j)),2),ct1(abs(R(i,j)),1),ct1(abs(R(i,j)),2)*ct2(abs(R(i,j)),1),ct1(abs(R(i,j)),2)*ct2(abs(R(i,j)),2),ct1(abs(R(i,j)),2),ct2(abs(R(i,j)),1),ct2(abs(R(i,j)),2),1];
       A = vertcat(A,a);
       
   end
    
   A = A(2:end,:);

   [U,W,V] = svd(A);
   
   f = V(:,end);
   
   F = reshape(f,[3,3]);
   F = F';
   
   %error = 1000;
   
   %Find number of inliners
   
   %disp(F)
   %return 
   
   count = rand(1,n);
   %%%%%%%%%%%%%%%%%%%%%%here I will perform MSAC%%%%%%%%%%%%%%%%%%%%%%%%
%    err = 0 ;
%    for k = 1:n
%        err = err + abs([ct1(k,1);ct1(k,2);1]'*F*[ct2(k,1);ct2(k,2);1]);
%        
%    end
%    %disp(err)
%    %disp(error)
%    if err < error
%        error = err;
%        index_maxF = i;
%        %disp(index_maxF)
%    
%    end
   
   %%%%%%%%%%Below is RANSAC%%%%%%%%%%%%%%%%%%
   
   
   num_inliers = 0;
   for k = 1:n
       %disp([ct1(k,1);ct1(k,2);1]'*F*[ct2(k,1);ct2(k,2);1])
       count(1,k) = abs([ct1(k,1);ct1(k,2);1]'*F*[ct2(k,1);ct2(k,2);1]);
       if 0.05 >= abs([ct1(k,1);ct1(k,2);1]'*F*[ct2(k,1);ct2(k,2);1]) 
           %disp("kai")
           num_inliers = num_inliers + 1;
       end
       
   end
   %disp(num_inliers);
   %histogram(count,25)
   %return
   if num_inliers > max_inliers
   max_inliers = num_inliers;
   index_maxF = i;
       
   end
   %disp(max_inliers);
   %disp(index_maxF);
end

%disp(count);

%return

%disp(R)

i = index_maxF;
%disp(i)
%disp("kai")
%disp(i)
%return
A = rand(1,9);

%A = rand(1,9);
   
for j = 1:8
    
       a = [ct1(abs(R(i,j)),1)*ct2(abs(R(i,j)),1),ct1(abs(R(i,j)),1)*ct2(abs(R(i,j)),2),ct1(abs(R(i,j)),1),ct1(abs(R(i,j)),2)*ct2(abs(R(i,j)),1),ct1(abs(R(i,j)),2)*ct2(abs(R(i,j)),2),ct1(abs(R(i,j)),2),ct2(abs(R(i,j)),1),ct2(abs(R(i,j)),2),1];
       A = vertcat(A,a);
end
   
   A = A(2:end,:);

   [U,W,V] = svd(A);
   
   f = V(:,end);
   
   F = reshape(f,[3,3]);
   F = F';
   

if rank(F) == 3
   
    [u,d,v] = svd(F);
    new_d = diag([d(1,1) d(2,2) , 0]);
    F = u * new_d * v' ; %v' or v see%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

end

norm_F = F;
%disp(F)
%disp(rank(F))

%disp("kai")