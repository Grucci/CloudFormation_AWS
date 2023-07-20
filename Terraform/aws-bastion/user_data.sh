#!/bin/bash -x
exec > /tmp/part-001.log 2>&1

##############
# Install deps
##############

# Apt based distro
if command -v apt-get &>/dev/null; then
  apt-get update
  apt-get install python-pip jq -y

# Yum based distro
elif command -v yum &>/dev/null; then
  yum update -y
  # epel provides python-pip & jq
  yum install -y epel-release
  yum install python-pip jq -y
fi

#####################

pip install --upgrade awscli

##############
SUBNETS=("${subnet_ids}")
EIPS=("${eip_ids}")

MAC_ADDRESS=$(curl http://169.254.169.254/latest/meta-data/network/interfaces/macs/)
SUBNET_ID=$(curl http://169.254.169.254/latest/meta-data/network/interfaces/macs/$MAC_ADDRESS/subnet-id)

SUBNETS_LEN=$${#SUBNETS[*]}
for (( i=0; i<=$(( SUBNETS_LEN -1 )); i++ ))
do
    if [ $${SUBNETS[$i]} == $SUBNET_ID ]; then
        EIP_ID=$${EIPS[$i]}
    fi
done

echo "EIP_ID=$EIP_ID"
aws ec2 associate-address --instance-id $(curl http://169.254.169.254/latest/meta-data/instance-id) --allocation-id $EIP_ID --allow-reassociation --region ${region}

# Append addition user-data script
${additional_user_data_script}