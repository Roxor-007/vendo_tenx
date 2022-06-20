PRODUCT_VERSION_MAJOR = 1
PRODUCT_VERSION_MINOR = 1

ifeq ($(TENX_VERSION_APPEND_TIME_OF_DAY),true)
    TENX_BUILD_DATE := $(shell date -u +%Y%m%d_%H%M%S)
else
    TENX_BUILD_DATE := $(shell date -u +%Y%m%d)
endif

# Set TENX_BUILDTYPE from the env RELEASE_TYPE, for jenkins compat

ifndef TENX_BUILDTYPE
    ifdef RELEASE_TYPE
        # Starting with "TENX_" is optional
        RELEASE_TYPE := $(shell echo $(RELEASE_TYPE) | sed -e 's|^TENX_||g')
        TENX_BUILDTYPE := $(RELEASE_TYPE)
    endif
endif

# Filter out random types, so it'll reset to UNOFFICIAL
ifeq ($(filter RELEASE NIGHTLY SNAPSHOT EXPERIMENTAL,$(TENX_BUILDTYPE)),)
    TENX_BUILDTYPE := UNOFFICIAL
    TENX_EXTRAVERSION :=
endif

ifeq ($(TENX_BUILDTYPE), UNOFFICIAL)
    ifneq ($(TARGET_UNOFFICIAL_BUILD_ID),)
        TENX_EXTRAVERSION := -$(TARGET_UNOFFICIAL_BUILD_ID)
    endif
endif

TENX_VERSION_SUFFIX := $(TENX_BUILD_DATE)-$(TENX_BUILDTYPE)$(TENX_EXTRAVERSION)-$(TENX_BUILD)

# Internal version
TENX_VERSION := $(PRODUCT_VERSION_MAJOR).$(PRODUCT_VERSION_MINOR)-$(TENX_VERSION_SUFFIX)

# Display version
TENX_DISPLAY_VERSION := $(PRODUCT_VERSION_MAJOR)-$(TENX_VERSION_SUFFIX)
