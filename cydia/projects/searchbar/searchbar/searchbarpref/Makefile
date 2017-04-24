include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = searchbarpref
searchbarpref_FILES = XXXRootListController.m
searchbarpref_INSTALL_PATH = /Library/PreferenceBundles
searchbarpref_FRAMEWORKS = UIKit
searchbarpref_PRIVATE_FRAMEWORKS = Preferences

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/searchbarpref.plist$(ECHO_END)
