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

I = readmatrix("../homomorphic_verification/MR_noisy.csv");
//SNR = readmatrix("../homomorphic_verification/MR_SNR.csv");
SNR = 0;

emFilterType = 2;
emWindowSize = 3;
emIterations = 10;
lpfF = 3.4;
lpfFSNR = 1.2;
lpfFRice = 5.4;
LPF = 3.4;
outGaussian = "../homomorphic_verification/MR_Gaussian_Map.csv";
outRician = "../homomorphic_verification/MR_Rician_Map.csv";

{MapG, MapR} = homomorphicEstimation(I, SNR, LPF, emFilterType, emWindowSize, emIterations, lpfF, lpfFSNR, lpfFRice);
writematrix(MapG, outGaussian);
writematrix(MapR, outRician);



