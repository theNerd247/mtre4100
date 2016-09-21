clear all;
close all;

function [amp, ofst, 1,q,q] = calcErrors(data)
  
end

function doStuff(data)
  plotData(data);

  calcErrors(data);
end

for i = 0:0
  fname = sprintf('../data/lab4-2016-09-15/n80-200/measuredData_16-09-15_%i.lvm',2026+i);

  doStuff(csvread(fname));
end
