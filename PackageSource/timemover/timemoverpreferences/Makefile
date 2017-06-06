include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = TimeMoverPreferences
TimeMoverPreferences_FILES = NZ9RootListController.m
TimeMoverPreferences_INSTALL_PATH = /Library/PreferenceBundles
TimeMoverPreferences_FRAMEWORKS = UIKit
TimeMoverPreferences_PRIVATE_FRAMEWORKS = Preferences
TimeMoverPreferences_EXTRA_FRAMEWORKS += Cephei, CepheiPrefs



include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/TimeMoverPreferences.plist$(ECHO_END)
