#
# Copyright (C) 2026 The SparkOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

LOCAL_PATH := $(call my-dir)

ifeq ($(TARGET_DEVICE),TANK3)
include $(call all-makefiles-under,$(LOCAL_PATH))

include $(CLEAR_VARS)

ALLOCATOR_SYMLINK := $(TARGET_OUT_VENDOR)/bin/hw/android.hardware.graphics.allocator@4.0-service-mediatek
$(ALLOCATOR_SYMLINK): $(LOCAL_INSTALLED_MODULE)
	@mkdir -p $(dir $@)
	$(hide) ln -sf mt6895/android.hardware.graphics.allocator@4.0-service-mediatek.mt6895 $@

ALL_DEFAULT_INSTALLED_MODULES += $(ALLOCATOR_SYMLINK)

EGL_LIBS := libGLES_mali.so
EGL_SYMLINK := $(addprefix $(TARGET_OUT_VENDOR)/lib/,$(notdir $(EGL_LIBS)))
EGL_SYMLINK += $(addprefix $(TARGET_OUT_VENDOR)/lib64/,$(notdir $(EGL_LIBS)))
$(EGL_SYMLINK): $(LOCAL_INSTALLED_MODULE)
	@mkdir -p $(dir $@)
	$(hide) ln -sf egl/$(notdir $@) $@

ALL_DEFAULT_INSTALLED_MODULES += $(EGL_SYMLINK)

MT6895_LIBS := android.hardware.graphics.allocator@4.0-impl-mediatek.so android.hardware.graphics.mapper@4.0-impl-mediatek.so gralloc.common.so vendor.mediatek.hardware.pq@2.15-impl.so vulkan.mali.so arm.graphics-V1-ndk_platform.so libaalservice.so libaal_cust_func.so libaiselector.so libdpframework.so libmtk_drvb.so libnir_neon_driver.so libpqparamparser.so libpqpconfig.so
MT6895_SYMLINK := $(addprefix $(TARGET_OUT_VENDOR)/lib/,$(notdir $(MT6895_LIBS)))
MT6895_SYMLINK += $(addprefix $(TARGET_OUT_VENDOR)/lib64/,$(notdir $(MT6895_LIBS)))
$(MT6895_SYMLINK): $(LOCAL_INSTALLED_MODULE)
	@mkdir -p $(dir $@)
	$(hide) ln -sf mt6895/$(notdir $@) $@

ALL_DEFAULT_INSTALLED_MODULES += $(MT6895_SYMLINK)

endif
