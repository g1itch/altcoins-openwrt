#
# Copyright (C) 2018 Dmitri Bogomolov
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=python-prctl
PKG_VERSION:=1.7
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_HASH:=57ebd556616d6ffe1f794f514680e84a03737cb070de37722198d7ad6c8f4fda
PKG_SOURCE_URL:=https://pypi.python.org/packages/7a/90/61935e2530a76f41e9e4f8ba0fe073d4ad0a3e16c4953156253f939fb057/
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)

PKG_MAINTAINER:=Dmitri Bogomolov <4glitch@gmail.com>
PKG_LICENSE:=GPL


include $(INCLUDE_DIR)/package.mk
include $(TOPDIR)/feeds/packages/lang/python/python-package.mk

define Package/python-prctl
  SUBMENU:=Python
  SECTION:=lang
  CATEGORY:=Languages
  TITLE:=Python(ic) interface to the linux prctl syscall
  URL:=http://github.com/seveas/python-prctl
  DEPENDS:=+python +libcap
endef

define Build/Compile
	$(call Build/Compile/PyMod,,\
                install --prefix=/usr --root="$(PKG_INSTALL_DIR)" \
        )
endef

define Package/python-prctl/install
	$(INSTALL_DIR) $(1)$(PYTHON_PKG_DIR)
	$(CP) \
	    $(PKG_INSTALL_DIR)$(PYTHON_PKG_DIR)/* \
	    $(1)$(PYTHON_PKG_DIR)
endef

$(eval $(call BuildPackage,python-prctl))
