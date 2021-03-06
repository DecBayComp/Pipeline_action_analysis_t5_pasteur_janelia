function trx = remove_useless_features(trx)


% names_to_be_removed = {'full_t', 'x_neck_down','y_neck_down','x_neck_top',...
%     'y_neck_top','x_neck','y_neck', 'x','y','u','v'};

names_to_be_removed = {'full_t', 'x','y','u','v','axis_direction', ...
    'motion_velocity',    'motion_acceleration','parameters_HMM', 'log_likelihood',...
    'likelihood','alpha','log_alpha',  'beta', 'log_beta', 'gamma_k', 'log_gamma_k',...
    'somme_gamma_k','log_somme_gamma_k','mu_viberti','log_mu_viberti', 'psi',...
    'path','x_head_tail','y_head_tail','speed_head_tail','d_speed_head_tail',...
    'absolute_speed_head_tail', 'absolute_acceleration_head_tail', 'd_absolute_speed_head_tail',...
    'd_absolute_acceleration_head_tail','indice_head_tail_contour', 'coeffs',...
    'x_contour_fourier', 'y_contour_fourier', 'indice_head_tail_contour_fourier',...
    'x_head_tail_contour','y_head_tail_contour', 'x_head_tail_contour_fourier',...
    'y_head_tail_contour_fourier','curvature', 'curvature_head_tail',  'd_curvature_head_tail',...
        'x_head_contour_fourier','y_head_contour_fourier', 'x_tail_contour_fourier',    'y_tail_contour_fourier',...
            'x_head_contour','y_head_contour','x_tail_contour','y_tail_contour', 'x_head_fourier',...
    'y_head_fourier',   'x_tail_fourier',    'y_tail_fourier', 'd_head_tail_1', 'd_head_tail_2','HT_d_matrix',...
    'd_head_tail_mid', 'dd_head_tail_mid',  'x_path',    'y_path', 'state'};


for i = 1 : length(names_to_be_removed  )
    try
        trx = rmfield(trx,names_to_be_removed{i} );
    end
end



end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   
%     'velocity_agitation'
%     'velocity_agitation_smooth'
%     'S'
%     'eig'
%     'S_smooth_10'
%     'eig_smooth_10'
%     'velocity_agitation_smooth_10'
%     'S_smooth_25'
%     'eig_smooth_25'
%     'velocity_agitation_smooth_25'
%     'S_smooth_50'
%     'eig_smooth_50'
%     'velocity_agitation_smooth_50'
%     'S_smooth_100'
%     'eig_smooth_100'
%     'velocity_agitation_smooth_100'
%     'S_smooth_200'
%     'eig_smooth_200'
%     'velocity_agitation_smooth_200'
%     'S_deriv'
%     'S_deriv2'
%     'S_deriv_squared'
%     'S_deriv2_squared'
%     'eig_deriv'
%     'eig_deriv2'
%     'eig_deriv_squared'
%     'eig_deriv2_squared'
%     'velocity_agitation_deriv'
%     'velocity_agitation_deriv2'
%     'velocity_agitation_deriv_squared'
%     'velocity_agitation_deriv2_squared'
%     'S_deriv_squared_smooth_10'
%     'eig_deriv_squared_smooth_10'
%     'S_deriv2_squared_smooth_10'
%     'eig_deriv2_squared_smooth_10'
%     'velocity_agitation_deriv_squared_smooth_10'
%     'S_deriv_squared_smooth_25'
%     'eig_deriv_squared_smooth_25'
%     'S_deriv2_squared_smooth_25'
%     'eig_deriv2_squared_smooth_25'
%     'velocity_agitation_deriv_squared_smooth_25'
%     'S_deriv_squared_smooth_50'
%     'eig_deriv_squared_smooth_50'
%     'S_deriv2_squared_smooth_50'
%     'eig_deriv2_squared_smooth_50'
%     'velocity_agitation_deriv_squared_smooth_50'
%     'S_deriv_squared_smooth_100'
%     'eig_deriv_squared_smooth_100'
%     'S_deriv2_squared_smooth_100'
%     'eig_deriv2_squared_smooth_100'
%     'velocity_agitation_deriv_squared_smooth_100'
%     'S_deriv_squared_smooth_200'
%     'eig_deriv_squared_smooth_200'
%     'S_deriv2_squared_smooth_200'
%     'eig_deriv2_squared_smooth_200'
%     'velocity_agitation_deriv_squared_smooth_200'
%     'S_deriv_squared_log'
%     'eig_deriv_squared_log'
%     'velocity_agitation_deriv_squared_log'
%     'velocity_agitation_log'
%     'S_deriv_squared_log_smooth_10'
%     'eig_deriv_squared_log_smooth_10'
%     'velocity_agitation_deriv_squared_log_smooth_10'
%     'velocity_agitation_log_smooth_10'
%     'S_deriv_squared_log_smooth_25'
%     'eig_deriv_squared_log_smooth_25'
%     'velocity_agitation_deriv_squared_log_smooth_25'
%     'velocity_agitation_log_smooth_25'
%     'S_deriv_squared_log_smooth_50'
%     'eig_deriv_squared_log_smooth_50'
%     'velocity_agitation_deriv_squared_log_smooth_50'
%     'velocity_agitation_log_smooth_50'
%     'S_deriv_squared_log_smooth_100'
%     'eig_deriv_squared_log_smooth_100'
%     'velocity_agitation_deriv_squared_log_smooth_100'
%     'velocity_agitation_log_smooth_100'
%     'S_deriv_squared_log_smooth_200'
%     'eig_deriv_squared_log_smooth_200'
%     'velocity_agitation_deriv_squared_log_smooth_200'
%     'velocity_agitation_log_smooth_200'
%     'S_deriv_squared_smooth_10_per_scale_5'
%     'S_deriv_squared_smooth_10_per_scale_10'
%     'S_deriv_squared_smooth_10_per_scale_25'
%     'eig_deriv_squared_smooth_10_per_scale_5'
%     'eig_deriv_squared_smooth_10_per_scale_10'
%     'eig_deriv_squared_smooth_10_per_scale_25'
%     'S_deriv2_squared_smooth_10_per_scale_5'
%     'S_deriv2_squared_smooth_10_per_scale_10'
%     'S_deriv2_squared_smooth_10_per_scale_25'
%     'eig_deriv2_squared_smooth_10_per_scale_5'
%     'eig_deriv2_squared_smooth_10_per_scale_10'
%     'eig_deriv2_squared_smooth_10_per_scale_25'
%     'velocity_agitation_smooth_10_per_scale_5'
%     'velocity_agitation_smooth_10_per_scale_10'
%     'velocity_agitation_smooth_10_per_scale_25'
%     'velocity_agitation_deriv_squared_smooth_10_per_scale_5'
%     'velocity_agitation_deriv_squared_smooth_10_per_scale_10'
%     'velocity_agitation_deriv_squared_smooth_10_per_scale_25'
%     'S_deriv_smooth_5'
%     'eig_deriv_smooth_5'
%     'velocity_agitation_deriv_smooth_5'
%     'S_deriv_smooth_10'
%     'eig_deriv_smooth_10'
%     'velocity_agitation_deriv_smooth_10'
%     'S_deriv_smooth_25'
%     'eig_deriv_smooth_25'
%     'velocity_agitation_deriv_smooth_25'
%     'numero_larva_num_vector'
%     'x_head_tail'
%     'y_head_tail'
%     'speed_head_tail'
%     'd_speed_head_tail'
%     'absolute_speed_head_tail'
%     'absolute_acceleration_head_tail'
%     'd_absolute_speed_head_tail'
%     'd_absolute_acceleration_head_tail'
%     'indice_head_tail_contour'
%     'coeffs'
%     'x_contour_fourier'
%     'y_contour_fourier'
%     'indice_head_tail_contour_fourier'
%     'x_head_tail_contour'
%     'y_head_tail_contour'
%     'x_head_tail_contour_fourier'
%     'y_head_tail_contour_fourier'
%     'curvature'
%     'curvature_head_tail'
%     'd_curvature_head_tail'
%     'x_head'
%     'y_head'
%     'x_tail'
%     'y_tail'
%     'x_head_contour'
%     'y_head_contour'
%     'x_tail_contour'
%     'y_tail_contour'
%     'x_head_fourier'
%     'y_head_fourier'
%     'x_tail_fourier'
%     'y_tail_fourier'
%     'd_head_tail_1'
%     'd_head_tail_2'
%     'HT_d_matrix'
%     'd_head_tail_mid'
%     'dd_head_tail_mid'
%     'x_path'
%     'y_path'
%     'axis_direction'
%     'motion_velocity'
%     'motion_acceleration'
%     'parameters_HMM'
%     'log_likelihood'
%     'likelihood'
%     'alpha'
%     'log_alpha'
%     'beta'
%     'log_beta'
%     'gamma_k'
%     'log_gamma_k'
%     'somme_gamma_k'
%     'log_somme_gamma_k'
%     'mu_viberti'
%     'log_mu_viberti'
%     'psi'
%     'path'
%     'x_head_contour_fourier'
%     'y_head_contour_fourier'
%     'x_tail_contour_fourier'
%     'y_tail_contour_fourier'
%     'axis_direction_5_1'
%     'axis_direction_5_5'
%     'axis_direction_5_10'
%     'axis_direction_5_25'
%     'axis_direction_5_50'
%     'axis_direction_10_1'
%     'axis_direction_10_5'
%     'axis_direction_10_10'
%     'axis_direction_10_25'
%     'axis_direction_10_50'
%     'axis_direction_25_1'
%     'axis_direction_25_5'
%     'axis_direction_25_10'
%     'axis_direction_25_25'
%     'axis_direction_25_50'
%     'axis_direction_50_1'
%     'axis_direction_50_5'
%     'axis_direction_50_10'
%     'axis_direction_50_25'
%     'axis_direction_50_50'
%     'd_eff_5_1'
%     'd_eff_5_5'
%     'd_eff_5_10'
%     'd_eff_5_20'
%     'd_eff_5_50'
%     'd_eff_10_1'
%     'd_eff_10_5'
%     'd_eff_10_10'
%     'd_eff_10_20'
%     'd_eff_10_50'
%     'd_eff_20_1'
%     'd_eff_20_5'
%     'd_eff_20_10'
%     'd_eff_20_20'
%     'd_eff_20_50'
%     'd_eff_50_1'
%     'd_eff_50_5'
%     'd_eff_50_10'
%     'd_eff_50_20'
%     'd_eff_50_50'
%     'straight'
%     'bend'
%     'curl'
%     'ball'
%     'compressing'
%     'expanding'
%     'nematicking'
%     'denematicking'
%     'outbending'
%     'inbending'
%     'run'
%     'cast'
%     'stop'
%     'back'
%     'roll'
%     'head_wiggle'
%     'wiggling'
%     'hunch'
%     'digging'
%     'roll_first_instar'
%     'pure_cast'
%     'global_cast'
%     'strong_cast'
%     'global_run'
%     'strong_hunch'
%     'head_hunch'
%     'run_cast'
%     'straight_proba'
%     'bend_proba'
%     'curl_proba'
%     'ball_proba'
%     'straight_and_light_bend'
%     'straight_and_light_bend_proba'
%     'compressing_proba'
%     'state'
%     'expanding_proba'
%     'nematicking_proba'
%     'denematicking_proba'
%     'outbending_proba'
%     'inbending_proba'
%     'displacing'
%     'displacing_proba'
%     'run_proba'
%     'cast_proba'
%     'stop_proba'
%     'roll_proba'
%     'head_wiggle_proba'
%     'wiggling_proba'
%     'hunch_proba'
%     'digging_proba'
%     'roll_first_instar_proba'