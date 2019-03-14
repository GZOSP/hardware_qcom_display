LOCAL_PATH := $(call my-dir)
include $(LOCAL_PATH)/../common.mk
include $(CLEAR_VARS)

LOCAL_MODULE                  := libqdutils
LOCAL_MODULE_TAGS             := optional
LOCAL_SHARED_LIBRARIES        := $(common_libs) libui libbinder libqservice
LOCAL_C_INCLUDES              := $(common_includes) $(kernel_includes)
LOCAL_CFLAGS                  := $(common_flags) -DLOG_TAG=\"qdutils\" -Wno-sign-conversion -Wno-float-conversion
LOCAL_ADDITIONAL_DEPENDENCIES := $(common_deps)
#LOCAL_COPY_HEADERS_TO         := $(common_header_export_path)
#LOCAL_COPY_HEADERS            := display_config.h mdp_version.h
LOCAL_SRC_FILES               := profiler.cpp mdp_version.cpp \
                                 idle_invalidator.cpp \
                                 comptype.cpp qd_utils.cpp \
                                 cb_utils.cpp display_config.cpp \
                                 cb_swap_rect.cpp
LOCAL_C_INCLUDES              += ${LOCAL_PATH}/includes/libqdutils
LOCAL_EXPORT_C_INCLUDES       := $(LOCAL_PATH)/includes
include $(BUILD_SHARED_LIBRARY)

include $(CLEAR_VARS)


LOCAL_SHARED_LIBRARIES          := liblog libcutils
LOCAL_C_INCLUDES                := $(common_includes)
LOCAL_ADDITIONAL_DEPENDENCIES   := $(common_deps)
LOCAL_SRC_FILES                 := qdMetaData.cpp
LOCAL_CFLAGS                    := $(common_flags)
LOCAL_CFLAGS                    += -DLOG_TAG=\"DisplayMetaData\" -Wno-sign-conversion
LOCAL_MODULE_TAGS               := optional
LOCAL_MODULE                    := libqdMetaData
LOCAL_C_INCLUDES              += ${LOCAL_PATH}/includes/libqdutils
LOCAL_EXPORT_C_INCLUDES       := $(LOCAL_PATH)/includes
include $(BUILD_SHARED_LIBRARY)

