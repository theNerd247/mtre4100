rawData2 = [];
legends = {};

for i = 1:4
  file = sprintf("../data/lab2_pt2_n%i.csv",i);
  rawData2 = [rawData2, dlmread(file,",",1,0)];
  legends{i} = sprintf("n = %i",i);
end

plot(rawData2);
ylabel("Amplitude");
xlabel("Time (s)");
title("Sine wave Fourier Decomposition");
legend(legends);
