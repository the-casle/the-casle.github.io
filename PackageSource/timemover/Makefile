include $(THEOS)/makefiles/common.mk

TWEAK_NAME = TimeMover
TimeMover_FILES = Tweak.xm
TimeMover_EXTRA_FRAMEWORKS += Cephei CepheiPrefs

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
SUBPROJECTS += timemoverpreferences
include $(THEOS_MAKE_PATH)/aggregate.mk
