function homomorphicEstimation(I, SNR=0, LPF=3.4, emFilterType=2, emWindowSize=3, emIterations=10, lpfF=3.4, lpfFSNR=1.2, lpfFRice=5.4)

  eg=0.5772156649015328606;

  {M2, Sigma} = expectationMaximisation(I, emIterations, [emWindowSize, emWindowSize]);
  Sigma2 = lpf(Sigma, lpfFSNR);
  M1 = filter2D(ones(5, 5)/25, I);

  if (length(SNR))==1
    if (SNR==0)
      SNR=M2*Sigma^(-1);
    endif
  endif

  Rn=abs(I-M1);
  lRn=log(Rn*(Rn!=0)+0.001*(Rn==0));
  LPF2=lpf((lRn), LPF);
  Map2=exp(LPF2);
  MapG=Map2*2/sqrt(2)*exp(eg/2);

  if emFilterType == 1
    LocalMean=M1;
  else
    LocalMean=M2;
  endif

  Rn = abs(I-LocalMean);
  lRn = log(Rn*(Rn!=0)+0.001*(Rn==0));
  LPF2 = lpf((lRn), LPF);
  Fc1 = correctRiceGauss(SNR);
  LPF1 = LPF2-Fc1;
  LPF1 = lpf((LPF1), lpfFRice);
  Map = exp(LPF1);
  MapR = Map*2/sqrt(2)*exp(eg/2);

  return{MapG, MapR};
endfunction



