# Android-Freeciv - Copyright (C) 2010 - C Vaughn
#   This program is free software; you can redistribute it and/or modify
#   it under the terms of the GNU General Public License as published by
#   the Free Software Foundation; either version 2, or (at your option)
#   any later version.
#
#   This program is distributed in the hope that it will be useful,
#   but WITHOUT ANY WARRANTY; without even the implied warranty of
#   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#   GNU General Public License for more details.

LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE := server

CG_SUBDIRS := \
. \
generator \
scripting \
javaharness \


LOCAL_SRC_FILES += $(foreach F, $(CG_SUBDIRS), $(addprefix $(F)/,$(notdir $(wildcard $(LOCAL_PATH)/$(F)/*.c))))

LOCAL_CFLAGS :=	-I$(LOCAL_PATH)/../ai \
				-I$(LOCAL_PATH)/../common \
				-I$(LOCAL_PATH)/../utility \
				-I$(LOCAL_PATH)/../common/aicore \
				-I$(LOCAL_PATH)/../server \
				-I$(LOCAL_PATH)/../server/generator \
				-I$(LOCAL_PATH)/../server/scripting \
				-I$(LOCAL_PATH)/../include \
				-I$(LOCAL_PATH)/../../tolua-5.1/include \
				-I$(LOCAL_PATH)/../../lua-5.1/src \
				-DHAVE_NETINET_IN_H \
				-DHAVE_SYS_SELECT_H \
				-DHAVE_SYS_SOCKET_H \
				-DHAVE_SYS_TIME_H \
				-DHAVE_SYS_TYPES_H \
				-DHAVE_UNISTD_H	\
				-DHAVE_SOCKLEN_T \
                -DHAVE_CONFIG_H \
                -DHAVE_ARPA_INET_H \
                -DHAVE_NETDB_H \
                -DHAVE_PWD_H \
                -DHAVE_SYS_UIO_H \
                -DHAVE_SYS_UTSNAME_H \
                -DHAVE_GETTIMEOFDAY \
                -DHAVE_LIBZ
                								

LOCAL_STATIC_LIBRARIES := lua tolua ai common utility

LOCAL_LDLIBS := -lz -llog

include $(BUILD_SHARED_LIBRARY)