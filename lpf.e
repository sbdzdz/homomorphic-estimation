function gaussian(N, sigma)

if (mod(N[2], 2) == 0) then
  indX = [-N[2]/2+0.5:-0.5, 0.5:N[2]/2-0.5];
else
  indX = -floor(N[2]/2):floor(N[2]/2);
endif

if (mod(N[1], 2) == 0) then
  indY = [-N[1]/2+0.5:-0.5, 0.5:N[1]/2-0.5];
else
  indY = -floor(N[1]/2):floor(N[1]/2);
endif

X = zeros(N[1],N[2]);
Y = zeros(N[1],N[2]);

for i=1:N[1]
  X[i,]=indX;
end

for i=1:N[2]
  Y[,i]=indY';
end

h = exp(-(X^2+Y^2)/(2*sigma^2));

return h/sum(sum(h)')

endfunction

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

function lpf(I, sigma)
M = size(I)[1];
N = size(I)[2];

h=gaussian(size(I), sigma);
h=h/(max(max(h)'));
if(M==1)||(N==1) then
  lRnF=fftshift(conj(fft(I)));
  lRnF2=lRnF*h;
  If=re(ifft(fftshift(conj(lRnF2))));
else
  lRnF=fftshift2(fft2(I));
  lRnF2=lRnF*h;
  If=re(ifft2(fftshift2(lRnF2)));
endif
return If;



endfunction
