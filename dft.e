function fftshift(fft)
  half = ceil(length(fft)/2);
  return  [fft[half+1:length(fft)], fft[1:half]];
endfunction

function fftshift2(A)
  M = size(A)[1];
  N = size(A)[2];
  Iout = zeros(M, N);
  for i=1:M
    Iout[i, ] = fftshift(A[i,]);
  end
  for j=1:N
    Iout[, j] = fftshift(Iout[, j]')';
  end
  return Iout;
endfunction

function fft2(A)
  M = size(A)[1];
  N = size(A)[2];
  Iout = zeros(M, N);
  for i=1:M
    Iout[i, ] = fft(A[i,]);
  end
  for j=1:N
    Iout[, j] = fft(Iout[, j]')';
  end
  return conj(Iout);
endfunction

function ifft2(A)
  M = size(A)[1];
  N = size(A)[2];
  Iout = zeros(M, N);
  for j=1:N
    Iout[, j] = ifft(conj(A[, j]'))';
  end
  for i=1:M
    Iout[i, ] = ifft(Iout[i, ]);
  end
  return Iout;
endfunction
