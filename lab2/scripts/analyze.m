rawData1 = [];
legends = {};

rawData1 = dlmread('../data/lab2_pt1_src.csv',',',1,1);
legends{1} = "Square Wave";
rawData1 = [rawData1,dlmread('../data/lab2_pt1_filter.csv',',',1,1)];
legends{2} = "Fouier Square Wave";

plot(rawData1);
title("Square Wave Fourier Transform");
ylabel("Amplitude");
xlabel("Time (s)");
legend(legends);

print("../img/sqrWave.pdf",'-S600,400');

clear all;
close all;

rawData2 = [];
legends = {};

for i = 1:4
  file = sprintf("../data/lab2_pt2_n%i.csv",i);
  rawData2 = [rawData2, dlmread(file,",",1,1)];
  legends{i} = sprintf("n = %i",i);
end

plot(rawData2);
ylabel("Amplitude");
xlabel("Time (s)");
title("Sine wave Fourier Decomposition");
legend(legends);

print('../img/sinWaves.pdf','-S600,400');
