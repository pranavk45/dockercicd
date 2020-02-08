#!/bin/bash
imgtag=$1
cat /home/kubhttpd/httpdapp.yml | sed "s/{{imageTag}}/$imgtag/g" | kubectl apply -f -
