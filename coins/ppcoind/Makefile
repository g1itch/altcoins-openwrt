#
# Copyright (C) 2016 Dmitri Bogomolov
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

COIN_NAME:=ppcoin
PKG_VERSION:=0.5.4

PKG_SOURCE:=v$(PKG_VERSION)ppc.zip
PKG_SOURCE_URL:=https://github.com/$(COIN_NAME)/$(COIN_NAME)/archive/
PKG_SHA256SUM:=d4c12f37a14550e2a842d7579a8ea37533f0c651e2707eee41d4cc526ceaece2
PKG_BUILD_DIR:=$(BUILD_DIR)/$(COIN_NAME)-$(PKG_VERSION)ppc

define Package/$(PKG_NAME)/Default
	URL:=http://peercoin.net
endef

include ../coin.mk

# call BuildPackage - OpenWrt buildroot signature
