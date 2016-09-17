clear all;
close all;

pwd

file1 = "../data/2016-08-25_lab1-15hz_1st.csv";
file2 = "../data/2016-08-25_lab1-30hz_1st.csv";
file3 = "../data/2016-08-25_lab1-30hz_2nd.csv";

rawData1 = dlmread(file1,',',1,0);
rawData2 = dlmread(file2,',',1,0);
rawData3 = dlmread(file3,',',1,0);

plot(rawData1(:,1), rawData1(:,2));
print('../img/foAnalResponse1.pdf','-S600,400');
tc1 = interp1(rawData1(:,2),rawData1(:,1),0.632);
tc1th = 100*0.1061e-3;


plot(rawData1(:,1), rawData1(:,2));
print('../img/foAnalResponse2.pdf','-S600,400');
tc2 = interp1(rawData2(:,2),rawData1(:,1),0.632);
tc2th = 50*0.1061e-3;

foData = [100, 0.1061, tc1th, tc1, percentError(tc1,tc1th); 50, 0.1061, tc2th, tc2, percentError(tc2,tc2th)];
saveData('../data/foResults.tex',toLatexString(foData,{'%i','%.4f','%.3e','%.3e','%.2f'}));

y2max = max(rawData3(:,2));
y2ss = rawData3(rows(rawData3)-1,2);

y2OS = (y2max - y2ss) / y2ss * 100

xi = 1/(sqrt(2));
y2OSth = 100 * exp(-xi * (pi/sqrt(1-xi^2)));

y2OSerr = percentError(y2OS,y2OSth);

plot(rawData3(:,1),rawData3(:,2));
print('../img/seAnalResponse.pdf','-S600,400');
