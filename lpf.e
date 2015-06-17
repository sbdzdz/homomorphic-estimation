function lpf(I, sigma, mode=2)
  M = size(I)[1];
  N = size(I)[2];

  if (mode==1) then
    h = gaussian(size(I), sigma);
    h = h/mmax(h);
    if(M==1)||(N==1) then
      lRnF = fftshift(conj(fft(I)));
      lRnF2 = lRnF*h;
      If = re(ifft(fftshift(conj(lRnF2))));
    else
      lRnF = fftshift2(fft2(I));
      lRnF2 = lRnF*h;
      If = re(ifft2(fftshift2(lRnF2)));
    endif
  elseif (mode==2) then
    h = gaussian(2*size(I), 2*sigma);
    h = h/mmax(h);
    h = h[(M+1):2*M, (N+1):2*N];
    if (M==1)||(N==1) then
      lRnF2 = lRnF*h;
      If = re(idct(lRnF2));
    else
      lRnF = dct2(I);
      lRnF2 = lRnF*h;
      If = re(idct2(lRnF2));
    endif
  endif 

  return If;
endfunction
