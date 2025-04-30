#!/bin/bash
# Initialize Yocto build environment
source poky/oe-init-build-env build

# Verify bitbake is functional
check_bitbake() {
    if ! command -v bitbake >/dev/null 2>&1; then
        echo "Error: bitbake command not found - environment setup failed"
        exit 1
    fi
}

# List of layers to add (relative paths from build directory)
layers=(
    "../meta-openembedded/meta-oe"
    "../meta-qt5"
    "../meta-openembedded/meta-python"
    "../meta-openembedded/meta-webserver"
    "../meta-openembedded/meta-networking"
    "../meta-openembedded/meta-multimedia"
    "../meta-tegra"
    "../meta-openembedded/meta-filesystems"
    "../meta-virtualization"
    "../meta-custom"
)

# Add layers with safety checks
for layer in "${layers[@]}"; do
    echo "Adding layer: $layer"
    
    # Check bitbake functionality before layer addition
    check_bitbake
    
    # Add layer and verify success
    if ! bitbake-layers add-layer "$layer"; then
        echo "Error: Failed to add layer $layer"
        exit 1
    fi
    
done

echo "All layers added successfully"

echo "Starting Image core-image-sato-dev build"

bitbake core-image-sato-dev

