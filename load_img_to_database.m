
% out{1} = imread('benchPics/1_1_RKK.jpg'); 
% out{2} = imread('benchPics/test.jpg');
% out{3} = imread('benchPics/image_0043.jpg');

JPG = dir('benchPics/*.jpg');

for i = 1: size(JPG,1)
    out{i} = imread(['benchPics/' JPG(i).name]);
end

clear JPG
