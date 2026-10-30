#!/vendor/bin/sh
#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

# Both light/proximity sensor variants are present in the sensors registry,
# only the factory calibrated one has its ALS scale version bumped.
REGISTRY=/mnt/vendor/persist/sensors/registry/registry

for sensor in hx32062secr stk3a5x; do
    if grep -q '"scale":{[^}]*"ver":"[1-9]' ${REGISTRY}/${sensor}*_platform.als.fac_cal; then
        setprop ro.vendor.sensors.proximity ${sensor}
        break
    fi
done
