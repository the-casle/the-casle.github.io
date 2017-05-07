include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = cancelbuttonpref
cancelbuttonpref_FILES = XXXRootListController.m
cancelbuttonpref_INSTALL_PATH = /Library/PreferenceBundles
cancelbuttonpref_FRAMEWORKS = UIKit
cancelbuttonpref_PRIVATE_FRAMEWORKS = Preferences

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/cancelbuttonpref.plist$(ECHO_END)
