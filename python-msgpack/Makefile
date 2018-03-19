#
# Copyright (C) 2018 Dmitri Bogomolov
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=python-msgpack
PKG_VERSION:=0.5.6
PKG_RELEASE:=1

PKG_SOURCE:=msgpack-$(PKG_VERSION).tar.gz
PKG_HASH:=0ee8c8c85aa651be3aa0cd005b5931769eaa658c948ce79428766f1bd46ae2c3
PKG_SOURCE_URL:=https://pypi.python.org/packages/f3/b6/9affbea179c3c03a0eb53515d9ce404809a122f76bee8fc8c6ec9497f51f/
PKG_BUILD_DIR:=$(BUILD_DIR)/msgpack-$(PKG_VERSION)

PKG_MAINTAINER:=Dmitri Bogomolov <4glitch@gmail.com>
PKG_LICENSE:=Apache-2.0


include $(INCLUDE_DIR)/package.mk
include $(TOPDIR)/feeds/packages/lang/python/python-package.mk

define Package/python-msgpack
  SUBMENU:=Python
  SECTION:=lang
  CATEGORY:=Languages
  TITLE:=MessagePack (de)serializer for Python
  URL:=https://github.com/msgpack/msgpack-python
  DEPENDS:=+libstdcpp +python +python-setuptools
endef

define Build/Compile
	$(call Build/Compile/PyMod,,\
                install --prefix=/usr --root="$(PKG_INSTALL_DIR)" \
        )
endef

define Package/python-msgpack/install
	$(INSTALL_DIR) $(1)$(PYTHON_PKG_DIR)
	$(CP) \
	    $(PKG_INSTALL_DIR)$(PYTHON_PKG_DIR)/* \
	    $(1)$(PYTHON_PKG_DIR)
endef

$(eval $(call BuildPackage,python-msgpack))
