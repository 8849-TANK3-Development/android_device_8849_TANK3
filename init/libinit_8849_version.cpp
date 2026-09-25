/*
 * Copyright (C) 2026 The SparkOS Project
 *
 * SPDX-License-Identifier: Apache-2.0
 */

#include <libinit_8849_version.h>

#include <android-base/file.h>
#include <android-base/logging.h>
#include <android-base/strings.h>

using android::base::ReadFileToString;
using android::base::Trim;

constexpr const char* kProjector = "/sys/bus/spi/drivers/fpga_spi/projector_name";

int32_t ReadProjector() {
    std::string buf;
    if (ReadFileToString(kProjector, &buf)) {
        return std::stoi(Trim(buf));
    }
    return -1;
}
