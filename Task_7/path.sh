#!/usr/bin/bash

Path=""
read Path

# Get a Sub String
Name=$(echo -e "${Path:6:4}")
Extention=$(echo -e "${Path:10:4}")

echo $"File Name: ${Name}"
echo $"File Extention: ${Extention}"