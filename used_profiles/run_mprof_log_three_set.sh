# !/bin/bash

echo Target dataset: electronic

mprof run main.py --config_file config/profile_electronic_config.ini

mv *.dat results/electronic_result/

echo Target dataset: m1

mprof run main.py --config_file config/profile_m1_config.ini

mv *.dat results/m1_result/

echo Target dataset: yelp

mprof run main.py --config_file config/profile_yelp_config.ini

mv *.dat results/yelp_result/

echo DONE!
