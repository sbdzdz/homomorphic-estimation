function gaussian(N, sigma)

indX = -floor(N[2]/2):floor(N[2]/2);
indY = -floor(N[1]/2):floor(N[1]/2);
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

function lpf(I, sigma)
M = size(I)[1];
N = size(I)[2];

h=gaussian(size(I), sigma);
if(M==1)||(M==1) then
lRnF=fft(I);
lRnF2=lRnF*h
If=re(ifft(lRnF2));
endif
return If;



endfunction
