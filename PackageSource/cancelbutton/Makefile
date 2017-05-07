ARCHS = armv7 arm64

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = cancelbutton
cancelbutton_FILES = Tweak.xm
cancelbutton_FRAMEWORKS = UIKit

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
SUBPROJECTS += cancelbuttonpref
include $(THEOS_MAKE_PATH)/aggregate.mk
