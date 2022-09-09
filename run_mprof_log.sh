# !/bin/bash

echo Target dataset: "$1"

mprof run main.py --config_file config/profile_"$1"_config.ini
