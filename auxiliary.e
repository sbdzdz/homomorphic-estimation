function msum(A)
  return sum(transpose(sum(A)));
endfunction

function mmax(A)
  return max(transpose(max(A)));
endfunction

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

