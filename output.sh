#!/bin/bash

# Apply Terraform configuration and capture JSON output
terraform apply -json > tf_output.json

# Check for modified resources
echo "Modified resources:"
jq '.resource_changes[] | select(.change.actions | index("update")) | .address' tf_output.json


*********  or **

#!/bin/bash

# Generate the plan and save it to a file
terraform plan -out=tfplan

# Convert the plan to JSON and save it to a file
terraform show -json tfplan > tfplan.json

# Extract created, updated, and deleted resources
echo "Created resources:"
jq '.resource_changes[] | select(.change.actions | contains(["create"])) | .address' tfplan.json

echo "Updated resources:"
jq '.resource_changes[] | select(.change.actions | contains(["update"])) | .address' tfplan.json

echo "Deleted resources:"
jq '.resource_changes[] | select(.change.actions | contains(["delete"])) | .address' tfplan.json
