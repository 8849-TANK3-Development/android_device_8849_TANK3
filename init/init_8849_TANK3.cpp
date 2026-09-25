/*
 * Copyright (C) 2026 The SparkOS Project
 *
 * SPDX-License-Identifier: Apache-2.0
 */

#include <libinit_dalvik_heap.h>
#include <libinit_8849_version.h>
#include <libinit_utils.h>
#include <libinit_variant.h>

#include "vendor_init.h"

#include <android-base/file.h>
#include <android-base/logging.h>

using android::base::ReadFileToString;

static const variant_info_t tank3_pro_info = {
    .brand = "8849",
    .device = "TANK3",
    .model = "TANK 3 PRO",
    .build_fingerprint = "8849/TANK3/TANK3:12/SP1A.210812.016/root.20240418.110955:user/release-keys",
    .build_description = "TANK3-user 13 TP1A.220624.014 root.20240418.114127 release-keys",
};

static void determine_pro_device() {
    if (ReadProjector() == dlp343x) {
        set_variant_props(tank3_pro_info);
    } else {
        // Not support SmallElephant
        LOG(ERROR) << "Not support SmallElephant";
    }
}

void vendor_load_properties() {
    determine_pro_device();
    set_dalvik_heap();
}
