# Homomorphic Estimation
Estimation of the variable map of noise out of SENSE magnetic resonance data using a homomorphic approach.

##Euler Math Toolbox
Euler Math Toolbox (EMT) is a powerful math program combining numerical and symbolic tools in one free package. It has been developed and is maintained by R. Grothmann, professor of mathematics at the University of Eichstätt, together with a net community of helping hands.
###Download
EMT can be downloaded from [project website](http://www.euler-math-toolbox.de/download.html).
###Installation
The installation process on Windows is straighforward and its detailed description can be found [here](http://www.euler-math-toolbox.de/documentation/installation.html). EMT can be also run on Linux under [Wine](https://www.winehq.org/).
##Running the application
Before the first run, fill in the configuration section in `main.e`:
```java
emFilterType = 2;  // 1 - local mean
                   // 2 - expectation-maximisation (EM)
emWindowSize = 3;  // window size for E{x}
emIterations = 10; // number of iterations of the EM algorithm
LPF = 3.4;         // sigma for LPF filter
lpfFSNR = 1.2;     // sigma for LPF filter; used to smooth sigma(x) in SNR
lpfFRice = 5.4;    // sigma for LPF filter; used to smooth Rician corrected noise map
inMR = "MR_noisy.csv";               // Noisy MR image
inSNR = "MR_SNR.csv";                // SNR
outGaussian = "MR_Gaussian_Map.csv"; // Estimated noise for Gaussian case
outRician = "MR_Rician_Map.csv";     // Estimated noise for Rician case
```
Then, open `notebook.en` and type `load main`.

