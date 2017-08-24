[![Abcdspec-compliant](https://img.shields.io/badge/ABCD_Spec-v1.0-green.svg)](https://github.com/soichih/abcd-spec)

# app-tractclassification
Classify major human white matter tracts using AFQ

This service uses Automated fiber quantification AFQ and fe structure output from LiFE to identify major tracts segments and quantify tissue properties along their trajectories. 

You can choose to have the zero weighted fibers (as determined by LiFE) removed before or after AFQ is applied. IF you choose "after", the processing will take longer time.

useinterhemisphericsplit is a variable from AFQ, which if set to true will cut fibers crossing between hemispheres with a midsaggital plane below z=-10. This is to get rid of CST fibers that appear to cross at the level of the brainstem. 

 
 
