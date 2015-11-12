#
# Copyright (C) 2015 Dmitri Bogomolov
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=potcoind
PKG_VERSION:=0.8.7.2
PKG_RELEASE:=1
PKG_LICENSE:=MIT
PKG_MAINTAINER:=Dmitri Bogomolov <4glitch@gmail.com>

PKG_USE_MIPS16:=0

PROJ_NAME:=potcoin
PROJ_COMMIT:=5c2b9dac24344c96c18a049d8a7b116946de7edd

PKG_SOURCE:=$(PROJ_COMMIT).zip
PKG_SOURCE_URL:=https://github.com/$(PROJ_NAME)/$(PROJ_NAME)/archive/
PKG_MD5SUM:=00b5216062bd4c430c9773b1b8a47c50
PKG_BUILD_DIR:=$(BUILD_DIR)/Potcoin-$(PROJ_COMMIT)

PKG_CONFIG_DEPENDS:= \
	CONFIG_$(PKG_NAME)_UPNP

include $(INCLUDE_DIR)/package.mk

define Package/$(PKG_NAME)
	SECTION:=net
	CATEGORY:=Network
	SUBMENU:=Cryptocurrency
	TITLE:=POTCoind (PotCoin wallet)
	URL:=http://www.potcoin.com/
	DEPENDS:=+libopenssl +libdb48xx +leveldb \
		+boost-system +boost-thread \
		+boost-filesystem +boost-program_options \
		+$(PKG_NAME)_UPNP:miniupnpc
endef

define Package/$(PKG_NAME)/description
	PotCoin crypto-currency p2p network daemon
endef

define Package/$(PKG_NAME)/conffiles
	/etc/$(PROJ_NAME)/$(PROJ_NAME).conf
	/etc/config/$(PKG_NAME)
endef

define Package/$(PKG_NAME)/config
	if PACKAGE_$(PKG_NAME)
		config $(PKG_NAME)_UPNP
			bool "Enable support for UPNP"
			default n
	endif
endef

TARGET_CONFIGURE_OPTS += \
	USE_SYSTEM_LEVELDB=1 \
	BDB_LIB_SUFFIX=-4.8 \
	USE_UPNP=$(if $(CONFIG_$(PKG_NAME)_UPNP),1,-)


ifneq ($(CONFIG_IPV6),y)
	TARGET_CONFIGURE_OPTS += USE_IPV6=-
endif

MAKE_PATH = src
MAKE_FLAGS += -f makefile.unix

Build/Compile=$(call Build/Compile/Default,$(PKG_NAME))

define Package/$(PKG_NAME)/install
	$(INSTALL_DIR) $(1)/usr/bin $(1)/etc/init.d \
		$(1)/etc/$(PROJ_NAME) $(1)/etc/config
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/src/$(PKG_NAME) $(1)/usr/bin
	$(INSTALL_BIN) ./files/$(PKG_NAME).init $(1)/etc/init.d/$(PKG_NAME)
	$(INSTALL_CONF) ./files/$(PROJ_NAME).conf $(1)/etc/$(PROJ_NAME)/
	$(INSTALL_CONF) ./files/$(PKG_NAME).config $(1)/etc/config/$(PKG_NAME)
endef

$(eval $(call BuildPackage,$(PKG_NAME)))
