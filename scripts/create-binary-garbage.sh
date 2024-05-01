#!/bin/bash

output_file=$(uuidgen | tr -d '-')
dd if=/dev/urandom of=$output_file bs=10M count=1
