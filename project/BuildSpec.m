%% Init
% Requirements can be created in the current dir by specifying name, or you can specify full path:
name_or_path = 'C:\Users\Rose\Documents\Test Directory\Simulink\Requirements\ReqSet';
% The slreq.new() command creates the set specified by name_or_path:
rs = slreq.new(name_or_path);

%% Specify Reqts
% Create requirements by specifying properties

% R1 - Max input throttle
% Id is optional - can be set manually, or will be assigned automatically if not set
id = 'R1';
% Summary
summary = 'Max input throttle %';
% Description
desc = 'The maximum input throttle is 100%.';
% The add command creates a requirement in the object passed in as first
% argument, in this case the set stored in rs
r1 = add(rs,'Id',id,'Summary',summary,'Description',desc);

% R2 - Cruise control requirements
id = 'R2';
summary = 'Cruise control requirements';
desc = 'Set of cruise control requirements';
r2 = add(rs,'Id',id,'Summary',summary,'Description',desc);

% R2.1 - Speed Range
id = 'R2.1';
summary = 'Cruise control speed operation range';
desc = 'Cruise control has a minimum and maximum operating speed.';
% The add command creates a requirement in the object passed in as first
% argument, in this case the requirement stored in r2
r21 = add(r2,'Id',id,'Summary',summary,'Description',desc);

% R2.1.1 - Min speed
id = 'R2.1.1';
summary = 'Minimum vehicle speed';
desc = 'The speed of the vehicle must be at least 40 km/h for the cruise control system to engage.';
r211 = add(r21,'Id',id,'Summary',summary,'Description',desc);

% R2.1.2 - Max speed
id = 'R2.1.2';
summary = 'Maximum vehicle speed';
desc = 'The speed of the vehicle must be no more than 85km/h for the cruise control system to engage.';
r212 = add(r21,'Id',id,'Summary',summary,'Description',desc);

% R2.2 - Maintenance and Adjustment
id = 'R2.2';
summary = 'Maintain and adjust speed';
desc = 'The system will maintain the vehicle speed set by the driver and adjust the speed based on forward vehicles';
r22 = add(r2,'Id',id,'Summary',summary,'Description',desc);

% R2.3 - Override/Disable
id = 'R2.3';
summary = 'Driver has ability to override/disable';
desc = 'The driver has the ability to override/disable the system at all times';
r23 = add(r2,'Id',id,'Summary',summary,'Description',desc);

% R2.3.1 - Braking
id = 'R2.3.1';
summary = 'Disable upon braking';
desc = 'The system will be disabled when the driver taps on the brakes';
r231 = add(r23,'Id',id,'Summary',summary,'Description',desc);

% R2.3.2 - Accelerating
id = 'R2.3.2';
summary = 'Disengage on acceleration';
desc = 'When the driver taps the accelerator, the system is temporarily disengaged while the driver accelerates the car. The system will re-engage at the previously set speed once the accelerator is no longer be pressed';
r232 = add(r23,'Id',id,'Summary',summary,'Description',desc);

%% Save & Close
save(rs)
close(rs)
