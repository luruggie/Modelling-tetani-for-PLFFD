%find peak values of the 100hz experimental trains
peak_experimental_mean_force_2p = max(mean_force_2p);
peak_experimental_mean_force_4p = max(mean_force_4p);
peak_experimental_mean_force_7p = max(mean_force_7p);
peak_experimental_mean_force_12p = max(mean_force_12p);
peak_experimental_mean_force_25p = max(mean_force_25p);
peak_experimental_mean_force_50p = max(mean_force_50p);
peak_experimental_mean_force_100p = max(mean_force_100p);

if npulses_100hz == 2;
    peak_experimental_mean_force_100hz = peak_experimental_mean_force_2p;
elseif npulses_100hz == 4;
    peak_experimental_mean_force_100hz = peak_experimental_mean_force_4p;
elseif npulses_100hz == 7;
    peak_experimental_mean_force_100hz = peak_experimental_mean_force_7p;
elseif npulses_100hz == 12;
    peak_experimental_mean_force_100hz = peak_experimental_mean_force_12p;
elseif npulses_100hz == 25;
    peak_experimental_mean_force_100hz = peak_experimental_mean_force_25p;
elseif npulses_100hz == 50;
    peak_experimental_mean_force_100hz = peak_experimental_mean_force_50p;
elseif npulses_100hz == 100;
    peak_experimental_mean_force_100hz = peak_experimental_mean_force_100p;
end


%find peak values of the 10hz experimental trains at different peaks
for i=length(local_maxima_index_10hz):-1:2;
    index = local_maxima_index_10hz(i);
    peak_experimental_mean_force_10hz(1,i) = max(mean_force_10hz(1:index));
end

%find peak values of the selected modelled trains
peak_force_model_100hz_selected = peak_force_model_100hz(selected_iteration);
peak_force_model_10hz_selected = peak_force_model_10hz(selected_iteration);

%find differences between experimental and modeled trains
diff_peak_force_100hz_selected = diff_peak_force_100hz(selected_iteration);
diff_peak_force_10hz_selected = diff_peak_force_10hz(selected_iteration);

%values of experimental vs. modeled tetanus
peak_force_model_100hz_tetanus_selected = peak_force_model_100hz_tetanus;
peak_force_model_10hz_tetanus_selected = peak_force_model_10hz_tetanus;

diff_tetani_100hz = peak_force_model_100hz_tetanus_selected - peak_experimental_mean_force_100p;
diff_tetani_10hz = peak_force_model_10hz_tetanus_selected - peak_experimental_mean_force_10hz(end);

%experimental and model train ratio
experimental_train_ratio = peak_experimental_mean_force_10hz(npulses_10hz)./peak_experimental_mean_force_100hz;
model_train_ratio = peak_force_model_10hz_selected./peak_force_model_100hz_selected;
diff_train_ratio = model_train_ratio - experimental_train_ratio;

%experimental and model tetani ratio
experimental_tetani_ratio = peak_experimental_mean_force_10hz(end)./peak_experimental_mean_force_100p;
model_tetani_ratio = peak_force_model_10hz_tetanus_selected./peak_force_model_100hz_tetanus_selected;
diff_tetani_ratio = model_tetani_ratio - experimental_tetani_ratio; 

%% Create variables to write in the excel file

% 100hz experimental values
exp_100hz_forces_titles{2,7} = 0;
exp_100hz_forces_titles{1,1} = 'Peak Torque Experimental 100hz (baseline removed)';
exp_100hz_forces_titles{1,2} = '';
exp_100hz_forces_titles{1,3} = '';
exp_100hz_forces_titles{1,4} = '';
exp_100hz_forces_titles{1,5} = '';
exp_100hz_forces_titles{1,6} = '';
exp_100hz_forces_titles{1,7} = '';
exp_100hz_forces_titles{2,1} = '2p';
exp_100hz_forces_titles{2,2} = '4p';
exp_100hz_forces_titles{2,3} = '7p';
exp_100hz_forces_titles{2,4} = '12p';
exp_100hz_forces_titles{2,5} = '25p';
exp_100hz_forces_titles{2,6} = '50p';
exp_100hz_forces_titles{2,7} = '100p';

exp_100hz_forces{1,7} = 0;
exp_100hz_forces{1,1} = peak_experimental_mean_force_2p;
exp_100hz_forces{1,2} = peak_experimental_mean_force_4p;
exp_100hz_forces{1,3} = peak_experimental_mean_force_7p;
exp_100hz_forces{1,4} = peak_experimental_mean_force_12p;
exp_100hz_forces{1,5} = peak_experimental_mean_force_25p;
exp_100hz_forces{1,6} = peak_experimental_mean_force_50p;
exp_100hz_forces{1,7} = peak_experimental_mean_force_100p;

exp_10hz_forces_titles{2,4} = 0;
exp_10hz_forces_titles{1,1} = 'Peak Torque Experimental 10hz (baseline removed)';
exp_10hz_forces_titles{1,2} = '';
exp_10hz_forces_titles{1,3} = '';
exp_10hz_forces_titles{1,4} = '';
exp_10hz_forces_titles{2,1} = '2p';
exp_10hz_forces_titles{2,2} = '4p';
exp_10hz_forces_titles{2,3} = '7p';
exp_10hz_forces_titles{2,4} = '10p';

exp_10hz_forces{1,4} = 0;
exp_10hz_forces{1,1} = peak_experimental_mean_force_10hz(1,2);
exp_10hz_forces{1,2} = peak_experimental_mean_force_10hz(1,4);;
exp_10hz_forces{1,3} = peak_experimental_mean_force_10hz(1,7);;
exp_10hz_forces{1,4} = peak_experimental_mean_force_10hz(1,end);;

n_simulated_pulses_titles{2,2} = 0;
n_simulated_pulses_titles{1,1} = '# simulated pulses';
n_simulated_pulses_titles{1,2} = '';
n_simulated_pulses_titles{2,1} = '10hz';
n_simulated_pulses_titles{2,2} = '100hz';

n_simulated_pulses{1,2} = 0
n_simulated_pulses{1,1} = npulses_10hz;
n_simulated_pulses{1,2} = npulses_100hz;

variables_optimised_selected_titles{2,6} = 0;
variables_optimised_selected_titles{1,1} = 'Optimised values for simulation';
variables_optimised_selected_titles{1,2} = '';
variables_optimised_selected_titles{1,3} = '';
variables_optimised_selected_titles{1,4} = '';
variables_optimised_selected_titles{1,5} = '';
variables_optimised_selected_titles{1,6} = '';
variables_optimised_selected_titles{2,1} = 'r zero';
variables_optimised_selected_titles{2,2} = 'tau c';
variables_optimised_selected_titles{2,3} = 'km';
variables_optimised_selected_titles{2,4} = 'A';
variables_optimised_selected_titles{2,5} = 'tau 1';
variables_optimised_selected_titles{2,6} = 'tau 2';

variables_optimised_selected{1,6} = 0;
variables_optimised_selected{1,1} = r_zero_selected;
variables_optimised_selected{1,2} = tau_c;
variables_optimised_selected{1,3} = k_m_selected;
variables_optimised_selected{1,4} = a_selected;
variables_optimised_selected{1,5} = tau_1;
variables_optimised_selected{1,6} = tau_2_selected;


train_model_titles{2,9} = 0;
train_model_titles{1,1} = '10hz model train';
train_model_titles{1,2} = '';
train_model_titles{1,3} = '';
train_model_titles{1,4} = '100hz model train';
train_model_titles{1,5} = '';
train_model_titles{1,6} = '';
train_model_titles{1,7} = 'ratio trains';
train_model_titles{1,8} = '';
train_model_titles{1,9} = '';
train_model_titles{2,1} = 'Absolute PT';
train_model_titles{2,2} = 'PT diff';
train_model_titles{2,3} = '';
train_model_titles{2,4} = 'Absolute PT';
train_model_titles{2,5} = 'PT diff';
train_model_titles{2,6} = '';
train_model_titles{2,7} = 'Modeled';
train_model_titles{2,8} = 'Experimental';
train_model_titles{2,9} = 'Ratio diff';

train_10hz_model{1,2} = 0;
train_10hz_model{1,1} = peak_force_model_10hz_selected;
train_10hz_model{1,2} = diff_peak_force_10hz_selected;

train_100hz_model{1,2} = 0;
train_100hz_model{1,1} = peak_force_model_100hz_selected;
train_100hz_model{1,2} = diff_peak_force_100hz_selected;

ratio_trains{1,3} = 0;
ratio_trains{1,1} = model_train_ratio;
ratio_trains{1,2} = experimental_train_ratio;
ratio_trains{1,3} = diff_train_ratio;

tetanus_model_titles{2,9} = 0;
tetanus_model_titles{1,1} = '10hz model tetanus';
tetanus_model_titles{1,2} = '';
tetanus_model_titles{1,3} = '';
tetanus_model_titles{1,4} = '100hz model tetanus';
tetanus_model_titles{1,5} = '';
tetanus_model_titles{1,6} = '';
tetanus_model_titles{1,7} = 'ratio tetani';
tetanus_model_titles{1,8} = '';
tetanus_model_titles{1,9} = '';
tetanus_model_titles{2,1} = 'Absolute PT';
tetanus_model_titles{2,2} = 'PT diff';
tetanus_model_titles{2,3} = '';
tetanus_model_titles{2,4} = 'Absolute PT';
tetanus_model_titles{2,5} = 'PT diff';
tetanus_model_titles{2,6} = '';
tetanus_model_titles{2,7} = 'Modeled';
tetanus_model_titles{2,8} = 'Experimental';
tetanus_model_titles{2,9} = 'Ratio diff';

tetanus_10hz_model{1,2} = 0;
tetanus_10hz_model{1,1} = peak_force_model_10hz_tetanus_selected;
tetanus_10hz_model{1,2} = diff_tetani_10hz;

tetanus_100hz_model{1,2} = 0;
tetanus_100hz_model{1,1} = peak_force_model_100hz_tetanus_selected;
tetanus_100hz_model{1,2} = diff_tetani_100hz;

ratio_tetani{1,3} = 0;
ratio_tetani{1,1} = model_tetani_ratio;
ratio_tetani{1,2} = experimental_tetani_ratio;
ratio_tetani{1,3} = diff_tetani_ratio;

% details of the excel file
filename = ['copyvalues.xlsx'];

%write in the selected excel file
writecell(exp_100hz_forces_titles, filename,'Range','A1:G2');
writecell(exp_100hz_forces, filename,'Range','A3:G3');
writecell(exp_10hz_forces_titles, filename,'Range','A4:D5');
writecell(exp_10hz_forces, filename,'Range','A6:D6');

if computing_iteration == 1;
    writecell(n_simulated_pulses_titles, filename,'Range','A47:B48');
    writecell(n_simulated_pulses, filename,'Range','A49:B49');
    writecell(variables_optimised_selected_titles, filename,'Range','D47:I48');
    writecell(variables_optimised_selected, filename,'Range','D49:I49');
    writecell(train_model_titles, filename,'Range','K47:S48');
    writecell(train_10hz_model, filename,'Range','K49:L49');
    writecell(train_100hz_model, filename,'Range','N49:O49');
    writecell(ratio_trains, filename,'Range','Q49:S49');
    writecell(tetanus_model_titles, filename,'Range','K51:S52');
    writecell(tetanus_10hz_model, filename,'Range','K53:L53');
    writecell(tetanus_100hz_model, filename,'Range','N53:O53');
    writecell(ratio_tetani, filename,'Range','Q53:S53');
elseif computing_iteration == 2;
    writecell(n_simulated_pulses_titles, filename,'Range','A39:B40');
    writecell(n_simulated_pulses, filename,'Range','A41:B41');
    writecell(variables_optimised_selected_titles, filename,'Range','D39:I40');
    writecell(variables_optimised_selected, filename,'Range','D41:I41');
    writecell(train_model_titles, filename,'Range','K39:S40');
    writecell(train_10hz_model, filename,'Range','K41:L41');
    writecell(train_100hz_model, filename,'Range','N41:O41');
    writecell(ratio_trains, filename,'Range','Q41:S41');
    writecell(tetanus_model_titles, filename,'Range','K43:S44');
    writecell(tetanus_10hz_model, filename,'Range','K45:L45');
    writecell(tetanus_100hz_model, filename,'Range','N45:O45');
    writecell(ratio_tetani, filename,'Range','Q45:S45');
elseif computing_iteration == 3;
    writecell(n_simulated_pulses_titles, filename,'Range','A31:B32');
    writecell(n_simulated_pulses, filename,'Range','A33:B33');
    writecell(variables_optimised_selected_titles, filename,'Range','D31:I32');
    writecell(variables_optimised_selected, filename,'Range','D33:I33');
    writecell(train_model_titles, filename,'Range','K31:S32');
    writecell(train_10hz_model, filename,'Range','K33:L33');
    writecell(train_100hz_model, filename,'Range','N33:O33');
    writecell(ratio_trains, filename,'Range','Q33:S33');
    writecell(tetanus_model_titles, filename,'Range','K35:S36');
    writecell(tetanus_10hz_model, filename,'Range','K37:L37');
    writecell(tetanus_100hz_model, filename,'Range','N37:O37');
    writecell(ratio_tetani, filename,'Range','Q37:S37');
elseif computing_iteration == 4;
    writecell(n_simulated_pulses_titles, filename,'Range','A23:B24');
    writecell(n_simulated_pulses, filename,'Range','A25:B25');
    writecell(variables_optimised_selected_titles, filename,'Range','D23:I24');
    writecell(variables_optimised_selected, filename,'Range','D25:I25');
    writecell(train_model_titles, filename,'Range','K23:S24');
    writecell(train_10hz_model, filename,'Range','K25:L25');
    writecell(train_100hz_model, filename,'Range','N25:O25');
    writecell(ratio_trains, filename,'Range','Q25:S25');
    writecell(tetanus_model_titles, filename,'Range','K27:S28');
    writecell(tetanus_10hz_model, filename,'Range','K29:L29');
    writecell(tetanus_100hz_model, filename,'Range','N29:O29');
    writecell(ratio_tetani, filename,'Range','Q29:S29');
elseif computing_iteration == 5;
    writecell(n_simulated_pulses_titles, filename,'Range','A15:B16');
    writecell(n_simulated_pulses, filename,'Range','A17:B17');
    writecell(variables_optimised_selected_titles, filename,'Range','D15:I16');
    writecell(variables_optimised_selected, filename,'Range','D17:I17');
    writecell(train_model_titles, filename,'Range','K15:S16');
    writecell(train_10hz_model, filename,'Range','K17:L17');
    writecell(train_100hz_model, filename,'Range','N17:O17');
    writecell(ratio_trains, filename,'Range','Q17:S17');
    writecell(tetanus_model_titles, filename,'Range','K19:S20');
    writecell(tetanus_10hz_model, filename,'Range','K21:L21');
    writecell(tetanus_100hz_model, filename,'Range','N21:O21');
    writecell(ratio_tetani, filename,'Range','Q21:S21');
elseif computing_iteration == 6;
    writecell(n_simulated_pulses_titles, filename,'Range','A7:B8');
    writecell(n_simulated_pulses, filename,'Range','A9:B9');
    writecell(variables_optimised_selected_titles, filename,'Range','D7:I8');
    writecell(variables_optimised_selected, filename,'Range','D9:I9');
    writecell(train_model_titles, filename,'Range','K7:S8');
    writecell(train_10hz_model, filename,'Range','K9:L9');
    writecell(train_100hz_model, filename,'Range','N9:O9');
    writecell(ratio_trains, filename,'Range','Q9:S9');
    writecell(tetanus_model_titles, filename,'Range','K11:S12');
    writecell(tetanus_10hz_model, filename,'Range','K13:L13');
    writecell(tetanus_100hz_model, filename,'Range','N13:O13');
    writecell(ratio_tetani, filename,'Range','Q13:S13');
end