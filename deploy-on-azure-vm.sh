#!/usr/bin/env bash
set -euo pipefail
# -e (errexit) causes the script to exit immediately if any command exits with a non-zero status.
# -u (nounset) causes the script to exit with an error if an undefined variable is used.
# -o pipefail causes a pipeline to return the exit status of the last command
# that returned a non-zero exit status, or zero if all commands in the pipeline exit successfully

# This script deploys Joget DX 8 on an Azure VM using Terraform and Ansible.
# It initializes Terraform, applies the configuration to create the VM,
# retrieves the public IP address of the VM, and then runs an Ansible playbook to
# install Joget DX 8 on the VM.
# Ensure you have the necessary tools installed:
# - Terraform
# - Ansible
# - Ansible community.mysql collection (ansible-galaxy collection install community.mysql)
# - Azure CLI (az)
# - SSH access to the VM (private key should be in ~/.ssh/azure_id_rsa)
# Ensure you have the necessary permissions and configurations set up in Azure.
# Ensure you have the Joget DX 8 tarball available at the specified download URL in the Ansible playbook.

echo "Define directories for Terraform and Ansible"
TF_DIR="terraform/azure/vm"
ANSIBLE_DIR="ansible"

echo "TERRAFORM PART..."
echo "\n"
echo "Initializing Terraform in '$TF_DIR' folder..."
pushd "$TF_DIR" > /dev/null
terraform init

echo "Applying Terraform without asking for interactive confirmation..."
terraform apply --auto-approve

echo "ANSIBLE PART..."
echo "\n"

echo "Retrieving public IP address..."
IP=$(terraform output -raw vm_public_ip)
echo "Retrieved VM IP: $IP"

echo "Moving out of directory: $TF_DIR..."
popd > /dev/null

echo "Disabling SSH host key checking..."
export ANSIBLE_HOST_KEY_CHECKING=False

echo "Changing to Ansible directory: '$ANSIBLE_DIR'..."
pushd "$ANSIBLE_DIR" > /dev/null

echo "Wait for SSH to be available at $IP…"

# Loop to make sure of SSH availability
# This will keep trying to SSH into the VM until it succeeds or times out.
until ssh -o BatchMode=yes \
         -o ConnectTimeout=5 \
         -o StrictHostKeyChecking=no \
         -i ~/.ssh/azure_id_rsa \
         azureuser@"$IP" 'echo ok' &>/dev/null; do
  printf '.'
  sleep 5
done

echo "SSH is now available on $IP."

echo "Running Ansible playbook..."
ansible-playbook -i "${IP}," joget.yml --user azureuser --private-key ~/.ssh/azure_id_rsa

echo "Deployment completed successfully!"