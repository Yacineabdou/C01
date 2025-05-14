#!/bin/bash
read -a arg
i=1

for arg in "${arg[@]}"; do
    echo "Argument $((i++)): $arg"
done