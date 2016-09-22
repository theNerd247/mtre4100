clear all;
close all;

function doStuff(data,hz)

  plotData(data);

  fname = sprintf('../img/pt2_%iHz.pdf',hz);
  print(fname,'-S600,400');

  close;
end

for i = 0:9:9
  fname = sprintf('../data/lab4-2016-09-15/n80-200/measuredData_16-09-15_%i.lvm',2026+i);

  doStuff(csvread(fname),80+i*(200-80)/9);
end
