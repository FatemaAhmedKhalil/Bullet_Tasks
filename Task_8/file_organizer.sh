#!/bin/bash

# Define directories for different file types
TXT="TXT_DIR"
PDF="PDF_DIR"
PNG="PNG_DIR"
JPG="JPG_DIR"
misc="misc_DIR"

# Capture Directory Path as an Argument and change to that directory
DIR_PATH=$1 
cd "$DIR_PATH" || exit  # Exit if the directory doesn't exist

organize_files() {
    for file in * .*; do  # Loop through all files, including hidden ones
        if [[ -f "$file" ]]; then  # Check if the item is a regular file
            file_extension=${file##*.}  # Extract the file extension

            case "$file_extension" in
            txt)  
                # Handle .txt files
                if [[ ! -d "$TXT" ]]; then
                    mkdir "$TXT"  # Create TXT_DIR if it doesn't exist
                fi
                mv "$file" "$TXT/"  # Move .txt file to TXT_DIR
            ;;
            
            pdf)  
                # Handle .pdf files
                if [[ ! -d "$PDF" ]]; then
                    mkdir "$PDF"  # Create PDF_DIR if it doesn't exist
                fi
                mv "$file" "$PDF/"  # Move .pdf file to PDF_DIR
            ;;

            png)  
                # Handle .png files
                if [[ ! -d "$PNG" ]]; then
                    mkdir "$PNG"  # Create PNG_DIR if it doesn't exist
                fi
                mv "$file" "$PNG/"  # Move .png file to PNG_DIR
            ;;

            jpg)  
                # Handle .jpg files
                if [[ ! -d "$JPG" ]]; then
                    mkdir "$JPG"  # Create JPG_DIR if it doesn't exist
                fi
                mv "$file" "$JPG/"  # Move .jpg file to JPG_DIR
            ;;

            *)  
                # Handle files unkown extensions or without extension
                if [[ ! -d "$misc" ]]; then
                    mkdir "$misc"  # Create misc_DIR if it doesn't exist
                fi
                mv "$file" "$misc/"  # Move files with unknown extensions to misc_DIR
            ;;
            esac
        fi    
    done
}

organize_files  # Call the function to organize files
