function [t,pm,ps,am,as,gm,gs] = loadskidata(filename,plottype,name,timelimit)

%% Load data

data = load(filename);

%% Graph scale

t = (0:(length(data)-1))/14.6;
ylimvecp = [0,520];
ylimveca = [-90,90];
ylimvecg = [-10,10];
pl = ['1';'2';'3';'4';'5';'6'];
pl2 = {'Ball of foot';'Bridge';'Heel';'Calf';'Inner shin';'Outer shin'};
al = {'x';'y';'z'};
gl = {'x';'y';'z'};
m = ', master';
s = ', slave';
p = 'Pressure';
a = 'Accelerometer';
g = 'Gyroscope';
x = 'Time (s)';

%% Data types

% Master - pressure, accelerometer, gyroscope
pm = data(:,2:7);
am = data(:,8:10);
gm = data(:,11:13);

% Slave - pressure, accelerometer, gyroscope
ps = data(:,15:20);
as = data(:,21:23);
gs = data(:,24:26);


%% Adjust pressure measurements

% Invert (subtract from 512)
pm = 512 - pm;
ps = 512 - ps;

% % Convert to psi
% N = 10;
% L = 2^N;
% Vfs = 5;
% Vin = 2.5;
% R1 = 33.2e3;
% R2 = 105e3;
% volt2psi = 1e7;         % Roughly 1e4 psi*kOhm
% pm(:,1:3) = pm(:,1:3) * Vfs/L * volt2psi / (R1*Vin);
% ps(:,1:3) = ps(:,1:3) * Vfs/L * volt2psi / (R1*Vin);
% pm(:,4:6) = pm(:,4:6) * Vfs/L * volt2psi / (R2*Vin);
% ps(:,4:6) = ps(:,4:6) * Vfs/L * volt2psi / (R2*Vin);

% Normalize by standard deviation
for i=1:6
    pm(:,i)=pm(:,i)/std(pm(:,i));
    ps(:,i)=ps(:,i)/std(ps(:,i));
end

% % Use median filter to remove impulsive noise
% for i=1:6
%     pm(:,i)=sgolayfilt(pm(:,i),3,13);
%     ps(:,i)=sgolayfilt(ps(:,i),3,13);
% end

%% Conversions
% from raw values to engineering units

% Acceleration constants
gearth = 9.80665;
a_range = 3;                % 2,4,8,16g --> 1,2,3,4
gplsb = [1,2,4,12]*1e-3;
ka = gplsb(a_range) * gearth;

% Gyro constants
g_range = 2;                % 245,500,2000 dps --> 1,2,3
g_sensitivity = [8.75,17.5,70]*1e-3;
kg = g_sensitivity(g_range) * pi/180;

% Acceleration, m/s^2
am = am .* ka;
as = as .* ka;

% Gyro
gm = gm .* kg;
gs = gs .* kg;

%% Plot data
plotskidata(plottype,t,pm,ps,am,as,gm,gs,...
    name,ylimvecp,ylimveca,ylimvecg,pl,pl2,al,gl,m,s,p,a,g,x,timelimit);


end
