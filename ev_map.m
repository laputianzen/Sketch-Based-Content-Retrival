function out = ev_map(in)
    total_edgePixel = sum(sum(single(in)));
    out = single(in)/total_edgePixel;

end