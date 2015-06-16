function expectationMaximisation(I, N, Ws)

Mask=ones(Ws)/prod(Ws);
a=sqrt(sqrt(max(2*filter2D(Mask, I^2)^2-filter2D(Mask, I^4),0)));
sigma=0.5*max(filter2D(Mask, I^2)-a^2, 0.01);

for i=1:N
  a=max(filter2D(Mask, approxBessel(a*I/sigma)*I), 0);
  sigma=max(0.5*filter2D(Mask, abs(I)^2)-a^2/2, 0.01);
end

return {a, sqrt(sigma)};

endfunction
