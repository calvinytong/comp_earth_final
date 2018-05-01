#!/bin/sh

set -e

DATA_PATH=$1

if [ -z "$1" ]
  then
    DATA_PATH='./data'
fi


# Download to ./DATA_PATH
kaggle competitions download -c dstl-satellite-imagery-feature-detection -p $DATA_PATH

cd $DATA_PATH

# Unzip recursivly
find . -name "*.zip" | xargs -P 5 -I fileName sh -c 'unzip -o -d "$(dirname "fileName")/$(basename -s .zip "fileName")" "fileName"'

# Delete files
find . -name "*.zip" -type f -delete



