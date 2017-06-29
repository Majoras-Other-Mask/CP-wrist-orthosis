%% Startup
offset = [0 0]; 
open_system('data_acq_passiveV4.slx')
set_param('data_acq_passiveV4','StopTime', '300')
rtwbuild('data_acq_passiveV4')
i = 0; %counter
prompt0 = 'What task is being ran?'; 

%% Subject Information
prompt1 = 'Subject?'; 
subject = input(prompt1, 's')

%% Running the Model
task = input(prompt0, 's')
set_param('data_acq_passiveV4','SimulationCommand','Connect');%connect the model
disp('Press any key to begin simulation')
pause; 
set_param('data_acq_passiveV4','SimulationCommand','Start'); %start the model
disp('Press any key to end the simulation')
pause; 
set_param('data_acq_passiveV4','SimulationCommand','Stop'); %stop the model

%% Compile/Save Data
for idx = 1:data.numElements
    timeseriesObj = data.get(idx).Values;
    if idx == 1
        output = [timeseriesObj.Time timeseriesObj.Data]; 
    else
        output = [output timeseriesObj.Data]; 
    end
end 

% %create file names/signal names after user inputs
% filename = sprintf('Trial_Data/%s_%s_Trial_%d', subject, task, i);
% %save the signal as a .mat file
% save(filename, 'output')