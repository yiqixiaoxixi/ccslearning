#
_XDCBUILDCOUNT = 
ifneq (,$(findstring path,$(_USEXDCENV_)))
override XDCPATH = C:/ti/ipc_1_24_03_32/packages;C:/Users/acer1/WORKSP~1/VLFFTO~1;C:/ti/bios_6_33_05_46/packages;C:/packages;C:/demos;C:/ti/ccsv5/ccs_base;C:/Users/acer1/WORKSP~1/VLFFTO~1/evmc6670l/.config
override XDCROOT = C:/ti/xdctools_3_23_03_53
override XDCBUILDCFG = ./config.bld
endif
ifneq (,$(findstring args,$(_USEXDCENV_)))
override XDCARGS = 
override XDCTARGETS = 
endif
#
ifeq (0,1)
PKGPATH = C:/ti/ipc_1_24_03_32/packages;C:/Users/acer1/WORKSP~1/VLFFTO~1;C:/ti/bios_6_33_05_46/packages;C:/packages;C:/demos;C:/ti/ccsv5/ccs_base;C:/Users/acer1/WORKSP~1/VLFFTO~1/evmc6670l/.config;C:/ti/xdctools_3_23_03_53/packages;..
HOSTOS = Windows
endif
