ARCHS = armv7 arm64
PACKAGE_VERSION = $

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = SearchBar
SearchBar_FILES = Tweak.xm
SearchBar_FRAMEWORKS = UIKit

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
