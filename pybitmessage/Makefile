#
# Copyright (C) 2018 Dmitri Bogomolov
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk
include $(INCLUDE_DIR)/uclibc++.mk

PKG_NAME:=pybitmessage
PKG_VERSION:=0.6.3.2
PKG_RELEASE:=5

PKG_COMMIT:=55d6239e3d5763d7569096818250b7c8a81fc00b
PKG_SOURCE:=$(PKG_COMMIT).tar.gz
PKG_HASH:=5294d5b50995eaa90c8d8d57a724ee52427c749658003bd6b8164fe3cc5c94d6
PKG_SOURCE_URL:=https://github.com/Bitmessage/pybitmessage/archive/
PKG_BUILD_DIR:=$(BUILD_DIR)/PyBitmessage-$(PKG_COMMIT)

PKG_MAINTAINER:=Dmitri Bogomolov <4glitch@gmail.com>
PKG_LICENSE:=MIT


include $(INCLUDE_DIR)/package.mk
include $(TOPDIR)/feeds/packages/lang/python/python-package.mk

define Package/pybitmessage
  SECTION:=net
  CATEGORY:=Network
  SUBMENU:=Instant Messaging
  TITLE:=Reference client for Bitmessage: a P2P communications protocol
  URL:=https://bitmessage.org
  DEPENDS:=+libstdcpp +python +python-openssl +python-ctypes +python-setuptools
endef

define Package/pybitmessage/description
	PyBitmessage daemon package for RPI
endef

define Package/pybitmessage/conffiles
	/etc/config/$(PKG_NAME)
endef

define Build/Compile
# rm -rf $(PKG_BUILD_DIR)/src/bitmessageqt \
# 	$(PKG_BUILD_DIR)/src/bitmessagecurses
	$(call PyBuild/Compile)
endef

define Package/pybitmessage/install
	$(INSTALL_DIR) $(1)$(PYTHON_PKG_DIR)
	$(INSTALL_DIR) $(1)/usr/bin $(1)/etc/init.d $(1)/etc/config
	$(CP) \
	    $(PKG_INSTALL_DIR)$(PYTHON_PKG_DIR)/* \
	    $(1)$(PYTHON_PKG_DIR)
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/$(PKG_NAME) $(1)/usr/bin
	$(INSTALL_BIN) ./files/$(PKG_NAME).init $(1)/etc/init.d/bitmessaged
	$(INSTALL_CONF) ./files/$(PKG_NAME).config $(1)/etc/config/$(PKG_NAME)
endef

$(eval $(call BuildPackage,pybitmessage))
