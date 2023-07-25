#!/bin/bash

# Get the current date in the format "yyyymmdd"
current_date=$(date +"%Y%m%d")

# Get the name of the current branch
current_branch=$(git symbolic-ref --short HEAD)

# Get the latest tag on the current branch (if any)
latest_tag=$(git describe --tags --abbrev=0)

# Extract the version number from the latest tag (if any)
if [[ $latest_tag =~ [0-9]+$ ]]; then
    version_number=${BASH_REMATCH[0]}
    new_version_number=$((version_number + 1))
else
    # If there are no tags on the branch, start with version 1
    new_version_number=1
fi

# Create the new tag name in the format "BranchName-CurrentDate-Version"
new_tag="$current_branch-$current_date-V1.$new_version_number"

# Display the new tag name
echo "New tag: $new_tag"

# Create the tag
git tag "$new_tag"

# Inform the user about the new tag creation
echo "Tag \"$new_tag\" created successfully!"
