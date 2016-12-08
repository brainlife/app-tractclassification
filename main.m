% Load an FE strcuture created by the sca-service-life
load(fe_file);

% Extract the fascicle weights from the fe structure
% Dependency "encode".
w = feGet(fe,'fiber weights');

% Extract the fascicles
fg = feGet(fe,'fibers acpc');        

% Eliminte the fascicles with non-zero entries
% Dependency "vistasoft"
fg = fgExtract(fg, w > 0, 'keep');

% Classify the major tracts from all the fascicles
% Dependency "AFQ" use this repository: https://github.com/francopestilli/afq
[fg_classified,~,classification]= AFQ_SegmentFiberGroups(dtFile, fg);
fascicles = fg2Array(fg_classified);
clear fg

% Save the results to disl
save('output_file_name.mat','fg_classified','classification','fascicles','-v7.3');        
