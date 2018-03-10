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
PKG_RELEASE:=3

PKG_COMMIT:=0da0c109952025b1132f9b02b0efd37aa2e1278e
PKG_SOURCE:=$(PKG_COMMIT).tar.gz
PKG_HASH:=508c79be6d22c5814c2b32e38f889eed32810a3465c555a2f2bb9e679505e344
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
