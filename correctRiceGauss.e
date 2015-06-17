function correctRiceGauss(snr)
  Fc = zeros(size(snr));
  coefs = [-0.289549906258443, -0.0388922575606330, 0.409867108141953, -0.355237628488567, 0.149328280945610, -0.0357861117942093, 0.00497952893859122, -0.000374756374477592, 1.18020229140092e-05];

  for i=1 to length(coefs);
    Fc = Fc + coefs[i]*snr^(i-1);
  end

  return Fc*(snr <= 7);
endfunction
