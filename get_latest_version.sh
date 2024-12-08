#!/bin/bash

# Function to get the latest listed version of a NuGet package
get_latest_version() {
  PACKAGE_ID=$1
  API_URL="https://api.nuget.org/v3/registration5-gz-semver2/${PACKAGE_ID}/index.json"
  
  echo "Package ID: $PACKAGE_ID"
  echo "API URL: $API_URL"

  # Check if curl is available
  if ! command -v curl &> /dev/null; then
    echo "Error: curl is not installed" >&2
    exit 1
  fi

  # Check if jq is available
  if ! command -v jq &> /dev/null; then
    echo "Error: jq is not installed" >&2
    exit 1
  fi

  # Fetch the JSON data from the API
  RESPONSE=$(curl -s "$API_URL")

  # Check if the API request was successful
  if [ $? -ne 0 ]; then
    echo "Error: Failed to fetch data from NuGet API" >&2
    exit 1
  fi

  echo "API Response: $RESPONSE"

  # Parse the JSON to extract the latest listed version
  LATEST_VERSION=$(echo "$RESPONSE" | jq -r '.items[0].items[-1].catalogEntry.version' 2>/dev/null)

  if [ -z "$LATEST_VERSION" ] || [ "$LATEST_VERSION" == "null" ]; then
    echo "No version found. Defaulting to 1.0.0"
    LATEST_VERSION="1.0.0"
  else
    echo "Latest version found: $LATEST_VERSION"
  fi

  echo "$LATEST_VERSION"

# Check if a package ID was provided
if [ $# -eq 0 ]; then
  echo "Error: No package ID provided" >&2
  echo "Usage: $0 <package_id>" >&2
  exit 1
fi

# Call the function with the provided package ID
get_latest_version "$1"