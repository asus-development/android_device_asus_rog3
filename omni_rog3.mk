# Copyright (C) 2010 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

#
# This file is the build configuration for a full Android
# build for grouper hardware. This cleanly combines a set of
# device-specific aspects (drivers) with a device-agnostic
# product configuration (apps).
#

# Sample: This is where we'd set a backup provider if we had one
# $(call inherit-product, device/sample/products/backup_overlay.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)

# Get the prebuilt list of APNs
$(call inherit-product, vendor/omni/config/gsm.mk)

# Inherit from the common Open Source product configuration
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base_telephony.mk)

# must be before including omni part
TARGET_BOOTANIMATION_SIZE := 1080p

# Inherit from our custom product configuration
$(call inherit-product, vendor/omni/config/common.mk)

# Inherit from hardware-specific part of the product configuration
$(call inherit-product, device/asus/rog3/device.mk)

# Discard inherited values and use our own instead.
PRODUCT_DEVICE := rog3
PRODUCT_NAME := omni_rog3
PRODUCT_BRAND := asus
PRODUCT_MODEL := ASUS_I003D
PRODUCT_MANUFACTURER := asus

PRODUCT_GMS_CLIENTID_BASE := android-asus

TARGET_DEVICE := WW_I003D
PRODUCT_SYSTEM_DEVICE := ASUS_I003_1
PRODUCT_SYSTEM_NAME := WW_I003D

OMNI_PRODUCT_PROPERTIES += \
    ro.build.product=ZS661KS

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_DEVICE=ASUS_I003_1 \
    PRODUCT_NAME=WW_I003D \
    TARGET_DEVICE=ZS661KS

VENDOR_RELEASE := 10/QKQ1.200419.002/17.0823.2008.78-0:user/release-keys
BUILD_FINGERPRINT := asus/WW_I003D/ASUS_I003_1:$(VENDOR_RELEASE)
OMNI_BUILD_FINGERPRINT := asus/WW_I003D/ASUS_I003_1:$(VENDOR_RELEASE)
OMNI_PRIVATE_BUILD_DESC := "'QKQ1.200419.002.WW_Phone-17.0823.2008.78-0'"

# Security patch level from stock
PLATFORM_SECURITY_PATCH_OVERRIDE := 2020-08-01
