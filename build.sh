#!/usr/bin/env bash
#
# @author: dan.sorak
#
# This Stage 1 script will copy all components of the DPS application to the DPS devop (dev) host in
# the cloud and then from there, deploy to the service hosts within the cloud using the stage2 script.
#

THIS_DIR=$(cd $(dirname "${BASH_SOURCE[0]}") && pwd)
THIS_HOST=`hostname`

set -e
set -x

(cd base && docker build -t dse-base:latest .)
(cd server/5.1 && docker build -t dse-server:5.1.8 .)
(cd server/6.0 && docker build -t dse-server:6.0.0 .)
