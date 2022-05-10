# Copyright (C) 2022 Openwrt.org
#
# This is free software, licensed under the Apache License, Version 2.0 .
#

include $(TOPDIR)/rules.mk

LUCI_TITLE:=LuCI support for redsocks2
LUCI_DEPENDS:=+redsocks2 +ipset +iptables-mod-tproxy
LUCI_PKGARCH:=all

PKG_NAME:=luci-app-redsocks2
PKG_VERSION:=1
PKG_RELEASE:=1

include $(TOPDIR)/feeds/luci/luci.mk

# call BuildPackage - OpenWrt buildroot signature
