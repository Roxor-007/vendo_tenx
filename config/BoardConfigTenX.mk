include vendor/tenx/config/BoardConfigKernel.mk

ifeq ($(BOARD_USES_QCOM_HARDWARE),true)
include vendor/tenx/config/BoardConfigQcom.mk
endif

include vendor/tenx/config/BoardConfigSoong.mk
