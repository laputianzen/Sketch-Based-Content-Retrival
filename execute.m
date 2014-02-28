clear all
close all

tic
load_img_to_database; %create variable out

Database = build_Maps_for_Database(out);
toc

file = str2num(input('Which picture do you select? [1-3]:','s'));

switch file
    case {1}
        test1 = rgb2gray(imread('draws/river_horse_draw.jpg'));
    case {2}
        test1 = rgb2gray(imread('draws/len_key_draw.jpg'));
    case {3}
        test1 = rgb2gray(imread('draws/lobster_draw.jpg'));
end

figure, subplot(3,2,1),imshow(test1);

test1 = ~im2bw(test1);
test1EV = ev_map(test1);
test1DV = dv_map(test1);

for i=1:size(out,2)
    score(i) = (sum(sum(Database.DV_Maps{i}.*test1EV)) + sum(sum(Database.EV_Maps{i}.*test1DV)))/2;
end
score

Ranking = sort(score,'ascend');

%index = find(score == min(score));
%subplot(1,2,2), imshow(out{index});
subplot(3,2,2), imshow(out{find(score == Ranking(1))});
subplot(3,2,4), imshow(out{find(score == Ranking(2))});
subplot(3,2,6), imshow(out{find(score == Ranking(3))});

