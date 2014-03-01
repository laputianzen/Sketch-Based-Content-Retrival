function img_thresholded = salientBoundaryExtraction(img)
    % this is how you call gbvs
    % leaving out params reset them to all default values (from
    % algsrc/makeGBVSParams.m)
    out = gbvs( img );
    outW = 200;
    threshold = 0.01;

    % show result in a pretty way  
    s = outW / size(img,2) ; 
    sz = size(img); sz = sz(1:2);
    sz = round( sz * s );

    img = imresize( img , sz , 'bicubic' );  
    saliency_map = imresize( out.master_map , sz , 'bicubic' );
    %saliency_Region=saliency_map >= prctile(saliency_map(:),75);
    saliency_Region=saliency_map >= threshold;
    BW1 = rgb2gray(img);
    SE = strel('arbitrary',eye(5)); 
    BW2 = BW1-imerode(BW1,SE); 
    imerode_threshold = 25;
    img_thresholded = BW2.*uint8(saliency_Region)>imerode_threshold;
    %figure,imshow(img_thresholded);
    %img_thresholded = img .* repmat( saliency_map >= prctile(saliency_map(:),75) , [ 1 1 size(img,3) ] );  
end