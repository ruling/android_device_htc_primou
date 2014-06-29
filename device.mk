# common msm7x30 configs
$(call inherit-product, device/htc/msm7x30-common/msm7x30.mk)

# Ramdisk
PRODUCT_COPY_FILES += \
    device/htc/primou/ramdisk/default.prop:root/default.prop \
    device/htc/primou/ramdisk/init.primou.rc:root/init.primou.rc \
    device/htc/primou/ramdisk/ueventd.primou.rc:root/ueventd.primou.rc \
    device/htc/primou/ramdisk/fstab.primou:root/fstab.primou

# Vendor
$(call inherit-product-if-exists, vendor/htc/primou/primou-vendor.mk)

# Misc. property overrides
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.locationfeatures=1 \
    ro.com.google.networklocation=1 \
    ro.com.google.gmsversion=2.3_r3 \
    dalvik.vm.lockprof.threshold=500 \
    dalvik.vm.dexopt-flags=m=y \
    ro.sf.lcd_density=240 \
    dalvik.vm.debug.alloc=0 \
    ro.vold.umsdirtyratio=20 \
    ro.config.low_ram=true \
    dalvik.vm.jit.codecachesize=0 \
    ro.zram.default=0 \
    debug.sf.hw=1 \
    debug.sf.no_hw_vsync=1 \
    ro.config.hw_fast_dormancy=1
	
PRODUCT_PROPERTY_OVERRIDES += \
    media.a1026.nsForVoiceRec=0 \
    media.a1026.enableA1026=0 \
    htc.audio.alt.enable=0 \
    htc.audio.hac.enable=1

DEVICE_PACKAGE_OVERLAYS += device/htc/primou/overlay

# GPS / BT / Lights / Sensors
PRODUCT_PACKAGES += \
    libbt-vendor \
    gps.primou \
    librpc \
    lights.primou \
    sensors.primou

# CFX Packages
PRODUCT_PACKAGES += \
    Torch \
    FileManager \
    e2fsck

# Input device config
PRODUCT_COPY_FILES += \
    device/htc/primou/idc/atmel-touchscreen.idc:system/usr/idc/atmel-touchscreen.idc \
    device/htc/primou/idc/primou-keypad.idc:system/usr/idc/primou-keypad.idc \
    device/htc/primou/idc/qwerty.idc:system/usr/idc/qwerty.idc \
    device/htc/primou/idc/qwerty2.idc:system/usr/idc/qwerty2.idc \
    device/htc/primou/idc/synaptics-rmi-touchscreen.idc:system/usr/idc/synaptics-rmi-touchscreen.idc

# Keylayouts and keychars
PRODUCT_COPY_FILES += \
    device/htc/primou/keylayout/keychars/Generic.kcm:system/usr/keychars/Generic.kcm \
    device/htc/primou/keylayout/keychars/qwerty.kcm:system/usr/keychars/qwerty.kcm \
    device/htc/primou/keylayout/keychars/qwerty2.kcm:system/usr/keychars/qwerty2.kcm \
    device/htc/primou/keylayout/keychars/Virtual.kcm:system/usr/keychars/Virtual.kcm \
    device/htc/primou/keylayout/keylayout/atmel-touchscreen.kl:system/usr/keylayout/atmel-touchscreen.kl \
    device/htc/primou/keylayout/keylayout/AVRCP.kl:system/usr/keylayout/AVRCP.kl \
    device/htc/primou/keylayout/keylayout/h2w_headset.kl:system/usr/keylayout/h2w_headset.kl \
    device/htc/primou/keylayout/keylayout/primou-keypad.kl:system/usr/keylayout/primou-keypad.kl \
    device/htc/primou/keylayout/keylayout/qwerty.kl:system/usr/keylayout/qwerty.kl \
    device/htc/primou/keylayout/keylayout/synaptics-rmi-touchscreen.kl:system/usr/keylayout/synaptics-rmi-touchscreen.kl

# ACDB
PRODUCT_COPY_FILES += \
    device/htc/primou/configs/default.acdb:system/etc/firmware/default.acdb \
    device/htc/primou/configs/default_org.acdb:system/etc/firmware/default_org.acdb \
    device/htc/primou/configs/default_org_wb.acdb:system/etc/firmware/default_org_wb.acdb

# Audio DSP Profiles
PRODUCT_COPY_FILES += \
    device/htc/primou/dsp/AdieHWCodec.csv:system/etc/AdieHWCodec.csv \
    device/htc/primou/dsp/AIC3254_REG.csv:system/etc/AIC3254_REG.csv \
    device/htc/primou/dsp/AudioBTID.csv:system/etc/AudioBTID.csv \
    device/htc/primou/dsp/CodecDSPID.txt:system/etc/CodecDSPID.txt \
    device/htc/primou/dsp/TPA2051_CFG.csv:system/etc/TPA2051_CFG.csv 
	
# Inherit qcom proprietary blobs
$(call inherit-product, vendor/qcom/proprietary/qcom-vendor.mk)

$(call inherit-product-if-exists, hardware/broadcom/wlan/bcmdhd/firmware/bcm4330/device-bcm.mk)

# BCM4330 firmware
PRODUCT_COPY_FILES += \
    device/htc/primou/firmware/bcm4330.hcd:system/etc/firmware/bcm4330.hcd \
    device/htc/primou/firmware/fw_bcm4330_apsta_b1.bin:system/etc/firmware/fw_bcm4330_apsta_b1.bin \
    device/htc/primou/firmware/fw_bcm4330_apsta_b2.bin:system/etc/firmware/fw_bcm4330_apsta_b2.bin \
    device/htc/primou/firmware/fw_bcm4330_b2.bin:system/etc/firmware/fw_bcm4330_b2.bin \
    device/htc/primou/firmware/fw_bcm4330_b1.bin:system/etc/firmware/fw_bcm4330_b1.bin \
    device/htc/primou/firmware/fw_bcm4330_p2p_b2.bin:system/etc/firmware/fw_bcm4330_p2p_b2.bin \
    device/htc/primou/firmware/fw_bcm4330_p2p_b1.bin:system/etc/firmware/fw_bcm4330_p2p_b1.bin \
    device/htc/primou/firmware/calibration:system/etc/calibration

$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)
$(call inherit-product, frameworks/native/build/phone-hdpi-512-dalvik-heap.mk)
