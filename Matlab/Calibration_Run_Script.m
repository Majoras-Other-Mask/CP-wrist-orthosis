%% Startup
clear
clc
offset = [0 0]; 
open_system('data_acq_passiveV4.slx')
set_param('data_acq_passiveV4','StopTime', '10')
rtwbuild('data_acq_passiveV4')

%ask for the date
prompt = 'What is the date? Ex: March_3_2017     ';
date = input(prompt,'s')

%% Setup variables
cal1_0 = 0;
cal1_25 = 0;
cal2 = 0;
cal3_extended = 0; 
cal3_retracted = 0; 
cal4 = 0; 
cal5 = 0; 
i = 1; 
%% Running the Model
set_param('data_acq_passiveV4','SimulationCommand','Connect');%connect the model

%display message for robot position
if mod(i,2) == 0
    disp('Have base on 25 deg line')
    disp('Have arm fully extended')
elseif i==7
    disp('Have base on 0 deg line')    
    disp('Have arm fully retracted')
else 
    disp('Have base on 0 deg line')
    disp('Have arm fully extended')
end

%key press to begin simulation
disp('Press any key to begin simulation')
pause; 
set_param('data_acq_passiveV4','SimulationCommand','Start'); %start the model
disp('Simulation will end in 10 seconds and data will be uploaded')
disp('    ')

%% Data calculation

%calculate calibration data
if i<7 %for first 6 calibration points
    if mod(i,2) == 0 %when count is even determine value of base at 25deg
        cal1_25 = cal1_25 + mean(pots(1000:end,1));
    else %when count is odd determine rest of values
        cal1_0 = cal1_0 + mean(pots(1000:end,1));
        cal2 = cal2 + mean(pots(1000:end,2)); 
        cal4 = cal4 + mean(pots(1000:end,4)); 
        cal5 = cal5 + mean(pots(1000:end,5));
        cal3_extended = cal3_extended + mean(pots(1000:end,3)); 
    end
        i = i+1; %increase count
else %when i == 7
    cal3_retracted = mean(pots(1000:end,3));
    cal1_0 = cal1_0 /3;
    cal1_25 = cal1_25 /3;
    cal2 = cal2 /3;
    cal3_extended = cal3_extended /3; 
    cal4 = cal4 /3; 
    cal5 = cal5 /3; 
    disp('CALIBRATION IS COMPLETE!')
    disp('CALIBRATION IS COMPLETE!')
    disp('CALIBRATION IS COMPLETE!')
    
    % Display calibration data 
    Joints = {'Joint 1 0 Deg'; 'Joint 1 25 Deg'; 'Joint 2'; 'Joint 3 Extended'; 'Joint 3 Retracted'; 'Joint 4'; 'Joint 5'}; 
    Calibration_Value = [cal1_0; cal1_25; cal2; cal3_extended; cal3_retracted; cal4; cal5]; 
    table(Calibration_Value,'RowNames', Joints) %print table with calibration data
    disp('Enter calibration data into Simulink model volt2deg')
end

clear pots %clear data