include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = buildthatwallimages
buildthatwallimages_INSTALL_PATH = /Library/PreferenceBundles
buildthatwallimages_FRAMEWORKS = UIKit
buildthatwallimages_PRIVATE_FRAMEWORKS = Preferences

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
