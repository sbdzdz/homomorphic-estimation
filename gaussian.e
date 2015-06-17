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

  for i=1 to N[1]
    X[i,]=indX;
  end

  for i=1 to N[2]
    Y[,i]=transpose(indY);
  end

  h = exp(-(X^2+Y^2)/(2*sigma^2));
  return h/msum(h);

endfunction
