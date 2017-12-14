function trx = give_state_choreography(trx, classifier, index_liste, name_state)
    
names_loc1   = fieldnames(trx);
n_names_loc1 = length(names_loc1);
n4           = 191;
% if isfield(trx, 'run_proba')
if n_names_loc1 == n4
    mode = 2; 
else
    mode = 1;
end

 relevant_features = {'S', 'S_deriv_squared', 'S_deriv2_squared','S_deriv_squared_log', ...
    'S_smooth_10', 'S_deriv_squared_smooth_10', 'S_deriv2_squared_smooth_10','S_deriv_squared_log_smooth_10', ...
    'S_smooth_25', 'S_deriv_squared_smooth_25', 'S_deriv2_squared_smooth_25','S_deriv_squared_log_smooth_25', ...
    'S_smooth_50', 'S_deriv_squared_smooth_50', 'S_deriv2_squared_smooth_50', 'S_deriv_squared_log_smooth_50',...
    'S_smooth_100', 'S_deriv_squared_smooth_100', 'S_deriv2_squared_smooth_100','S_deriv_squared_log_smooth_100', ...
    'S_smooth_200', 'S_deriv_squared_smooth_200', 'S_deriv2_squared_smooth_200','S_deriv_squared_log_smooth_200', ...
    'eig', 'eig_deriv_squared', 'eig_deriv2_squared', 'eig_deriv_squared_log' ,...
    'eig_smooth_10', 'eig_deriv_squared_smooth_10', 'eig_deriv2_squared_smooth_10', 'eig_deriv_squared_log_smooth_10', ...
    'eig_smooth_25', 'eig_deriv_squared_smooth_25', 'eig_deriv2_squared_smooth_25', 'eig_deriv_squared_log_smooth_25', ...
    'eig_smooth_50', 'eig_deriv_squared_smooth_50', 'eig_deriv2_squared_smooth_50', 'eig_deriv_squared_log_smooth_50', ...
    'eig_smooth_100', 'eig_deriv_squared_smooth_100', 'eig_deriv2_squared_smooth_100','eig_deriv_squared_log_smooth_100', ...
    'eig_smooth_200', 'eig_deriv_squared_smooth_200', 'eig_deriv2_squared_smooth_200', 'eig_deriv_squared_log_smooth_200', ...
    'velocity_agitation', 'velocity_agitation_deriv_squared', 'velocity_agitation_deriv_squared_log', ...
    'velocity_agitation_smooth_10','velocity_agitation_deriv_squared_smooth_10', 'velocity_agitation_deriv_squared_log_smooth_10', ...
    'velocity_agitation_smooth_25','velocity_agitation_deriv_squared_smooth_25', 'velocity_agitation_deriv_squared_log_smooth_25', ...
    'velocity_agitation_smooth_50','velocity_agitation_deriv_squared_smooth_50', 'velocity_agitation_deriv_squared_log_smooth_50', ...
    'velocity_agitation_smooth_100','velocity_agitation_deriv_squared_smooth_100', 'velocity_agitation_deriv_squared_log_smooth_100', ...
    'velocity_agitation_smooth_200','velocity_agitation_deriv_squared_smooth_200', 'velocity_agitation_deriv_squared_log_smooth_200', ...
    'S_deriv', 'eig_deriv', 'velocity_agitation_deriv', ...
    'S_deriv_smooth_5', 'eig_deriv_smooth_5', 'velocity_agitation_deriv_smooth_5', ...
    'S_deriv_smooth_10', 'eig_deriv_smooth_10', 'velocity_agitation_deriv_smooth_10', ...
    'S_deriv_smooth_25', 'eig_deriv_smooth_25', 'velocity_agitation_deriv_smooth_25', ...
    'S_deriv_squared_smooth_10_per_scale_5','S_deriv_squared_smooth_10_per_scale_10','S_deriv_squared_smooth_10_per_scale_25',...
    'eig_deriv_squared_smooth_10_per_scale_5',    'eig_deriv_squared_smooth_10_per_scale_10',   'eig_deriv_squared_smooth_10_per_scale_25',...
    'S_deriv2_squared_smooth_10_per_scale_5','S_deriv2_squared_smooth_10_per_scale_10', 'S_deriv2_squared_smooth_10_per_scale_25',...
    'eig_deriv2_squared_smooth_10_per_scale_5','eig_deriv2_squared_smooth_10_per_scale_10', 'eig_deriv2_squared_smooth_10_per_scale_25',...
    'velocity_agitation_smooth_10_per_scale_5','velocity_agitation_smooth_10_per_scale_10', 'velocity_agitation_smooth_10_per_scale_25',...
    'velocity_agitation_deriv_squared_smooth_10_per_scale_5', 'velocity_agitation_deriv_squared_smooth_10_per_scale_10',...
    'velocity_agitation_deriv_squared_smooth_10_per_scale_25',...
    'axis_direction_5_1','axis_direction_5_5','axis_direction_5_10','axis_direction_5_25','axis_direction_5_50',...
    'axis_direction_10_1','axis_direction_10_5','axis_direction_10_10','axis_direction_10_25','axis_direction_10_50',...
    'axis_direction_25_1','axis_direction_25_5','axis_direction_25_10','axis_direction_25_25','axis_direction_25_50','axis_direction_50_1',...
    'axis_direction_50_5','axis_direction_50_10','axis_direction_50_25','axis_direction_50_50',...
    'd_eff_5_1','d_eff_5_5','d_eff_5_10','d_eff_5_20','d_eff_5_50','d_eff_10_1','d_eff_10_5',...
    'd_eff_10_10','d_eff_10_20','d_eff_10_50','d_eff_20_1','d_eff_20_5','d_eff_20_10',...
    'd_eff_20_20','d_eff_20_50','d_eff_50_1','d_eff_50_5','d_eff_50_10','d_eff_50_20',...
    'd_eff_50_50', 'motion_velocity_5', 'motion_acceleration_5','head_velocity_5','head_acceleration_5',...
    'tail_velocity_5', 'tail_acceleration_5', 'motion_velocity_10', 'motion_acceleration_10', ...
    'head_velocity_10',    'head_acceleration_10',    'tail_velocity_10',    'tail_acceleration_10',...
    'motion_velocity_25',    'motion_acceleration_25',    'head_velocity_25',    'head_acceleration_25',...
    'tail_velocity_25',    'tail_acceleration_25',    'motion_velocity_50',    'motion_acceleration_50',...
    'head_velocity_50',    'head_acceleration_50',    'tail_velocity_50',    'tail_acceleration_50',...
    'motion_velocity_100',    'motion_acceleration_100',    'head_velocity_100',    'head_acceleration_100',...
    'tail_velocity_100',    'tail_acceleration_100',    'motion_velocity_200',    'motion_acceleration_200',...
    'head_velocity_200',    'head_acceleration_200',    'tail_velocity_200',    'tail_acceleration_200',...
    'straight_proba', 'bend_proba','curl_proba', 'ball_proba', 'straight_and_light_bend_proba', 'compressing_proba',...
    'expanding_proba','nematicking_proba', 'denematicking_proba', 'outbending_proba',...
    'inbending_proba', 'displacing_proba', 'run_proba', 'cast_proba','stop_proba', 'roll_proba', 'wiggling_proba',...
    'hunch_proba', 'back_proba' };

    
    to_be_used_features     = relevant_features(index_liste);
    crit                    = 0.5;
    if mode ==1
        name_proba          = [name_state '_proba'];
    else
        name_proba          = [name_state '_proba2'];    
    end
    
    for i = 1 : length(trx)
        
        features = [];
        for j = 1 : length(to_be_used_features)
            features = [features, trx(i).(to_be_used_features{j})];
        end
        [state_out,scores,~] = predict(classifier,features);
        scores_minus_1  = scores(:,1);
        scores_plus_1   = scores(:,2);
        II_minus_1      = scores_minus_1>=crit;
        II_plus_1       = scores_plus_1>crit;
        JJ              = [-II_minus_1, II_plus_1];
        state_out       = sum(JJ,2);
        
        trx(i).(name_state) = state_out;
        trx(i).(name_proba) = scores_plus_1;

        clear state state_out2 state_out features;
        clear scores_minus_1 scores_plus_1 II_minus_1 II_plus_1 JJ ;
        clear state_out scores;
        
    end

end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
