# !/bin/bash

echo Target dataset: "$1"

python -m memory_profiler main.py --config_file config/profile_"$1"_config.ini
