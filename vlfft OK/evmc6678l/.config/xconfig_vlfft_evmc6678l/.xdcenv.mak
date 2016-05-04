#
_XDCBUILDCOUNT = 0
ifneq (,$(findstring path,$(_USEXDCENV_)))
override XDCPATH = C:/ti/ipc_1_24_02_27/packages;C:/dev/vlfft/vlfft/vlfft;C:/ti/bios_6_31_04_27/packages;C:/ti/edma3_lld_02_11_02_04/packages;C:/ti/mcsdk_2_00_07_19/demos;C:/dev/vlfft/vlfft/vlfft/evmc6678l/.config
override XDCROOT = C:/ti/xdctools_3_20_08_88
override XDCBUILDCFG = ./config.bld
endif
ifneq (,$(findstring args,$(_USEXDCENV_)))
override XDCARGS = 
override XDCTARGETS = 
endif
#
ifeq (0,1)
PKGPATH = C:/ti/ipc_1_24_02_27/packages;C:/dev/vlfft/vlfft/vlfft;C:/ti/bios_6_31_04_27/packages;C:/ti/edma3_lld_02_11_02_04/packages;C:/ti/mcsdk_2_00_07_19/demos;C:/dev/vlfft/vlfft/vlfft/evmc6678l/.config;C:/ti/xdctools_3_20_08_88/packages;..
HOSTOS = Windows
endif
