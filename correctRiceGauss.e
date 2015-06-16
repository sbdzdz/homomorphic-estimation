function correctRiceGauss(snr)
coefs = [-0.2895, -0.0389, 0.4099, -0.3552, 0.1493, -0.0358, 0.0050, -0.0004, 0.0000];

Fc = zeros(size(snr));

for i=1 to length(coefs);
  Fc = Fc + coefs[i]*snr^(i-1);
end

Fc = Fc*(snr <= 7);
return Fc;
endfunction
