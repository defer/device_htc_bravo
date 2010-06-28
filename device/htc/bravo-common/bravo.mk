#
# Copyright (C) 2009 The Android Open Source Project
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

PRODUCT_PROPERTY_OVERRIDES :=
    ro.media.dec.jpeg.memcap=20000000

DEVICE_PACKAGE_OVERLAYS := device/htc/bravo-common/overlay

PRODUCT_COPY_FILES := \
    frameworks/base/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/base/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/base/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/base/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/base/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/base/data/etc/android.hardware.touchscreen.multitouch.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.xml

# media config xml file
PRODUCT_COPY_FILES += \
    device/htc/bravo-common/media_profiles.xml:system/etc/media_profiles.xml

PRODUCT_PACKAGES := \
    sensors.bravo \
    lights.bravo \
    librs_jni

# we have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise

# Bravo uses high-density artwork where available
PRODUCT_LOCALES := hdpi

PRODUCT_COPY_FILES += \
    device/htc/bravo-common/bravo-keypad.kl:system/usr/keylayout/bravo-keypad.kl \
    device/htc/bravo-common/h2w_headset.kl:system/usr/keylayout/h2w_headset.kl \
    device/htc/bravo-common/vold.fstab:system/etc/vold.fstab


PRODUCT_COPY_FILES += \
    device/htc/bravo-common/bcm4329.ko:system/lib/modules/bcm4329.ko \
    device/htc/bravo-common/nf_nat_h323.ko:system/lib/modules/nf_nat_h323.ko \
    device/htc/bravo-common/tunnel4.ko:system/lib/modules/tunnel4.ko \
    device/htc/bravo-common/ah6.ko:system/lib/modules/ah6.ko \
    device/htc/bravo-common/esp6.ko:system/lib/modules/esp6.ko \
    device/htc/bravo-common/ip6_tunnel.ko:system/lib/modules/ip6_tunnel.ko \
    device/htc/bravo-common/ipcomp6.ko:system/lib/modules/ipcomp6.ko \
    device/htc/bravo-common/ipv6.ko:system/lib/modules/ipv6.ko \
    device/htc/bravo-common/mip6.ko:system/lib/modules/mip6.ko \
    device/htc/bravo-common/sit.ko:system/lib/modules/sit.ko \
    device/htc/bravo-common/tunnel6.ko:system/lib/modules/tunnel6.ko \
    device/htc/bravo-common/xfrm6_mode_beet.ko:system/lib/modules/xfrm6_mode_beet.ko \
    device/htc/bravo-common/xfrm6_mode_transport.ko:system/lib/modules/xfrm6_mode_transport.ko \
    device/htc/bravo-common/xfrm6_mode_tunnel.ko:system/lib/modules/xfrm6_mode_tunnel.ko \
    device/htc/bravo-common/xfrm6_tunnel.ko:system/lib/modules/xfrm6_tunnel.ko \
    device/htc/bravo-common/nf_conntrack_h323.ko:system/lib/modules/nf_conntrack_h323.ko \
    device/htc/bravo-common/xfrm_ipcomp.ko:system/lib/modules/xfrm_ipcomp.ko \

ifeq ($(TARGET_PREBUILT_KERNEL),)
LOCAL_KERNEL := device/htc/bravo-common/kernel
else
LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

$(call inherit-product-if-exists, vendor/htc/bravo-common/bravo-vendor.mk)

# stuff common to all HTC phones
$(call inherit-product, device/htc/common/common.mk)

