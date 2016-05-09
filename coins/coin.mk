#
# Copyright (C) 2016 Dmitri Bogomolov
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

PKG_NAME?=$(COIN_NAME)d
PKG_RELEASE?=1
PKG_LICENSE?=MIT
PKG_MAINTAINER?=Dmitri Bogomolov <4glitch@gmail.com>

PKG_SOURCE_URL?=https://github.com/$(COIN_NAME)/$(COIN_NAME)/archive/

PKG_USE_MIPS16:=0

include $(INCLUDE_DIR)/package.mk

#PKG_CONFIG_DEPENDS:= \
#	CONFIG_$(PKG_NAME)_UPNP

define Package/$(PKG_NAME)
        TITLE:=$(PKG_NAME) ($(COIN_NAME) wallet)
	$(call Package/$(PKG_NAME)/Default)
	SECTION:=net
	CATEGORY:=Network
	SUBMENU:=Cryptocurrency
	DEPENDS+=+libopenssl +libdb48xx \
		+boost-system +boost-thread \
		+boost-filesystem +boost-program_options \
		+$(PKG_NAME)_UPNP:miniupnpc
endef

define Package/$(PKG_NAME)/description
	$(COIN_NAME) crypto-currency p2p network daemon
endef

define Package/$(PKG_NAME)/conffiles
	/etc/coins/$(COIN_NAME).conf
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
	BDB_INCLUDE_PATH=$(STAGING_DIR)/usr/include/db48 \
	USE_UPNP=$(if $(CONFIG_$(PKG_NAME)_UPNP),1,-)


ifneq ($(CONFIG_IPV6),y)
	TARGET_CONFIGURE_OPTS += USE_IPV6=-
endif

MAKE_PATH = src
MAKE_FLAGS += -f makefile.unix

Build/Compile=$(call Build/Compile/Default,$(PKG_NAME))

define Package/$(PKG_NAME)/install
	$(INSTALL_DIR) $(1)/usr/bin $(1)/etc/init.d \
		$(1)/etc/coins $(1)/etc/config
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/src/$(PKG_NAME) $(1)/usr/bin
	$(INSTALL_BIN) ./files/$(PKG_NAME).init $(1)/etc/init.d/$(PKG_NAME)
	$(INSTALL_CONF) ./files/$(COIN_NAME).conf $(1)/etc/coins/
	$(INSTALL_CONF) ./files/$(PKG_NAME).config $(1)/etc/config/$(PKG_NAME)
endef

$(eval $(call BuildPackage,$(PKG_NAME)))
