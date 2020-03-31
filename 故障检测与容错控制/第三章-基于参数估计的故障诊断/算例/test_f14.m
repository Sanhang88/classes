%matlab关于辨识f14模型的程序例子。
%Dryden Wind Gust Models：德莱顿阵风模型
clear;
clc;


%Open the model and load experimental data.
open_system('f14');
load f14_estim_data;

%Plot measured data and simulation results
[T,X,Y] = sim('f14', time, [], [time iodata(:,1)]);
plot(time, iodata(:,2:3), T, Y, '--');
legend( 'Measured angle of attack',  'Measured pilot g force', ...
        'Simulated angle of attack', 'Simulated pilot g force');
    
%Create objects to represent the experimental data sets.
hExp = ParameterEstimator.TransientExperiment(gcs);
set(hExp.InputData(1), 'Data', iodata(:,1), 'Time', time);

set(hExp.OutputData(1), 'Data', iodata(:,2), 'Time', time, 'Weight', 5);
set(hExp.OutputData(2), 'Data', iodata(:,3), 'Time', time);

%Create objects to represent parameters.
hPar(1) = ParameterEstimator.Parameter('Ta'); % Initial value: Ta = 0.5
set(hPar(1), 'Minimum', 0.01, 'Maximum', 1, 'Estimated', true)

hPar(2) = ParameterEstimator.Parameter('Md'); % Initial value: Md = -1
set(hPar(2), 'Minimum', -10, 'Maximum', 0, 'Estimated', true)

hPar(3) = ParameterEstimator.Parameter('Zd'); % Initial value: Zd = -80
set(hPar(3), 'Minimum', -100, 'Maximum', 0, 'Estimated', true)


%Create objects to represent estimated initial states.
hIc(1) = ParameterEstimator.State('f14/Actuator Model');
set(hIc(1), 'Minimum', 0, 'Estimated', false)


%Create the estimation object and run estimation
hEst = ParameterEstimator.Estimation(gcs, hPar, hExp);
hEst.States = hIc;


%Setup estimation options
hEst.OptimOptions.Algorithm    = 'lsqnonlin';   %LSQNONLIN solves non-linear least squares problems.
hEst.OptimOptions.GradientType = 'refined';     %GradientType是梯度类型
hEst.OptimOptions.Display      = 'iter';


%Run the estimation
estimate(hEst);

%Plot measured data and final simulation results
[T,X,Y] = sim('f14', time, [], [time iodata(:,1)]);
figure
plot(time, iodata(:,2:3), T, Y, '--');
legend( 'Measured angle of attack',  'Measured pilot g force', ...
        'Simulated angle of attack', 'Simulated pilot g force');
    

%Look at the estimated values
find(hEst.Parameters, 'Estimated', true)










