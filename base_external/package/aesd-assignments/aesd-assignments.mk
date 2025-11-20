
##############################################################
#
# AESD-ASSIGNMENTS
#
##############################################################

#TODO: Fill up the contents below in order to reference your assignment 3 git contents
AESD_ASSIGNMENTS_VERSION = cfa8f5f
# Note: Be sure to reference the *ssh* repository URL here (not https) to work properly
# with ssh keys and the automated build/test system.
# Your site should start with git@github.com:
AESD_ASSIGNMENTS_SITE = git@github.com:cu-ecen-aeld/assignments-3-and-later-FreeSpirit9009.git
AESD_ASSIGNMENTS_SITE_METHOD = git
AESD_ASSIGNMENTS_GIT_SUBMODULES = YES

#AESD_ASSIGNMENTS_VERSION = local
#AESD_ASSIGNMENTS_SITE = /home/georg/dev/training/aesd-assignments
#AESD_ASSIGNMENTS_SITE_METHOD = local

#AESD_ASSIGNMENTS_INSTALL_TARGET = YES


define AESD_ASSIGNMENTS_BUILD_CMDS
	echo "Building writer in finder-app..."
	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/finder-app all
endef

# TODO add your writer, finder and finder-test utilities/scripts to the installation steps below
define AESD_ASSIGNMENTS_INSTALL_TARGET_CMDS
    # Leave config install as-is
    $(INSTALL) -d 0755 $(TARGET_DIR)/etc/finder-app/conf/
    $(INSTALL) -m 0644 $(@D)/conf/* $(TARGET_DIR)/etc/finder-app/conf/

    # Add missing scripts and binary
    $(INSTALL) -D -m 0755 $(@D)/finder-app/finder-test.sh $(TARGET_DIR)/usr/bin/finder-test.sh
    $(INSTALL) -D -m 0755 $(@D)/finder-app/finder.sh $(TARGET_DIR)/usr/bin/finder.sh
    $(INSTALL) -D -m 0755 $(@D)/finder-app/writer $(TARGET_DIR)/usr/bin/writer
endef

$(eval $(generic-package))
