#!/bin/bash
# clean.sh

# Navigate into buildroot and run distclean
make -C buildroot distclean

# Optionally, clean other parts of your project if needed
# For example:
# rm -rf output/
# git submodule foreach git clean -fdx

echo "Clean completed."

