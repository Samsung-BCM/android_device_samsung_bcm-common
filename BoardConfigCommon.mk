# inherit from the proprietary version
-include vendor/samsung/bcm-common/BoardConfigVendor.mk

# PATH
LOCAL_PATH := device/samsung/bcm-common

# Platform
TARGET_ARCH                   := arm
TARGET_NO_BOOTLOADER          := true
TARGET_BOARD_PLATFORM         := hawaii
TARGET_CPU_ABI                := armeabi-v7a
TARGET_CPU_ABI2               := armeabi
TARGET_ARCH_VARIANT           := armv7-a-neon
TARGET_CPU_VARIANT            := cortex-a9
TARGET_CPU_SMP                := true
ARCH_ARM_HAVE_TLS_REGISTER    := true
TARGET_BOOTLOADER_BOARD_NAME  := hawaii

# Kernel
BOARD_KERNEL_BASE             := 0x82000000
BOARD_KERNEL_PAGESIZE         := 4096
TARGET_KERNEL_SOURCE          := kernel/samsung/bcm

# PARTITION SIZE
BOARD_BOOTIMAGE_PARTITION_SIZE        := 8388608
BOARD_RECOVERYIMAGE_PARTITION_SIZE    := 8388608
BOARD_SYSTEMIMAGE_PARTITION_SIZE      := 1395654656
BOARD_USERDATAIMAGE_PARTITION_SIZE    := 2189426688
BOARD_CACHEIMAGE_PARTITION_SIZE       := 209715200
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE     := ext4

# FLASH BLOCK SIZE (BOARD_KERNEL_PAGESIZE * 64)
BOARD_FLASH_BLOCK_SIZE                := 262144

# Bluetooth
BOARD_HAVE_BLUETOOTH                        := true
BOARD_HAVE_BLUETOOTH_BCM                    := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(LOCAL_PATH)/bluetooth
BOARD_BLUEDROID_VENDOR_CONF                 := $(LOCAL_PATH)/bluetooth/libbt_vndcfg_ace3.txt

# Wi-Fi
BOARD_HAVE_SAMSUNG_WIFI     := true
WPA_BUILD_SUPPLICANT        := true
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
WPA_SUPPLICANT_VERSION      := VER_0_8_X
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_bcmdhd
BOARD_HOSTAPD_DRIVER        := NL80211
BOARD_HOSTAPD_PRIVATE_LIB   := lib_driver_cmd_bcmdhd
BOARD_WLAN_DEVICE           := bcmdhd
BOARD_WLAN_DEVICE_REV       := bcm4330_b1
WIFI_DRIVER_FW_PATH_PARAM   := "/sys/module/dhd/parameters/firmware_path"
WIFI_DRIVER_FW_PATH_STA     := "/system/etc/wifi/bcmdhd_sta.bin"
WIFI_DRIVER_FW_PATH_AP      := "/system/etc/wifi/bcmdhd_apsta.bin"
WIFI_DRIVER_MODULE_PATH     := "/system/lib/modules/dhd.ko"
WIFI_DRIVER_MODULE_NAME     := "dhd"
WIFI_DRIVER_MODULE_ARG      := "firmware_path=/system/etc/wifi/bcmdhd_sta.bin nvram_path=/system/etc/wifi/nvram_net.txt"
WIFI_DRIVER_MODULE_AP_ARG   := "firmware_path=/system/etc/wifi/bcmdhd_apsta.bin nvram_path=/system/etc/wifi/nvram_net.txt"
WIFI_BAND                   := 802_11_ABG

# Resolution
TARGET_SCREEN_HEIGHT := 800
TARGET_SCREEN_WIDTH  := 480

# Hardware rendering
BOARD_EGL_CFG                     := $(LOCAL_PATH)/configs/egl.cfg
USE_OPENGL_RENDERER               := true
BOARD_USE_MHEAP_SCREENSHOT        := true
BOARD_EGL_WORKAROUND_BUG_10194508 := true
TARGET_USES_ION                   := true
HWUI_COMPILE_FOR_PERF             := true
COMMON_GLOBAL_CFLAGS              += -DNEEDS_VECTORIMPL_SYMBOLS -DHAWAII_HWC

# Opengl
BOARD_USE_BGRA_8888               := true

# Audio
BOARD_USES_ALSA_AUDIO             := true

# Enable dex-preoptimization to speed up the first boot sequence
# of an SDK AVD. Note that this operation only works on Linux for now
ifeq ($(HOST_OS),linux)
  ifeq ($(WITH_DEXPREOPT),)
    WITH_DEXPREOPT := true
  endif
endif

# Bootanimation
TARGET_BOOTANIMATION_PRELOAD           := true
TARGET_BOOTANIMATION_TEXTURE_CACHE     := true

# Charger
BOARD_CHARGING_MODE_BOOTING_LPM        := /sys/class/power_supply/battery/batt_lp_charging

# healthd
BOARD_HAL_STATIC_LIBRARIES             := libhealthd-loganxx.hawaii

# RIL
BOARD_RIL_CLASS                        := ../../../device/samsung/bcm-common/ril/

# Recovery
#TARGET_RECOVERY_INITRC                := 
TARGET_RECOVERY_FSTAB                  := $(LOCAL_PATH)/ramdisk/fstab.hawaii_ss_loganxx
TARGET_USE_CUSTOM_LUN_FILE_PATH        := "/sys/class/android_usb/android0/f_mass_storage/lun%d/file"
BOARD_HAS_NO_SELECT_BUTTON             := true
BOARD_HAS_LARGE_FILESYSTEM             := true
TARGET_USERIMAGES_USE_EXT4             := true
TARGET_RECOVERY_PIXEL_FORMAT           := BGRA_8888
BOARD_HAS_NO_MISC_PARTITION            := true
BOARD_RECOVERY_HANDLES_MOUNT           := true
BOARD_USES_MMCUTILS                    := false
BOARD_RECOVERY_ALWAYS_WIPES            := false
BOARD_SUPPRESS_EMMC_WIPE               := true

# CMHW
BOARD_HARDWARE_CLASS                   := hardware/samsung/cmhw/ device/samsung/bcm-common/cmhw/

# GPS
TARGET_SPECIFIC_HEADER_PATH            := $(LOCAL_PATH)/include

# Misc.
TARGET_SYSTEM_PROP                     := $(LOCAL_PATH)/system.prop

# SELinux
BOARD_SEPOLICY_DIRS += \
    device/samsung/bcm-common/sepolicy

BOARD_SEPOLICY_UNION += \
    file_contexts