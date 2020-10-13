# ami2
Repository for AMI

Instructions for using packer:
- [packer docs](https://learn.hashicorp.com/collections/packer/getting-started)
- Install packer on Linux:
  - `curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -`
  - `sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"`
  - `sudo apt-get update && sudo apt-get install packer`
- check the version
  - `packer -v`
- validate
  - `packer validate example.json`
- build
  - packer build \
      -var 'aws_access_key=YOUR ACCESS KEY' \
      -var 'aws_secret_key=YOUR SECRET KEY' \
      -var 'aws_region=us-east-1' \
      -var 'subnet_id=${{ secrets.AWS_SUBNET_ID }}' \
      -var 'ami_users=${{ secrets.AMI_USERS }}' \
      example.json
- build output:
```
amazon-ebs: output will be in this color.

==> amazon-ebs: Prevalidating any provided VPC information
==> amazon-ebs: Prevalidating AMI Name: csye6225_1602468960
    amazon-ebs: Found Image ID: ami-0817d428a6fb68645
==> amazon-ebs: Creating temporary keypair: packer_5f83bc60-8979-55cd-5e53-e35c7c74e976
==> amazon-ebs: Creating temporary security group for this instance: packer_5f83bc62-7a3c-0afd-da84-f36600c58087
==> amazon-ebs: Authorizing access to port 22 from [0.0.0.0/0] in the temporary security groups...
==> amazon-ebs: Launching a source AWS instance...
==> amazon-ebs: Adding tags to source instance
    amazon-ebs: Adding tag: "Name": "Packer Builder"
    amazon-ebs: Instance ID: i-028ea21d44ea28b68
==> amazon-ebs: Waiting for instance (i-028ea21d44ea28b68) to become ready...
==> amazon-ebs: Using ssh communicator to connect: 54.226.199.234
==> amazon-ebs: Waiting for SSH to become available...
==> amazon-ebs: Connected to SSH!
==> amazon-ebs: Provisioning with shell script: /tmp/packer-shell350727843
==> amazon-ebs:
==> amazon-ebs: WARNING: apt does not have a stable CLI interface. Use with caution in scripts.
==> amazon-ebs:
    amazon-ebs: Hit:1 http://us-east-1.ec2.archive.ubuntu.com/ubuntu bionic InRelease
    amazon-ebs: Get:2 http://us-east-1.ec2.archive.ubuntu.com/ubuntu bionic-updates InRelease [88.7 kB]
    amazon-ebs: Get:3 http://us-east-1.ec2.archive.ubuntu.com/ubuntu bionic-backports InRelease [74.6 kB]
    amazon-ebs: Get:4 http://security.ubuntu.com/ubuntu bionic-security InRelease [88.7 kB]
    amazon-ebs: Get:5 http://us-east-1.ec2.archive.ubuntu.com/ubuntu bionic/universe amd64 Packages [8570 kB]
    amazon-ebs: Get:6 http://us-east-1.ec2.archive.ubuntu.com/ubuntu bionic/universe Translation-en [4941 kB]
    amazon-ebs: Get:7 http://us-east-1.ec2.archive.ubuntu.com/ubuntu bionic/multiverse amd64 Packages [151 kB]
    amazon-ebs: Get:8 http://us-east-1.ec2.archive.ubuntu.com/ubuntu bionic/multiverse Translation-en [108 kB]
    amazon-ebs: Get:9 http://us-east-1.ec2.archive.ubuntu.com/ubuntu bionic-updates/main amd64 Packages [1681 kB]
    amazon-ebs: Get:10 http://us-east-1.ec2.archive.ubuntu.com/ubuntu bionic-updates/main Translation-en [360 kB]
    amazon-ebs: Get:11 http://us-east-1.ec2.archive.ubuntu.com/ubuntu bionic-updates/restricted amd64 Packages [169 kB]
    amazon-ebs: Get:12 http://us-east-1.ec2.archive.ubuntu.com/ubuntu bionic-updates/restricted Translation-en [23.0 kB]
    amazon-ebs: Get:13 http://us-east-1.ec2.archive.ubuntu.com/ubuntu bionic-updates/universe amd64 Packages [1672 kB]
    amazon-ebs: Get:14 http://us-east-1.ec2.archive.ubuntu.com/ubuntu bionic-updates/universe Translation-en [352 kB]
    amazon-ebs: Get:15 http://us-east-1.ec2.archive.ubuntu.com/ubuntu bionic-updates/multiverse amd64 Packages [30.8 kB]
    amazon-ebs: Get:16 http://us-east-1.ec2.archive.ubuntu.com/ubuntu bionic-updates/multiverse Translation-en [6920 B]
    amazon-ebs: Get:17 http://us-east-1.ec2.archive.ubuntu.com/ubuntu bionic-backports/main amd64 Packages [10.0 kB]
    amazon-ebs: Setting up libalgorithm-merge-perl (0.08-3) ...
    amazon-ebs: Setting up libalgorithm-diff-xs-perl (0.04-5) ...
    amazon-ebs: Setting up binutils-x86-64-linux-gnu (2.30-21ubuntu1~18.04.4) ...
    amazon-ebs: Setting up cpp (4:7.4.0-1ubuntu2.3) ...
    amazon-ebs: Setting up golang-1.10-doc (1.10.4-2ubuntu1~18.04.1) ...
    amazon-ebs: Setting up golang-go (2:1.10~4ubuntu1) ...
    amazon-ebs: Setting up binutils (2.30-21ubuntu1~18.04.4) ...
    amazon-ebs: Setting up golang-1.10 (1.10.4-2ubuntu1~18.04.1) ...
    amazon-ebs: Setting up golang-doc (2:1.10~4ubuntu1) ...
    amazon-ebs: Setting up gcc-7 (7.5.0-3ubuntu1~18.04) ...
    amazon-ebs: Setting up g++-7 (7.5.0-3ubuntu1~18.04) ...
    amazon-ebs: Setting up gcc (4:7.4.0-1ubuntu2.3) ...
    amazon-ebs: Setting up dpkg-dev (1.19.0.5ubuntu2.3) ...
    amazon-ebs: Setting up golang (2:1.10~4ubuntu1) ...
    amazon-ebs: Setting up g++ (4:7.4.0-1ubuntu2.3) ...
    amazon-ebs: update-alternatives: using /usr/bin/g++ to provide /usr/bin/c++ (c++) in auto mode
    amazon-ebs: Setting up build-essential (12.4ubuntu1) ...
    amazon-ebs: Setting up pkg-config (0.29.1-0ubuntu2) ...
    amazon-ebs: Processing triggers for man-db (2.8.3-2ubuntu0.1) ...
    amazon-ebs: Processing triggers for libc-bin (2.27-3ubuntu1.2) ...
==> amazon-ebs: Stopping the source instance...
    amazon-ebs: Stopping instance
==> amazon-ebs: Waiting for the instance to stop...
==> amazon-ebs: Creating AMI csye6225_1602468960 from instance i-028ea21d44ea28b68
    amazon-ebs: AMI: ami-0e95ab01a190eb778
==> amazon-ebs: Waiting for AMI to become ready...
==> amazon-ebs: Modifying attributes on AMI (ami-0e95ab01a190eb778)...
    amazon-ebs: Modifying: description
==> amazon-ebs: Modifying attributes on snapshot (snap-068d74bbfce1b2827)...
==> amazon-ebs: Terminating the source AWS instance...
==> amazon-ebs: Cleaning up any extra volumes...
==> amazon-ebs: No volumes to clean up, skipping
==> amazon-ebs: Deleting temporary security group...
==> amazon-ebs: Deleting temporary keypair...
Build 'amazon-ebs' finished after 6 minutes 49 seconds.
```

Demo commands:
- Run Ec2 instance
- scp webapp
- `sudo mysql`
- `set password=password('MysqlPwd123');`
- `ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'MysqlPwd123';`
- `create database `user_story`;`
- `exit`
- `./webapp`
- send requests to the public IP addr
