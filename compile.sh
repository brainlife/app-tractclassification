#!/bin/bash
module load matlab/2019a

log=compiled/commit_ids.txt
true > $log

echo "/N/u/brlife/git/encode" >> $log
(cd /N/u/brlife/git/encode && git log -1) >> $log

echo "/N/u/brlife/git/jsonlab" >> $log
(cd /N/u/brlife/git/jsonlab && git log -1) >> $log

echo "/N/u/hayashis/git/vistasoft" >> $log
(cd /N/u/hayashis/git/vistasoft && git log -1) >> $log

echo "/N/u/brlife/git/afq" >> $log
(cd /N/u/brlife/git/afq && git log -1) >> $log

cat > build.m <<END
addpath(genpath('/N/soft/rhel7/spm/8'))
addpath(genpath('/N/u/brlife/git/encode'))
addpath(genpath('/N/u/brlife/git/jsonlab'))
addpath(genpath('/N/u/hayashis/git/vistasoft'))
addpath(genpath('/N/u/brlife/git/afq'))
mcc -m -R -nodisplay -a /N/u/hayashis/git/vistasoft/mrAnatomy/mex -d compiled main
exit
END

matlab -nodisplay -nosplash -r build && rm build.m

