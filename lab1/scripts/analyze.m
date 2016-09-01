clear all;
close all;

pwd

file1 = "../data/2016-08-25_lab1-15hz_1st.csv";
file2 = "../data/2016-08-25_lab1-30hz_1st.csv";
file3 = "../data/2016-08-25_lab1-30hz_2nd.csv";

rawData1 = dlmread(file1,',',1,0);
rawData3 = dlmread(file3,',',1,0);


plot(rawData1(:,1), rawData1(:,2));
print('../img/foAnalResponse.pdf','-S600,400');

tc1 = interp1(rawData1(:,2),rawData1(:,1),0.632)

y2max = max(rawData3(:,2));
y2ss = rawData3(rows(rawData3)-1,2);

y2OS = (y2max - y2ss) / y2ss * 100

xi = 1/(sqrt(2));
y2OSth = 100 * exp(-xi * (pi/sqrt(1-xi^2)));

y2OSerr = (y2OS - y2OSth) / y2OSth * 100

plot(rawData3(:,1),rawData3(:,2));
print('../img/seAnalResponse.pdf','-S600,400');
