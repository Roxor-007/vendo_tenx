# Build fingerprint
ifneq ($(BUILD_FINGERPRINT),)
ADDITIONAL_SYSTEM_PROPERTIES += \
    ro.build.fingerprint=$(BUILD_FINGERPRINT)
endif

# LineageOS System Version
ADDITIONAL_SYSTEM_PROPERTIES += \
    ro.tenx.version=$(TENX_VERSION) \
    ro.tenx.releasetype=$(TENX_BUILDTYPE) \
    ro.tenx.build.version=$(PRODUCT_VERSION_MAJOR).$(PRODUCT_VERSION_MINOR) \
    ro.modversion=$(TENX_VERSION)

# LineageOS Platform Display Version
ADDITIONAL_SYSTEM_PROPERTIES += \
    ro.tenx.display.version=$(TENX_DISPLAY_VERSION)

