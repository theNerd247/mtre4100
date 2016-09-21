# data is assumed to be in the form [X,Y] where X and Y are column vectors. This
# data container is passed directly to plot(..) and
# scatter(data[:,1],data[:,2]).
function plotData(data)

  f = @() {plot(data(:,1),data(:,2));scatter(data(:,1),data(:,2));};

  withHold(f);

end
