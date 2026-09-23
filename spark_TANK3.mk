#
# Copyright (C) 2026 The SparkOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit from device makefile.
$(call inherit-product, device/8849/TANK3/device.mk)

# Inherit some common SparkOS stuff.
$(call inherit-product, vendor/spark/config/common_full_phone.mk)

PRODUCT_NAME := spark_TANK3
PRODUCT_DEVICE := TANK3
PRODUCT_MANUFACTURER := OBLUE
PRODUCT_BRAND := 8849
PRODUCT_MODEL := TANK 3

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="TANK3-user 13 TP1A.220624.014 root.20240418.114127 release-keys"

# Set BUILD_FINGERPRINT variable to be picked up by both system and vendor build.prop
BUILD_FINGERPRINT := 8849/TANK3/TANK3:13/TP1A.220624.014/root.20240418.114127:user/release-keys
