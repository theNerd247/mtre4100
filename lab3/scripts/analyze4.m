clear all;
close all;

function printData(fname,i)

  data = csvread(fname);

  plotData(data);
  imgname = sprintf('../img/pt4_%i.pdf',i+1);
  print(imgname,'-S600,400');

  close;
end

fname = '../data/lab4-2016-09-15/2k-4k/minMax0.01/measuredData_16-09-15_2038.lvm';
printData(fname,0);

fname = '../data/lab4-2016-09-15/2k-4k/1vamp/measuredData_16-09-15_2040.lvm';
printData(fname,0);
