function approxBessel(z)
  z8 = 8*z;
  Mn = 1-3*z8^(-1)-15/2*(z8)^(-2)-(3*5*21)/6*(z8)^(-3);
  Md = 1+1*z8^(-1)+9/2*(z8)^(-2)+(25*9)/6*(z8)^(-3);
  M = Mn/Md;
  if (msum(z < 1.5) > 1) then
    K = mnonzeros(z < 1.5);
    for i=1 to length(K)
      M[K[i, 1], K[i, 2]] = besseli(z[K[i, 1], K[i,2]], 1)/besseli(z[K[i,1], K[i,2]], 0);
    end
  endif
  if(msum(z==0)) > 0 then
    k = mnonzeros(z==0);
    mset(M, k, 0);
  endif
  return M;
endfunction
