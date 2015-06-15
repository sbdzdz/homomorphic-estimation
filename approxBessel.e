function approxBessel(z:vector)

z8 = 8.*z;
Mn=1-3*z8^(-1)-15/2*(z8)^(-2)-(3*5*21)/6*(z8)^(-3);
Md=1+1*z8^(-1)+9/2*(z8)^(-2)+(25*9)/6*(z8)^(-3);
M=Mn/Md;

if (sum(z < 1.5) > 1) then
K = nonzeros(z < 1.5);
M[K] = besseli(z[K], 1)/besseli(z[K], 0);
endif

M[nonzeros(z==0)] = 0;
return M;
endfunction
