#!/bin/bash

# Function to get the latest listed version of a NuGet package
get_latest_version() {
  PACKAGE_ID=$1
  API_URL="https://api.nuget.org/v3/registration5-gz-semver2/${PACKAGE_ID}/index.json"

  # Fetch the JSON data from the API
  RESPONSE=$(curl -s $API_URL)

  # Parse the JSON to extract the latest listed version
  LATEST_VERSION=$(echo $RESPONSE | jq -r '.items[].items[] | select(.catalogEntry.listed == true) | .catalogEntry.version' | sort -rV | head -n 1)

  echo $LATEST_VERSION
}

# Usage: Pass the package ID as an argument to the function
PACKAGE_ID="Newtonsoft.Json"
LATEST_VERSION=$(get_latest_version $PACKAGE_ID)

echo "Latest version of $PACKAGE_ID is $LATEST_VERSION"

