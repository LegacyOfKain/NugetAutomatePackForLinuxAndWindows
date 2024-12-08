#!/usr/bin/bash

# Function to get the latest listed version of a NuGet package
get_latest_version() {
  PACKAGE_ID=$1
  API_URL="https://api.nuget.org/v3/registration5-gz-semver2/${PACKAGE_ID}/index.json"
  
  echo $1

  # Fetch the JSON data from the API
  RESPONSE=$(curl -s $API_URL)

  # Parse the JSON to extract the latest listed version
  LATEST_VERSION=$(echo $RESPONSE | jq -r '.items[].items[] | select(.catalogEntry.listed == true) | .catalogEntry.version' | sort -rV | head -n 1)

  echo $LATEST_VERSION
}

