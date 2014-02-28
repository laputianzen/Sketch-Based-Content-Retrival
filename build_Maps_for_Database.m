function [ output_args ] = build_Maps_for_Database( input_args )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
% example of calling gbvs() with default params and then displaying result
outW = 200;
out = {};
cell_sz = size(input_args,2);
% compute saliency maps for some images
for i = 1 : cell_sz
  
  %img = imread(sprintf('samplepics/%d.jpg',i));
  img = input_args{i};

  %tic; 
  output_args.saliency_BoundMaps{i} = salientBoundaryExtraction(img);
  
  output_args.DV_Maps{i} = dv_map(output_args.saliency_BoundMaps{i});
  output_args.EV_Maps{i} = ev_map(output_args.saliency_BoundMaps{i});


end

