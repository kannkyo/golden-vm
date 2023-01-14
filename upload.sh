#!/bin/bash

# see https://developer.hashicorp.com/vagrant/vagrant-cloud/api#creating-a-usable-box-from-scratch

VAGRANT_USER=
VAGRANT_CLOUD_TOKEN=

. .ini
. .env

BOX_NAME=hard/$VM_NAME
BOX_VERSION=$BOX_VERSION
BOX_PROVIDER=virtualbox
BOX_PATH=$VM_NAME.box

echo ========================================================
echo VAGRANT_USER=$VAGRANT_USER
echo VAGRANT_CLOUD_TOKEN=$VAGRANT_CLOUD_TOKEN
echo BOX_NAME=$BOX_NAME
echo BOX_VERSION=$BOX_VERSION
echo BOX_PROVIDER=$BOX_PROVIDER
echo BOX_PATH=$BOX_PATH
echo ========================================================

# Create vm box file
vagrant package default --output $BOX_PATH

# Get upload path
response=$(curl \
  --header "Authorization: Bearer $VAGRANT_CLOUD_TOKEN" \
  https://app.vagrantup.com/api/v1/box/${VAGRANT_USER}/${BOX_NAME}/version/${BOX_VERSION}/provider/${BOX_PROVIDER}/upload)

upload_path=$(echo "$response" | jq -r .upload_path)

# Upload vm box file
curl \
  $upload_path \
  --request PUT \
  --upload-file $BOX_PATH

# Remove vm box file
# rm $BOX_PATH
