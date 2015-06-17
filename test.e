load approxBessel
load correctRiceGauss
load filter
load expectationMaximisation
load lpf
load homomorphicEstimation

I = readmatrix("testMatrix.csv");
//SNR = readmatrix("MR_SNR.csv");
LPF = 3.4;

emFilterType = 1;
emWindowSize = 3;
emIterations = 10;
lpfF = 3.4;
lpfFSNR = 1.2;
lpfFRice = 5.4;
SNR = 0;

{MapG, MapR} = homomorphicEstimation(I, SNR, LPF, emFilterType, emWindowSize, emIterations, lpfF, lpfFSNR, lpfFRice);

writematrix(MapG, "gauss.csv");
writematrix(MapR, "rice.csv");
