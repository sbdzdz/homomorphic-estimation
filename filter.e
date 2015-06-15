function padarray(I, margin)

M = size(I)[1];
N = size(I)[2];

Iout = zeros(M+2*margin, N+2*margin);
Iout[margin+1:margin+M, margin+1:margin+N] = I;

for i=margin+1 to margin+M
  Iout[i, 1:margin] = Iout[i,margin+1];
  Iout[i, -margin:-1] = Iout[i, -margin-1];
end

for i=1 to margin
  Iout[i,] = Iout[margin+1,];
  Iout[-i,] = Iout[-margin-1,];
end
return Iout;

endfunction

function filter2D(h, I)

mh = (size(h)[1]-1)/2;
nh = (size(h)[2]-1)/2;
M = size(I)[1];
N = size(I)[2];

I2 = padarray(I, mh);
Iout = zeros(M, N);

for i=mh+1 to mh+M
  for j=nh+1 to nh+N
    Iout[i-mh, j-nh] = sum(sum(I2[i-mh:i+mh, j-nh:j+nh]*h)'); 
  end
end

return Iout;
endfunction
