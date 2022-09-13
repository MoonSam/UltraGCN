# !/bin/bash

echo Target dataset: amazon

python -m memory_profiler main.py --config_file config/profile_amazon_config.ini

mv *.dat results/amazon_result/
