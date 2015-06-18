load approxBessel
load correctRiceGauss
load filter
load expectationMaximisation
load lpf
load homomorphicEstimation
load dft
load dct
load gaussian
load auxiliary

//Config start
emFilterType = 2;
emWindowSize = 3;
emIterations = 10;
LPF = 3.4;
lpfFSNR = 1.2;
lpfFRice = 5.4;
inMR = "../homomorphic_verification/MR_noisy.csv";
inSNR = "../homomorphic_verification/MR_SNR.csv";
outGaussian = "../homomorphic_verification/MR_Gaussian_Map.csv";
outRician = "../homomorphic_verification/MR_Rician_Map.csv";
//Config end

I = readmatrix(inMR);
SNR = readmatrix(inSNR);
//SNR = 0;
t1 = time();
{MapG, MapR} = homomorphicEstimation(I, SNR, LPF, emFilterType, emWindowSize, emIterations, lpfFSNR, lpfFRice);
t2 = time();
writematrix(MapG, outGaussian);
writematrix(MapR, outRician);
t2-t1



