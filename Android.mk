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

AUDIO_PRIMARY_SYMLINK := $(TARGET_OUT_VENDOR)/lib/hw/audio.primary.mt6895.so
AUDIO_PRIMARY_SYMLINK += $(TARGET_OUT_VENDOR)/lib64/hw/audio.primary.mt6895.so
$(AUDIO_PRIMARY_SYMLINK): $(LOCAL_INSTALLED_MODULE)
	@mkdir -p $(dir $@)
	$(hide) ln -sf audio.primary.mediatek.so $@

ALL_DEFAULT_INSTALLED_MODULES += $(AUDIO_PRIMARY_SYMLINK)

AUDIO_R_SUBMIX_SYMLINK := $(TARGET_OUT_VENDOR)/lib/hw/audio.r_submix.mt6895.so
AUDIO_R_SUBMIX_SYMLINK += $(TARGET_OUT_VENDOR)/lib64/hw/audio.r_submix.mt6895.so
$(AUDIO_R_SUBMIX_SYMLINK): $(LOCAL_INSTALLED_MODULE)
	@mkdir -p $(dir $@)
	$(hide) ln -sf audio.r_submix.mediatek.so $@

ALL_DEFAULT_INSTALLED_MODULES += $(AUDIO_R_SUBMIX_SYMLINK)

MT6895_LIBS := android.hardware.graphics.allocator@4.0-impl-mediatek.so android.hardware.graphics.mapper@4.0-impl-mediatek.so gralloc.common.so vendor.mediatek.hardware.pq@2.15-impl.so vulkan.mali.so arm.graphics-V1-ndk_platform.so libaalservice.so libaal_cust_func.so libaiselector.so libdpframework.so libmtk_drvb.so libnir_neon_driver.so libpqparamparser.so libpqpconfig.so
MT6895_SYMLINK := $(addprefix $(TARGET_OUT_VENDOR)/lib/,$(notdir $(MT6895_LIBS)))
MT6895_SYMLINK += $(addprefix $(TARGET_OUT_VENDOR)/lib64/,$(notdir $(MT6895_LIBS)))
$(MT6895_SYMLINK): $(LOCAL_INSTALLED_MODULE)
	@mkdir -p $(dir $@)
	$(hide) ln -sf mt6895/$(notdir $@) $@

ALL_DEFAULT_INSTALLED_MODULES += $(MT6895_SYMLINK)

endif
