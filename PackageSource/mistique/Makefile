include $(THEOS)/makefiles/common.mk

TWEAK_NAME = Mistique
Mistique_FILES = Tweak.xm
Mistique_FRAMEWORKS = UIKit

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
