TARGET := iphone:clang:latest:5.0
ARCHS := armv7 armv7s arm64

include theos/makefiles/common.mk

TOOL_NAME = uninstall
uninstall_FILES = uninstall.m
uninstall_PRIVATE_FRAMEWORKS = MobileInstallation
uninstall_CODESIGN_FLAGS = -SEntitlements.plist

include $(THEOS_MAKE_PATH)/tool.mk
