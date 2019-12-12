
%For SrcFiles, select the folder for building the library of SURF features

%Run surf through all cropped images
%Use opencv to crop images based on annotations collected before hand
%Use file location desired for testing for srcFilestest
%if using un annotated images, uncomment lines 15 and 16 

tic;
srcFiles = dir('C:\Users\kktar\Documents\Academics\WPI collection\RBE 549\CV project\training_image\training_image\Karim\L4_1-8Ball\*.png');  % the folder in which ur images exists
Features = cell(length(srcFiles),1) ;
Valid_points = cell(length(srcFiles),1) ;
for i = 1 : length(srcFiles)
    filename = strcat('C:\Users\kktar\Documents\Academics\WPI collection\RBE 549\CV project\training_image\training_image\Karim\L4_1-8Ball\',srcFiles(i).name);
    I = rgb2gray(imread(filename));
    I1 = I(90:230,40:160);
    points1 = detectSURFFeatures(I1);
    [features1, valid_points1] = extractFeatures(I1, points1);
    Features{i} = features1;
    %valid_points1 = cell2mat(valid_points1);
    Valid_points{i} = valid_points1;
    %figure; imshow(I1);hold on;
    %plot(valid_points1{i}.selectStrongest(10),'showOrientation',true);
end
% Features
% Valid_points
clc;
toc;
%bookshelf test
tic;
% Bookshelf 
Ka = imread('bookshelf.jpg');
% Neither Ka = imread('C:\Users\kktar\Documents\Academics\WPI collection\RBE 549\CV project\training_image\training_image\Neg_L3\88.png');
% 8Ball L2 Ka =imread('C:\Users\kktar\Documents\Academics\WPI collection\RBE 549\CV project\test_image\test_image\L2-1-8Ball_test\131.png');
% Ka = imread('test_L2_both_84.PNG');
% Ka = imread('test_L3_both_42.PNG');

K = rgb2gray(Ka);
points1 = detectSURFFeatures(K);
[features1, valid_points1] = extractFeatures(K, points1);
mpq = 0;
for i = 1 : length(srcFiles)
    features2 = cell2mat(Features(i));
    %features2 = cell2mat(features2);
    valid_points2 = Valid_points{i};
    %valid_points2 = valid_points2{1};
    indexPairs = matchFeatures(features1,features2);
    matchedPoints1 = valid_points1(indexPairs(:,1));
    matchedPoints2 = valid_points2(indexPairs(:,2));
    
    if mpq  < matchedPoints1.Count
       img_no=i;
       mpq=matchedPoints1.Count;
       mp1 = matchedPoints1;
       mp2 = matchedPoints2;
%        vp1 = valid_points2;
%        vp2 = valid_points2;
       filename = strcat('C:\Users\kktar\Documents\Academics\WPI collection\RBE 549\CV project\training_image\training_image\Karim\L4_1-8Ball\',srcFiles(i).name);
       
    end
end

toc;

K2a = imread(filename);
K2 = rgb2gray(K2a);
figure; showMatchedFeatures(K2a,Ka,mp2,mp1);


XY = mp1.Location;
XY = round(XY);
X1 = min(XY(:,1));
Y1 = min(XY(:,2));
X2 = max(XY(:,1));
Y2 = max(XY(:,2));

Q = K;
Q(Y1,X1:X2) = 255;
Q(Y2,X1:X2) = 255;
Q(Y1:Y2,X1) = 255;
Q(Y1:Y2,X2) = 255;


figure;
imshow(Q);


%Use file location desired for testing for srcFilestest

% 
% for pp = 1:4
% 
% pos = 0;
% neg = 0;
% if pp == 1 %L1
%     srcFilestest = dir('C:\Users\kktar\Documents\Academics\WPI collection\RBE 549\CV project\test_image\test_image\L1_1-8-ball_test\*.png');  % the folder in which ur images exists
% 
%  
% elseif pp == 2 % L2
%     srcFilestest = dir('C:\Users\kktar\Documents\Academics\WPI collection\RBE 549\CV project\test_image\test_image\L2-1-8Ball_test\*.png');  % the folder in which ur images exists
% 
% elseif pp == 3 % L3 
%     srcFilestest = dir('C:\Users\kktar\Documents\Academics\WPI collection\RBE 549\CV project\test_image\test_image\L3_1-8Ball_test\*.png');  % the folder in which ur images exists
% 
% elseif pp == 4
%     srfFilestest = dir('C:\Users\kktar\Documents\Academics\WPI collection\RBE 549\CV project\test_image\test_image\Neg_L4_test\*.png');
% end
% %L4 srcFilestest = dir('C:\Users\kktar\Documents\Academics\WPI collection\RBE 549\CV project\test_image\test_image\L1_1-8-ball_test\*.png');  % the folder in which ur images exists
% 
% 
% %Features = cell(length(srcFiles),1) ;
% %Valid_points = cell(length(srcFilestest),1) ;
% for j = 1 : length(srcFilestest)
%     filename = strcat('C:\Users\kktar\Documents\Academics\WPI collection\RBE 549\CV project\training_image\training_image\Karim\L4_1-8Ball\',srcFiles(i).name);
%     K3 = rgb2gray(imread(filename));
%     points1 = detectSURFFeatures(K3);
%     [features1, valid_points1] = extractFeatures(K3, points1);
%     
%     for i = 1 : length(srcFiles)
%         features2 = cell2mat(Features(i));
%         %features2 = cell2mat(features2);
%         valid_points2 = Valid_points{i};
%         %valid_points2 = valid_points2{1};
%         indexPairs = matchFeatures(features1,features2);
%         matchedPoints1 = valid_points1(indexPairs(:,1));
%         matchedPoints2 = valid_points2(indexPairs(:,2));
%     
%        if mpq  < matchedPoints1.Count
%             img_no=i;
%             mpq=matchedPoints1.Count;
%             mp1 = matchedPoints1;
%             mp2 = matchedPoints2;
% %           vp1 = valid_points2;
% %           vp2 = valid_points2;
%             filename = strcat('C:\Users\kktar\Documents\Academics\WPI collection\RBE 549\CV project\training_image\training_image\Karim\L4_1-8Ball\',srcFiles(i).name);
%        end
%     end
%     
%     XY = mp1.Location;
%     XY = round(XY);
%     X1 = min(XY(:,1));
%     Y1 = min(XY(:,2));
%     X2 = max(XY(:,1));
%     Y2 = max(XY(:,2));
%     
%     %If image has pixel 1 in the Q boundary, Pos = Pos + 1; 
%     K3 = im2bw(K3,0.0000000000000000000000000000001);
%     [row col] = find(K3 == 0);
%     row=(mean(row));
%     col=mean(col);
%     if row >= Y1 && row <= Y2
%         if col >= X1 && col <= X2
%             pos = pos+1;
%         end
%     else
%         neg = neg+1;
%     end
%         
% end
%     
%     %Features{i} = features1;
%     %valid_points1 = cell2mat(valid_points1);
%     %Valid_points{i} = valid_points1;
%     %figure; imshow(I1);hold on;
%     %plot(valid_points1{i}.selectStrongest(10),'showOrientation',true);
% 
% TestResults = pos/length(srcFilestest);
% TestResults * 100;
% Test(pp) = TestResults
% end



