# GuardTalk flags must load before product-common so we can skip telephony inherits.
$(call inherit-product-if-exists, vendor/guardtalk/device/tokay/guardtalk-flags.mk)

ifneq ($(GUARDTALK_RADIO_EXCISED),)
$(call inherit-product, vendor/guardtalk/device/tokay/product-common-excised.mk)
else
$(call inherit-product, vendor/adevtool/config/mk/google_devices/platform/zumapro/product-common.mk)
endif

TARGET_KERNEL_DIR ?= $(RELEASE_KERNEL_TOKAY_DIR)
TARGET_BOARD_KERNEL_HEADERS ?= $(RELEASE_KERNEL_TOKAY_DIR)/kernel-headers

include vendor/adevtool/config/mk/google_devices/platform/zumapro/device.mk

$(call inherit-product-if-exists, vendor/guardtalk/device/tokay/guardtalk-tokay.mk)
