#
# Copyright (C) 2026 The SparkOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/8849/TANK3

# A/B
AB_OTA_UPDATER := true

AB_OTA_PARTITIONS += \
    odm \
    odm_dlkm \
    product \
    system \
    system_ext \
    vendor \
    vendor_dlkm \
    boot \
    vendor_boot \
    vbmeta \
    vbmeta_system \
    vbmeta_vendor
