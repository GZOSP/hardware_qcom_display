#Common headers
common_includes := $(LOCAL_PATH)/../libgralloc
common_includes += $(LOCAL_PATH)/../liboverlay
common_includes += $(LOCAL_PATH)/../libcopybit
common_includes += $(LOCAL_PATH)/../libqdutils
common_includes += $(LOCAL_PATH)/../libhwcomposer
common_includes += $(LOCAL_PATH)/../libhdmi
common_includes += $(LOCAL_PATH)/../libqservice

common_header_export_path := qcom/display

#Common libraries external to display HAL
common_libs := liblog libutils libcutils libhardware

#Common C flags
common_flags := -DDEBUG_CALC_FPS -Wno-missing-field-initializers
common_flags += -Wconversion -Wall -Werror -Wno-sign-conversion

ifeq ($(TARGET_USES_POST_PROCESSING),true)
    common_flags     += -DUSES_POST_PROCESSING
    common_includes  += $(TARGET_OUT_HEADERS)/pp/inc
endif

ifeq ($(ARCH_ARM_HAVE_NEON),true)
    common_flags += -D__ARM_HAVE_NEON
endif

common_flags += -DVENUS_COLOR_FORMAT
common_flags += -DMDSS_TARGET

ifeq ($(DISPLAY_DEBUG_SWAPINTERVAL),true)
    common_flags += -DDEBUG_SWAPINTERVAL
endif

common_flags += -D__STDC_FORMAT_MACROS

# Executed only on QCOM BSPs
ifeq ($(TARGET_USES_QCOM_BSP),true)
# Enable QCOM Display features
    common_flags += -DQCOM_BSP
endif
ifneq ($(call is-platform-sdk-version-at-least,18),true)
    common_flags += -DANDROID_JELLYBEAN_MR1=1
endif
