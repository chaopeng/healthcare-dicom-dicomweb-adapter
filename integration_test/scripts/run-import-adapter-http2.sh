#!/bin/bash
# ADAPTER_PORT VERSION PROJECT LOCATION DATASET STORE_NAME imageProject commitShortSha

export PATH=$PATH:/opt/gradle/gradle-6.7/bin &&
cd /workspace/import &&
gradle run \
 -Dorg.dcm4che3.imageio.codec.ImageReaderFactory=com/google/cloud/healthcare/imaging/dicomadapter/transcoder/ImageReaderFactory.properties \
 -Dorg.dcm4che3.imageio.codec.ImageWriterFactory=com/google/cloud/healthcare/imaging/dicomadapter/transcoder/ImageWriterFactory.properties \
 -Dexec.args="--dimse_aet=IMPORTADAPTER --dimse_port=${1} --stow_http2 --dicomweb_address=https://healthcare.googleapis.com/${2}/projects/${3}/locations/${4}/datasets/${5}/dicomStores/${6}/dicomWeb --verbose" &
 trap "exit 0" SIGTERM; while true; do sleep 1; done
