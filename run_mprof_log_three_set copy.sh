# !/bin/bash

echo Target dataset: amazon

mprof run main.py --config_file config/profile_amazon_config.ini

mv *.dat results/amazon_result/

echo Target dataset: gowalla

mprof run main.py --config_file config/profile_gowalla_config.ini

mv *.dat results/gowalla_result/