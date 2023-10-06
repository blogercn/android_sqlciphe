LOCAL_PATH := $(call my-dir)
APP_ABI := armeabi-v7a arm64-v8a x86 x86_64

APP_PLATFORM := android-26

APP_STL := c++_shared

APP_CPPFLAGS := -frtti -fexceptions

APP_BUILD_SCRIPT := $(LOCAL_PATH)/Android.mk

APP_ALLOW_MISSING_DEPS=true
