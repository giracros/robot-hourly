#!/usr/bin/env bash

docker run --rm \
           -e USERNAME="Hourly QA Team" \
           --net=host \
           -v "$PWD/test_suites":/test_suites \
           -v "$PWD/scripts":/scripts \
           -v "$PWD/reports":/reports \
           -v "$PWD/resources":/resources \
           --security-opt seccomp:unconfined \
           --shm-size "2g" \
           ypasmk/robot-framework