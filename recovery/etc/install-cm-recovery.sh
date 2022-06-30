#!/system/bin/sh
if [ -f /system/etc/recovery-transform.sh ]; then
  exec sh /system/etc/recovery-transform.sh 7548928 434edb59a4179df9215155b78ddace05afc7bfd6 5312512 d8ba025dff9d8348015f6741799d273f99869d6f
fi

if ! applypatch -c EMMC:/dev/block/platform/sdhci.1/by-name/RECOVERY:7548928:434edb59a4179df9215155b78ddace05afc7bfd6; then
  log -t recovery "Installing new recovery image"
  applypatch -b /system/etc/recovery-resource.dat EMMC:/dev/block/platform/sdhci.1/by-name/KERNEL:5312512:d8ba025dff9d8348015f6741799d273f99869d6f EMMC:/dev/block/platform/sdhci.1/by-name/RECOVERY 434edb59a4179df9215155b78ddace05afc7bfd6 7548928 d8ba025dff9d8348015f6741799d273f99869d6f:/system/recovery-from-boot.p
else
  log -t recovery "Recovery image already installed"
fi
