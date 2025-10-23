#!/bin/bash
set -e
shopt -s globstar

chmod +x makeiso.sh

make clean && make

./makeiso.sh

echo "==================== Build complete ===================="