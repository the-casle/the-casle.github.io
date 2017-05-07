include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = ccdarkprefs
ccdarkprefs_FILES = XXXRootListController.m
ccdarkprefs_INSTALL_PATH = /Library/PreferenceBundles
ccdarkprefs_FRAMEWORKS = UIKit
ccdarkprefs_PRIVATE_FRAMEWORKS = Preferences

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/ccdarkprefs.plist$(ECHO_END)
