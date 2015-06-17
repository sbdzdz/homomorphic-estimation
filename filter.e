function filter2D(h, I)
  mh = (size(h)[1]-1)/2;
  nh = (size(h)[2]-1)/2;
  M = size(I)[1];
  N = size(I)[2];
  I2 = padarray(I, mh);
  Iout = zeros(M, N);
  for i=mh+1 to mh+M
    for j=nh+1 to nh+N
      Iout[i-mh, j-nh] = msum(I2[i-mh:i+mh, j-nh:j+nh]*h); 
    end
  end
  return Iout;
endfunction
