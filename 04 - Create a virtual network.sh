#!/bin/sh

VM1='vm1'
VM2='vm2'
RG='myRGVM'
LOCATION='eastus'
IMAGE='Win2019Datacenter'
SIZE='Standard_D2s_v3'
USER='azureuser'
PASS='Pa$$w0rd1234'
VNET='vnet1'


# az login
az account set -s f7052807-d1f7-47b0-8968-4ae1f397400e
az group create -l $LOCATION -n $RG
az network vnet create -g $RG -name $VNET --address-prefixes '10.1.0.0/16' -l $LOCATION --subnet-name 'default' --subnet-prefixes '10.1.0.0/16'
az vm create -n $VM1 -g $RG --admin-username "$USER" --admin-password "$PASS"  --image $IMAGE -l $LOCATION --vnet-name $VNET --nsg-rule RDP,HTTP --size $SIZE --no-wait
az vm create -n $VM2 -g $RG --admin-username "$USER" --admin-password "$PASS"  --image $IMAGE -l $LOCATION --vnet-name $VNET --nsg-rule RDP,HTTP --size $SIZE --no-wait


# az group delete -n $RG --no-wait -y
# az group list -o table