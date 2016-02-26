clear all
% close all

f = 'skidata2-20-15/';

filename = {'Arthur Run1a';	% 1
	'Arthur Run2';      % 2
    'Carolyn Run1';  	% 3
    'Carolyn Run2'; 	% 4
    'Erik Run1';      	% 5
    'Erik Run3';      	% 6
    'Jacob Run1';       % 7
    'Matt Run1';        % 8
    'Matt Run2';       	% 9
    'Meegan Run1';      % 10
    'Meegan Run2';      % 11
    'Rob Run1';         % 12
    'Rob Run2';         % 13
    'Tom Run1';};       % 14 

extension = '.txt';

% Choose the range to display on the time axis
runtimelimit = {[0,200];   % 1
    [0,200];    % 2
    [0,200];   % 3
    [0,200];   % 4
    [0,200];    % 5
    [0,200];    % 6
    [0,200];   % 7
    [0,200];   % 8
    [0,200];   % 9
    [0,200];   % 10
    [0,200];   % 11
    [0,200];     % 12
    [0,200];   % 13
    [0,200];    % 14
    };


% Time vector
timelimit = runtimelimit;

% Choose 1 for pressure only, 2 for accelerometer/gyro only, 3 for both
plottype = 3;

% Create all plots
for i = 1:length(filename)
    [t,pm,ps,am,as,gm,gs] = loadskidata([f,filename{i},extension],plottype,[filename{i}, ', '],timelimit{i});
end
