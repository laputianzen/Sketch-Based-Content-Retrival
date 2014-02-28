function out = dv_map(in)
     out = bwdist((in),'chessboard');
     %figure, imshow(uint8(out));
end
