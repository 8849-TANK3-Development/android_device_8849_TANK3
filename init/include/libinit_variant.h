/*
 * Copyright (C) 2026 The SparkOS Project
 *
 * SPDX-License-Identifier: Apache-2.0
 */

#pragma once

#include <string>

typedef struct variant_info {
    std::string brand;
    std::string device;
    std::string model;
    std::string build_fingerprint;
    std::string build_description;
} variant_info_t;

void set_variant_props(const variant_info_t variant);
