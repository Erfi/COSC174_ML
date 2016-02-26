%Erfan Azad
%Date: Feb 25 2016
%Description: This file contains filters for pre-processign the data to be
%used as a starting point for classification problem

%loading the data
directory = strcat('skidata2-20-15',filesep);

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

%Filters for each sensor
pressure_filter = designfilt('lowpassiir','FilterOrder',5,'HalfPowerFrequency',0.05,'DesignMethod','butter');
accel_filter = designfilt('lowpassiir','FilterOrder',5,'HalfPowerFrequency',0.2,'DesignMethod','butter');
gyro_filter = designfilt('lowpassiir','FilterOrder',5,'HalfPowerFrequency',0.15,'DesignMethod','butter');


for i=1:length(filename)
    %load the data in the file
    data = load([directory,filename{i},extension]);
    
    %apply filters to each column
    % Master - pressure, accelerometer, gyroscope
    pm = data(:,2:7);
    pmf = applyFilter(pm,pressure_filter);%pmf --> pressureMasterFiltered
   
    am = data(:,8:10);
    amf = applyFilter(am, accel_filter);
    
    gm = data(:,11:13);
    gmf = applyFilter(gm, gyro_filter);

    % Slave - pressure, accelerometer, gyroscope
    ps = data(:,15:20);
    psf = applyFilter(ps, pressure_filter);
    
    as = data(:,21:23);
    asf = applyFilter(as, accel_filter);
    
    gs = data(:,24:26);
    gsf = applyFilter(gs, gyro_filter);
    
    %contatenate all filtered-columns for a matrix and write them back to a
    %file in the same order as the original file
    result = horzcat(data(:,1),pmf, amf, gmf, data(:,14),psf, asf, gsf);
%     result = round(result); %incase you wanted the numbers to be rounded!
    dlmwrite(strcat(directory,'Filtered_data',filesep,filename{i},'_FILTERED',extension),result);
    
end

