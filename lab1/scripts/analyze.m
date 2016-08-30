clear all;
close all;

pwd

file1 = "../data/2016-08-25_lab1-15hz_1st.csv";
file2 = "../data/2016-08-25_lab1-30hz_1st.csv";

rawData1 = dlmread(file1,',',1,0);


plot(rawData1(:,1), rawData1(:,2));
%print('../img/foAnalResponse.pdf','-S600,400');

tc1 = interp1(rawData1(:,2),rawData1(:,1),0.632);
