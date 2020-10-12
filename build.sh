#!/bin/bash

packer build \
    -var 'aws_access_key=${{ secrets.AWS_ACCESS_KEY_ID }}' \
    -var 'aws_secret_key=${{ secrets.AWS_SECRET_ACCESS_KEY }}' \
    -var 'aws_region=us-east-1' \
    -var 'subnet_id=subnet-03c59159a4ce293fe' \
    ami.json
