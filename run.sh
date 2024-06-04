#!/bin/bash
for parameter in catalogue.prod.MONGO_URL,MONGO_URL catalogue.prod.DOCUMENTDB,DOCUMENTDB; do
  ssm_parameter=$(echo $parameter | awk -F , '{print $1}')
  app_parameter=$(echo $parameter | awk -F , '{print $2}')
  echo export ${app_parameter}=\"$(aws get-parameter --name $ssm_parameter --with-decryption | jq .Parameter.Value | sed -e 's/"//g')\"
done

















#for parameter in $PARAMETERS; do
#  ssm_parameter=$(echo $parameter | awk -F , '{print $1}')
#  app_parameter=$(echo $parameter | awk -F , '{print $2}')
#  echo export ${app_parameter}=\"$(aws get-parameter --name $ssm_parameter --with-decryption | jq .Parameter.Value | sed -e 's/"//g')\" >>/common/parameters
#done
#
#
#cat /common/parameters

