#!/usr/bin/env bash
# In case you can't configure the Spark Session to allow you to download from
# the private bucket, you can execute this script.
set -euo pipefail

LOCAL_TARBALL=/tmp/airlines.tar.gz
TARGET_DIR=$(dirname -- $0)/../../data/raw_zone/flights

echo "Downloading data..."
curl https://dmacademy-course-assets-public.s3.eu-west-1.amazonaws.com/pyspark/AirlineSubsetCsv.tar.gz \
 --output ${LOCAL_TARBALL} \
 --silent \
 --show-error

echo "Unpacking data in the target directory..."
mkdir -p ${TARGET_DIR}
tar xzf ${LOCAL_TARBALL} \
  --directory ${TARGET_DIR} \
  --strip-components 1

echo "You're good to go!"