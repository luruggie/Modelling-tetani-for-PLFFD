tic
computing_iteration = [];

for computing_iteration=1:1:6;
    
    clearvars -except computing_iteration tau_c_optimal;
    
    if computing_iteration == 1;
        npulses_100hz = 100;
        npulses_10hz = 10;
    elseif computing_iteration == 2;
        npulses_100hz = 50;
        npulses_10hz = 10;
    elseif computing_iteration == 3;
        npulses_100hz = 25;
        npulses_10hz = 10;
    elseif computing_iteration == 4;
        npulses_100hz = 12;
        npulses_10hz = 10;
    elseif computing_iteration == 5;
        npulses_100hz = 7;
        npulses_10hz = 7;
    elseif computing_iteration == 6;
        npulses_100hz = 4;
        npulses_10hz = 4;
    end
    
    %import data and average trains per session
    run('import_text_data.m');
    
    %determine tau1 values from curves
    run('deriving_tau_1.m');
    
    %finding peaks of the experimental curves
    run('find_experimental_peaks.m');
    
    %select data of interest
    run('data_selection_auto.m')
    
    %optimization of time-dependent parameters
    run('deriving_tau_c_auto.m');
    
    %optimize other values 10 hz
    run('deriving_other_values_10hz.m');
    
    %optimize other values 100 hz
    run('deriving_other_values_100hz.m');

    %intersecting indices for selection
    run('selecting_index_for_selection.m');

    %simulation of 10haz and 100 hz tetani
    run('tetani_simulation.m');
    
    %display output
    run('display_output.m');
    
    %calculate peak forces of experimental and modelled traces, and ratios
    run('ratios_and_export_auto.m');
end
toc