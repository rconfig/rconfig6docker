#!/bin/bash

## This script is used to build the development environment for rconfig.
## This should be used only for image build puposes, and end users should
## use the docker-compose.yml file to build the images and run the containers.
git clone https://github.com/rconfig/rconfig.git
cd rconfig
composer install
cd ..
rm -fr data
mkdir -p data
mkdir -p data/db_data
cp -r rconfig/storage data/
cp .env.example data/.env
