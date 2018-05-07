#!/usr/bin/env bash
#
# @author: dan.sorak
#
# This script creates the base image, and then builds the 5.1.8 and 6.0.0 images based on it
#

THIS_DIR=$(cd $(dirname "${BASH_SOURCE[0]}") && pwd)
THIS_HOST=`hostname`

set -e
set -x

(cd base && docker build -t dse-base:latest .)
(cd server/5.1 && docker build -t dse-server:5.1.8 .)
(cd server/6.0 && docker build -t dse-server:6.0.0 .)
