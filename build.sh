#!/bin/bash

: ${NRF_IMAGE:=dbindloss/nginx-rtmp-ffmpeg}

docker build -t $NRF_IMAGE .
