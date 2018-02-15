#!/bin/bash
module load matlab/2017a

cat > build.m <<END
addpath(genpath('/N/u/brlife/git/encode'))
%addpath(genpath('/N/u/brlife/git/vistasoft'))
%addpath(genpath('/N/u/brlife/git/afq'))
addpath(genpath('/N/u/brlife/git/jsonlab'))
addpath(genpath('/N/soft/rhel7/spm/8'))

%need to use lindsey's patched version to work around the spm issue
%for vistasoft https://github.com/vistalab/vistasoft/issues/278#issuecomment-366032318
%looks like this issue is going to be addressed by vistasoft so we won't need to override this too long
addpath(genpath('/N/u/kitchell/Karst/Applications/vistasoft'))

%https://github.com/yeatmanlab/AFQ/issues/24
addpath(genpath('/N/u/kitchell/Karst/Applications/AFQ'))

mcc -m -R -nodisplay -d compiled main
exit
END
matlab -nodisplay -nosplash -r build && rm build.m
