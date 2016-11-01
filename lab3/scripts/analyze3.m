clear all;
close all;

data = csvread('../data/lab4-2016-09-15/2k-4k/orig/measuredData_16-09-15_2036.lvm');

max(abs(data(:,2)))

plotData(data);

print('../img/pt3.pdf','-S600,400');
