#!/bin/bash

##############
### CLIENT ###
# https://min.io/docs/minio/linux/reference/minio-mc.html
##############

# send file, ex:
# - https://gist.github.com/PhilipSchmid/1fd2688ace9f51ecaca2788a91fec133
# - https://gist.github.com/JustinTimperio/7c7115f87b775618637d67ac911e595f
# Usage: ./minio-upload my-bucket my-file.zip

# #bucket=$1
# bucket=/buckets/alpha
# #file=$2
# file=./fixtures/minio/data.txt

# host=127.0.0.1:9101
# s3_key=minioadmin
# s3_secret=minioadmin

# resource="/${bucket}/${file}"
# content_type="application/octet-stream"
# date=`date -R`

# _signature="
# PUT\n\n
# ${content_type}\n
# ${date}\n
# ${resource}
# "
# signature=`echo -en ${_signature} | openssl sha1 -hmac ${s3_secret} -binary | base64`

# curl -v -X PUT -T "${file}" \
# -H "Host: ${host}" \
# -H "Date: ${date}" \
# -H "Content-Type: ${content_type}" \
# https://${host}${resource}
# #-H "Authorization: AWS ${s3_key}:${signature}" \


###############
###SAMPLE 2 ###
###############

# # User Minio Vars
# URL=$1
# USERNAME=$2
# PASSWORD=$3
# BUCKET=$4
# FILE_NAME=$(basename $6)
# OBJ_PATH="/${BUCKET}/$5/${FILE_NAME}"

# # Static Vars
# DATE=$(date -R --utc)
# CONTENT_TYPE='application/zstd'
# SIG_STRING="PUT\n\n${CONTENT_TYPE}\n${DATE}\n${OBJ_PATH}"
# SIGNATURE=`echo -en ${SIG_STRING} | openssl sha1 -hmac ${PASSWORD} -binary | base64`

# curl --silent -v -X PUT -T "${FILE}" \
#     -H "Host: $URL" \
#     -H "Date: ${DATE}" \
#     -H "Content-Type: ${CONTENT_TYPE}" \
#     -H "Authorization: AWS ${USERNAME}:${SIGNATURE}" \
#     https://$URL${OBJ_PATH}