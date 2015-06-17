function w(N)
  return [1/sqrt(N), sqrt(2/N)*ones(N-1)];
endfunction

function dct(x)
  N = length(x);
  y = zeros(N);
  for i=1:N
    y[i] = sum(x*cos(pi/(2*N)*(2*(1:N)-1)*(i-1)));
  end
  return w(N)*y;
endfunction

function idct(y)
  N = length(y);
  x = zeros(N);
  for i=1:N
    x[i] = sum(w(N)*y*cos(pi*(2*i-1)*((1:N)-1)/(2*N)));
  end
  return x;
endfunction

function dct2(A)
  M = size(A)[1];
  N = size(A)[2];
  Iout = zeros(M, N);
  for i=1:M
    Iout[i, ] = dct(A[i,]);
  end
  for j=1:N
    Iout[, j] = dct(Iout[, j]')';
  end
  return Iout;
endfunction

function idct2(A)
  M=size(A)[1];
  N=size(A)[2];
  Iout=zeros(M, N);
  for j=1:N
    Iout[, j] = idct(A[, j]')';
  end
  for i=1:M
    Iout[i, ] = idct(Iout[i, ]);
  end
  return Iout;
endfunction
