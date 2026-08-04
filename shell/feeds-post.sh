#!/bin/bash

# Modify default IP
#sed -i 's/192.168.1.1/192.168.50.5/g' package/base-files/files/bin/config_generate

# Modify default theme
#sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile

# Modify hostname
#sed -i 's/OpenWrt/P3TERX-Router/g' package/base-files/files/bin/config_generate


# 修改luci-light
rm -rf package/feeds/luci/luci-light
# sed -i '0,/secs=/s|secs=.*|secs="$$(($$(date --utc +%s) % 86400))"; \\|' feeds/luci/luci.mk
sed -i 's|yday=.*|yday="$$(date --utc "+%y.%j")"; \\|' feeds/luci/luci.mk
ln -sf "$(pwd)/feeds/luci/collections/luci-light" "${CUSTOM_DIR}/luci-light"
sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' "${CUSTOM_DIR}/luci-light/Makefile"
sed -i 's|include .*luci\.mk|include $(TOPDIR)/feeds/luci/luci.mk|g' "${CUSTOM_DIR}/luci-light/Makefile"
