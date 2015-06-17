load approxBessel
load correctRiceGauss
load filter
load expectationMaximisation
load lpf
load homomorphicEstimation

//I = readmatrix("MR_noisy.csv");
//SNR = readmatrix("MR_SNR.csv");

emFilterType = 2;
emWindowSize = 3;
emIterations = 10;
lpfF = 3.4;
lpfFSNR = 1.2;
lpfFRice = 5.4;
LPF = 4.8;
outGaussian = "MR_Gaussian_Map.csv";
outRician = "MR_Rician_Map.csv";

//{MapG, MapR} = homomorphicEstimation(I, SNR, LPF, emFilterType, emWindowSize, emIterations, lpfF, lpfFSNR, lpfFRice);
//writematrix(MapG, outGaussian);
//writematrix(MapR, outRician);



