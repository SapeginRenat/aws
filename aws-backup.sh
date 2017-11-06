#!/bin/bash

# EC2_HOME 

# JAVA_HOME

# Regions reference

# You can find your instance ID at AWS Manage Console

instanceID="YOUR-INSTANCE-ID"

# Your prefer AMI Name prefix

amiNamePrefix="AMI_"

# Your prefer AMI Description
amiDescription="Backup"

# If you want to keep 7 days AMI backups, please set routine true otherwise set it false
routine=true

# Variable for routine is true
weekday=$(date +%a)

if [ $routine = true ]; then
    # Setup AMI Name
    amiName=$snapshotIDs$weekday

    # Get AMI ID
    amiIDs=$(ec2-describe-images --region $region | grep 'ami-[a-z0-9]' | grep "$amiName" |cut -f 2)

    # Get Snapshot ID
    if [[ ! -z $amiIDs ]]; then
        snapshotIDs=$(ec2-describe-snapshots --region $region | grep $amiIDs | cut -f 2)
    fi
else
    # Setup AMI Name
    amiName=$amiNamePrefix

    # Get AMI ID
    amiIDs=$(ec2-describe-images --region $region | grep 'ami-[a-z0-9]' | cut -f 2)

    # Get Snapshot ID
    if [[ ! -z $amiIDs ]]; then
        snapshotIDs=$(ec2-describe-snapshots --region $region | cut -f 2)
    fi
fi

if [[ ! -z $amiIDs ]]; then
    # Deregister AMI
    for amiID in $amiIDs
    do
        ec2-deregister --region $region $amiID
    done

    # Delete snapshot
    for snapshotID in $snapshotIDs
    do
        ec2-delete-snapshot --region $region $snapshotID
    done
fi

# Create AMI
ec2-create-image $instanceID --region $region --name "$amiName" -d "$amiDescription" --no-reboot
