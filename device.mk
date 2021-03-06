### PLATFORM
$(call inherit-product, device/sony/yoshino-common/platform.mk)
### PROPRIETARY VENDOR FILES
$(call inherit-product, vendor/sony/poplar/poplar-vendor.mk)

### DALVIK
$(call inherit-product, frameworks/native/build/phone-xhdpi-4096-dalvik-heap.mk)

DEVICE_PATH := device/sony/poplar

# Device uses high-density artwork where available
PRODUCT_AAPT_CONFIG := normal hdpi xhdpi
PRODUCT_AAPT_PREF_CONFIG := xhdpi

DEVICE_PACKAGE_OVERLAYS += \
    $(DEVICE_PATH)/overlay \
    $(DEVICE_PATH)/overlay-nad

ifeq ($(WITH_TWRP),true)
include $(DEVICE_PATH)/device/init.mk
else # WITH_TWRP
include $(DEVICE_PATH)/device/*.mk
include $(DEVICE_PATH)/vendor_prop.mk
endif # WITH_TWRP
