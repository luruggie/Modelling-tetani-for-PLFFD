%cross the matrices with the intersection
value = [];
index = 1;
crossed_indices = [];
crossed_diff_squared_10hz = [];
crossed_diff_squared_100hz = [];

for i=1:1:length(indices_for_selection_10hz);
    value = indices_for_selection_10hz(i);
    for j = 1:1:length(indices_for_selection_100hz);
        if indices_for_selection_10hz(i) == indices_for_selection_100hz(j);
            crossed_indices(index) = indices_for_selection_100hz(j);
            crossed_diff_squared_10hz(index) = diff_squared_10hz(value);
            crossed_diff_squared_100hz(index) = diff_squared_100hz(value);
            index = index + 1;
        end
    end
end

[min_diff_squared_100hz,min_diff_squared_index_100hz] = min(crossed_diff_squared_100hz);
corresponding_diff_squared_10hz = crossed_diff_squared_10hz(min_diff_squared_index_100hz);
selected_iteration = crossed_indices(min_diff_squared_index_100hz);
r_zero_selected = simulated_values_100hz(1,selected_iteration); 
k_m_selected = simulated_values_100hz(2,selected_iteration); 
a_selected = simulated_values_100hz(3,selected_iteration); 
tau_2_selected = simulated_values_100hz(4,selected_iteration);

