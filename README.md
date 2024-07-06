# myterraform
MyTerraform pro actions are here 


Hello, 

This code is about, when we are apply our terraform code, some times difficult to find out which are resources going to delete and updated or modified, so we can now find easily with my code. Thank You.

Let explore ...

   # Terraform Output Differentiation

This project provides a method to generate a Terraform plan, convert the plan to JSON, and differentiate between created, updated, and destroyed resources.

## Table of Contents

- [Prerequisites](#prerequisites)
- [Setup](#setup)
- [Generate and Parse Terraform Plan](#generate-and-parse-terraform-plan)
- [Usage](#usage)
- [Contributing](#contributing)
- [License](#license)

## Prerequisites

- Terraform installed on your local machine. You can download it from [here](https://www.terraform.io/downloads.html).
- `jq` installed for parsing JSON. You can download it from [here](https://stedolan.github.io/jq/download/).

## Setup

1. **Clone the repository:**

    ```sh
    git clone https://github.com/yourusername/your-repository.git
    cd your-repository
    ```

2. **Initialize Terraform:**

    ```sh
    terraform init
    ```

## Generate and Parse Terraform Plan

1. **Generate the Terraform plan and save it to a file:**

    ```sh
    terraform plan -out=tfplan
    ```

2. **Convert the plan to JSON and save it to a file:**

    ```sh
    terraform show -json tfplan > tfplan.json
    ```

3. **Parse the JSON file to differentiate resources:**

    - **Created resources:**

        ```sh
        jq '.resource_changes[] | select(.change.actions | contains(["create"])) | .address' tfplan.json
        ```

    - **Updated resources:**

        ```sh
        jq '.resource_changes[] | select(.change.actions | contains(["update"])) | .address' tfplan.json
        ```

    - **Destroyed resources:**

        ```sh
        jq '.resource_changes[] | select(.change.actions | contains(["delete"])) | .address' tfplan.json
        ```

## Usage

You can automate the above steps using the following script:

```sh
#!/bin/bash

# Generate the Terraform plan and save it to a file
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
