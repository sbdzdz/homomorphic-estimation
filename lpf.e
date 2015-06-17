function lpf(I, sigma, mode=2)
  M = size(I)[1];
  N = size(I)[2];

  h=gaussian(size(I), sigma);
  h=h/(mmax(h));
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
