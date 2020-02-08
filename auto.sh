#!/bin/bash
imgtag=$1
cat httpdapp.yml | sed "s/{{imageTag}}/$imgtag/g" | kubectl apply -f 
