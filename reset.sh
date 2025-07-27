#!/bin/bash

# Define the JetBrains product name (e.g., PyCharm, IntelliJIdea, etc.)
PRODUCT_NAME="PyCharm"  # Change this to your specific JetBrains product

# Get the current user's home directory
HOME_DIR=~

# Directories to delete
DIRS=(
    "$HOME_DIR/Library/Preferences/JetBrains"
    "$HOME_DIR/Library/Caches/JetBrains"
    "$HOME_DIR/Library/Logs/JetBrains"
    "$HOME_DIR/Library/Application Support/JetBrains"
)

# Loop through directories and delete them
for DIR in "${DIRS[@]}"; do
    if [ -d "$DIR" ]; then
        echo "Deleting directory: $DIR"
        rm -rf "$DIR"
    else
        echo "Directory not found: $DIR"
    fi
done

# Delete product-specific directories (e.g., PyCharm2023.3)
PRODUCT_DIRS=(
    "$HOME_DIR/Library/Preferences/${PRODUCT_NAME}*"
    "$HOME_DIR/Library/Caches/${PRODUCT_NAME}*"
    "$HOME_DIR/Library/Logs/${PRODUCT_NAME}*"
    "$HOME_DIR/Library/Application Support/${PRODUCT_NAME}*"
)

for PRODUCT_DIR in "${PRODUCT_DIRS[@]}"; do
    if [ -d "$PRODUCT_DIR" ]; then
        echo "Deleting product directory: $PRODUCT_DIR"
        rm -rf "$PRODUCT_DIR"
    else
        echo "Product directory not found: $PRODUCT_DIR"
    fi
done

echo "Reset complete. All JetBrains settings and licensing information have been cleared."