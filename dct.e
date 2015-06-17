function dct(x)
  N = length(x);
  y = zeros(N);
  y[1] = sum(x)/sqrt(2);

  for i=2:N
    y[i] = sum(x*cos(pi/(2*N)*(2*(1:N)-1)*(i-1)));
  end

  return sqrt(2)/sqrt(N)*y;
endfunction

function dct(x)
  N = length(x);
  y = zeros(N);
  y[1] = sum(x)/sqrt(2);

  for i=2:N
    y[i] = sum(x*cos(pi/(2*N)*(2*(1:N)-1)*(i-1)));
  end

  return sqrt(2)/sqrt(N)*y;
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
