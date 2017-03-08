include $(THEOS)/makefiles/common.mk

TWEAK_NAME = BuildThatWall
BuildThatWall_FILES = Tweak.xm

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 Preferences"
SUBPROJECTS += buildthatwallimages
include $(THEOS_MAKE_PATH)/aggregate.mk
