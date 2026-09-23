#
# Copyright (C) 2026 The SparkOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

LOCAL_PATH := $(call my-dir)

ifeq ($(TARGET_DEVICE),TANK3)
include $(call all-makefiles-under,$(LOCAL_PATH))
endif
