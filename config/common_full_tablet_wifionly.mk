# Inherit full common Lineage stuff
$(call inherit-product, vendor/tenx/config/common_full.mk)

# Required packages
PRODUCT_PACKAGES += \
    androidx.window.extensions \
    LatinIME

# Include Lineage LatinIME dictionaries
PRODUCT_PACKAGE_OVERLAYS += vendor/tenx/overlay/dictionaries
