function correctRiceGauss(snr:vector)
coefs = [-0.2895, -0.0389, 0.4099, -0.3552, 0.1493, -0.0358, 0.0050, -0.0004, 0.0000];

Fc = zeros(length(snr));

for i=1 to length(coefs);
  Fc = Fc + coefs[i]*snr^[i-1];
end

return Fc.*(snr <= 7);
endfunction
