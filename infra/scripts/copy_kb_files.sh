#!/bin/bash

# Variables
storageAccount="$1"
fileSystem="$2"
baseUrl="$3"
managedIdentityClientId="$4"

zipFileName1="sampledata.zip"
extractedFolder1="sampledata"
zipUrl1=${baseUrl}"infra/data/sampledata.zip"


mkdir -p "/mnt/azscripts/azscriptinput/$extractedFolder1"


# Download the zip file
curl --output /mnt/azscripts/azscriptinput/"$zipFileName1" "$zipUrl1"

# Extract the zip file
unzip /mnt/azscripts/azscriptinput/"$zipFileName1" -d /mnt/azscripts/azscriptinput/"$extractedFolder1"

echo "Script Started"

# Authenticate with Azure using managed identity
az login --identity --client-id ${managedIdentityClientId}
# Using az storage blob upload-batch to upload files with managed identity authentication, as the az storage fs directory upload command is not working with managed identity authentication.
az storage blob upload-batch --account-name "$storageAccount" --destination data/"$extractedFolder1" --source /mnt/azscripts/azscriptinput/"$extractedFolder1" --auth-mode login --pattern '*' --overwrite