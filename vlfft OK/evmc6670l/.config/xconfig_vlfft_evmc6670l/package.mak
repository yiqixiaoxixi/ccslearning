#
#  Do not edit this file.  This file is generated from 
#  package.bld.  Any modifications to this file will be 
#  overwritten whenever makefiles are re-generated.
#

unexport MAKEFILE_LIST
MK_NOGENDEPS := $(filter clean,$(MAKECMDGOALS))
override PKGDIR = xconfig_vlfft_evmc6670l
XDCINCS = -I. -I$(strip $(subst ;, -I,$(subst $(space),\$(space),$(XPKGPATH))))
XDCCFGDIR = package/cfg/

#
# The following dependencies ensure package.mak is rebuilt
# in the event that some included BOM script changes.
#
ifneq (clean,$(MAKECMDGOALS))
C:/ti/xdctools_3_23_03_53/include/utils.tci:
package.mak: C:/ti/xdctools_3_23_03_53/include/utils.tci
C:/ti/xdctools_3_23_03_53/packages/xdc/xdc.tci:
package.mak: C:/ti/xdctools_3_23_03_53/packages/xdc/xdc.tci
C:/ti/xdctools_3_23_03_53/packages/xdc/template.xs:
package.mak: C:/ti/xdctools_3_23_03_53/packages/xdc/template.xs
C:/ti/xdctools_3_23_03_53/packages/xdc/om2.xs:
package.mak: C:/ti/xdctools_3_23_03_53/packages/xdc/om2.xs
C:/ti/xdctools_3_23_03_53/packages/xdc/xmlgen.xs:
package.mak: C:/ti/xdctools_3_23_03_53/packages/xdc/xmlgen.xs
C:/ti/xdctools_3_23_03_53/packages/xdc/xmlgen2.xs:
package.mak: C:/ti/xdctools_3_23_03_53/packages/xdc/xmlgen2.xs
C:/ti/xdctools_3_23_03_53/packages/xdc/IPackage.xs:
package.mak: C:/ti/xdctools_3_23_03_53/packages/xdc/IPackage.xs
C:/ti/xdctools_3_23_03_53/packages/xdc/package.xs:
package.mak: C:/ti/xdctools_3_23_03_53/packages/xdc/package.xs
C:/ti/xdctools_3_23_03_53/packages/xdc/services/global/Clock.xs:
package.mak: C:/ti/xdctools_3_23_03_53/packages/xdc/services/global/Clock.xs
C:/ti/xdctools_3_23_03_53/packages/xdc/services/global/Trace.xs:
package.mak: C:/ti/xdctools_3_23_03_53/packages/xdc/services/global/Trace.xs
C:/ti/xdctools_3_23_03_53/packages/xdc/bld/bld.js:
package.mak: C:/ti/xdctools_3_23_03_53/packages/xdc/bld/bld.js
C:/ti/xdctools_3_23_03_53/packages/xdc/bld/BuildEnvironment.xs:
package.mak: C:/ti/xdctools_3_23_03_53/packages/xdc/bld/BuildEnvironment.xs
C:/ti/xdctools_3_23_03_53/packages/xdc/bld/PackageContents.xs:
package.mak: C:/ti/xdctools_3_23_03_53/packages/xdc/bld/PackageContents.xs
C:/ti/xdctools_3_23_03_53/packages/xdc/bld/_gen.xs:
package.mak: C:/ti/xdctools_3_23_03_53/packages/xdc/bld/_gen.xs
C:/ti/xdctools_3_23_03_53/packages/xdc/bld/Library.xs:
package.mak: C:/ti/xdctools_3_23_03_53/packages/xdc/bld/Library.xs
C:/ti/xdctools_3_23_03_53/packages/xdc/bld/Executable.xs:
package.mak: C:/ti/xdctools_3_23_03_53/packages/xdc/bld/Executable.xs
C:/ti/xdctools_3_23_03_53/packages/xdc/bld/Repository.xs:
package.mak: C:/ti/xdctools_3_23_03_53/packages/xdc/bld/Repository.xs
C:/ti/xdctools_3_23_03_53/packages/xdc/bld/Configuration.xs:
package.mak: C:/ti/xdctools_3_23_03_53/packages/xdc/bld/Configuration.xs
C:/ti/xdctools_3_23_03_53/packages/xdc/bld/Script.xs:
package.mak: C:/ti/xdctools_3_23_03_53/packages/xdc/bld/Script.xs
C:/ti/xdctools_3_23_03_53/packages/xdc/bld/Manifest.xs:
package.mak: C:/ti/xdctools_3_23_03_53/packages/xdc/bld/Manifest.xs
C:/ti/xdctools_3_23_03_53/packages/xdc/bld/Utils.xs:
package.mak: C:/ti/xdctools_3_23_03_53/packages/xdc/bld/Utils.xs
C:/ti/xdctools_3_23_03_53/packages/xdc/bld/ITarget.xs:
package.mak: C:/ti/xdctools_3_23_03_53/packages/xdc/bld/ITarget.xs
C:/ti/xdctools_3_23_03_53/packages/xdc/bld/ITarget2.xs:
package.mak: C:/ti/xdctools_3_23_03_53/packages/xdc/bld/ITarget2.xs
C:/ti/xdctools_3_23_03_53/packages/xdc/bld/ITargetFilter.xs:
package.mak: C:/ti/xdctools_3_23_03_53/packages/xdc/bld/ITargetFilter.xs
C:/ti/xdctools_3_23_03_53/packages/xdc/bld/package.xs:
package.mak: C:/ti/xdctools_3_23_03_53/packages/xdc/bld/package.xs
package.mak: config.bld
C:/ti/xdctools_3_23_03_53/packages/ti/targets/ITarget.xs:
package.mak: C:/ti/xdctools_3_23_03_53/packages/ti/targets/ITarget.xs
C:/ti/xdctools_3_23_03_53/packages/ti/targets/C28_large.xs:
package.mak: C:/ti/xdctools_3_23_03_53/packages/ti/targets/C28_large.xs
C:/ti/xdctools_3_23_03_53/packages/ti/targets/C28_float.xs:
package.mak: C:/ti/xdctools_3_23_03_53/packages/ti/targets/C28_float.xs
C:/ti/xdctools_3_23_03_53/packages/ti/targets/package.xs:
package.mak: C:/ti/xdctools_3_23_03_53/packages/ti/targets/package.xs
C:/ti/xdctools_3_23_03_53/packages/ti/targets/elf/ITarget.xs:
package.mak: C:/ti/xdctools_3_23_03_53/packages/ti/targets/elf/ITarget.xs
C:/ti/xdctools_3_23_03_53/packages/ti/targets/elf/TMS470.xs:
package.mak: C:/ti/xdctools_3_23_03_53/packages/ti/targets/elf/TMS470.xs
C:/ti/xdctools_3_23_03_53/packages/ti/targets/elf/package.xs:
package.mak: C:/ti/xdctools_3_23_03_53/packages/ti/targets/elf/package.xs
package.mak: package.bld
C:/ti/xdctools_3_23_03_53/packages/xdc/tools/configuro/template/compiler.opt.xdt:
package.mak: C:/ti/xdctools_3_23_03_53/packages/xdc/tools/configuro/template/compiler.opt.xdt
C:/ti/xdctools_3_23_03_53/packages/xdc/services/io/File.xs:
package.mak: C:/ti/xdctools_3_23_03_53/packages/xdc/services/io/File.xs
C:/ti/xdctools_3_23_03_53/packages/xdc/services/io/package.xs:
package.mak: C:/ti/xdctools_3_23_03_53/packages/xdc/services/io/package.xs
C:/ti/xdctools_3_23_03_53/packages/xdc/tools/configuro/template/custom.mak.exe.xdt:
package.mak: C:/ti/xdctools_3_23_03_53/packages/xdc/tools/configuro/template/custom.mak.exe.xdt
C:/ti/xdctools_3_23_03_53/packages/xdc/tools/configuro/template/package.xs.xdt:
package.mak: C:/ti/xdctools_3_23_03_53/packages/xdc/tools/configuro/template/package.xs.xdt
endif

ti.targets.elf.C66.rootDir ?= C:/ti/ccsv5/tools/compiler/c6000_7.3.4
ti.targets.elf.packageBase ?= C:/ti/xdctools_3_23_03_53/packages/ti/targets/elf/
.PRECIOUS: $(XDCCFGDIR)/%.oe66
.PHONY: all,e66 .dlls,e66 .executables,e66 test,e66
all,e66: .executables,e66
.executables,e66: .libraries,e66
.executables,e66: .dlls,e66
.dlls,e66: .libraries,e66
.libraries,e66: .interfaces
	@$(RM) $@
	@$(TOUCH) "$@"

.help::
	@$(ECHO) xdc test,e66
	@$(ECHO) xdc .executables,e66
	@$(ECHO) xdc .libraries,e66
	@$(ECHO) xdc .dlls,e66


all: .executables 
.executables: .libraries .dlls
.libraries: .interfaces

PKGCFGS := $(wildcard package.xs) package/build.cfg
.interfaces: package/package.xdc.inc package/package.defs.h package.xdc $(PKGCFGS)

-include package/package.xdc.dep
package/%.xdc.inc package/%_xconfig_vlfft_evmc6670l.c package/%.defs.h: %.xdc $(PKGCFGS)
	@$(MSG) generating interfaces for package xconfig_vlfft_evmc6670l" (because $@ is older than $(firstword $?))" ...
	$(XSRUN) -f xdc/services/intern/cmd/build.xs $(MK_IDLOPTS) -m package/package.xdc.dep -i package/package.xdc.inc package.xdc

.dlls,e66 .dlls: vlfft_evmc6670l.pe66

-include package/cfg/vlfft_evmc6670l_pe66.mak
-include package/cfg/vlfft_evmc6670l_pe66.cfg.mak
ifeq (,$(MK_NOGENDEPS))
-include package/cfg/vlfft_evmc6670l_pe66.dep
endif
vlfft_evmc6670l.pe66: package/cfg/vlfft_evmc6670l_pe66.xdl
	@


ifeq (,$(wildcard .libraries,e66))
vlfft_evmc6670l.pe66 package/cfg/vlfft_evmc6670l_pe66.c: .libraries,e66
endif

package/cfg/vlfft_evmc6670l_pe66.c package/cfg/vlfft_evmc6670l_pe66.h package/cfg/vlfft_evmc6670l_pe66.xdl: override _PROG_NAME := vlfft_evmc6670l.xe66
package/cfg/vlfft_evmc6670l_pe66.c: package/cfg/vlfft_evmc6670l_pe66.cfg

clean:: clean,e66
	-$(RM) package/cfg/vlfft_evmc6670l_pe66.cfg
	-$(RM) package/cfg/vlfft_evmc6670l_pe66.dep
	-$(RM) package/cfg/vlfft_evmc6670l_pe66.c
	-$(RM) package/cfg/vlfft_evmc6670l_pe66.xdc.inc

clean,e66::
	-$(RM) vlfft_evmc6670l.pe66
.executables,e66 .executables: vlfft_evmc6670l.xe66

vlfft_evmc6670l.xe66: |vlfft_evmc6670l.pe66

-include package/cfg/vlfft_evmc6670l.xe66.mak
vlfft_evmc6670l.xe66: package/cfg/vlfft_evmc6670l_pe66.oe66 
	$(RM) $@
	@$(MSG) lnke66 $@ ...
	$(RM) $(XDCCFGDIR)/$@.map
	$(ti.targets.elf.C66.rootDir)/bin/lnk6x -q -u _c_int00 -fs $(XDCCFGDIR)$(dir $@).  -q -o $@ package/cfg/vlfft_evmc6670l_pe66.oe66   package/cfg/vlfft_evmc6670l_pe66.xdl --abi=eabi -c -m $(XDCCFGDIR)/$@.map -l $(ti.targets.elf.C66.rootDir)/lib/rts6600_elf.lib
	
vlfft_evmc6670l.xe66: export C_DIR=
vlfft_evmc6670l.xe66: PATH:=$(ti.targets.elf.C66.rootDir)/bin/;$(PATH)
vlfft_evmc6670l.xe66: Path:=$(ti.targets.elf.C66.rootDir)/bin/;$(PATH)

vlfft_evmc6670l.test test,e66 test: vlfft_evmc6670l.xe66.test

vlfft_evmc6670l.xe66.test:: vlfft_evmc6670l.xe66
ifeq (,$(_TESTLEVEL))
	@$(MAKE) -R -r --no-print-directory -f $(XDCROOT)/packages/xdc/bld/xdc.mak _TESTLEVEL=1 vlfft_evmc6670l.xe66.test
else
	@$(MSG) running $<  ...
	$(call EXEC.vlfft_evmc6670l.xe66, ) 
endif

clean,e66::
	-$(RM) .tmp,vlfft_evmc6670l.xe66,0,*


clean:: clean,e66

clean,e66::
	-$(RM) vlfft_evmc6670l.xe66
clean:: 
	-$(RM) package/cfg/vlfft_evmc6670l_pe66.pjt
%,copy:
	@$(if $<,,$(MSG) don\'t know how to build $*; exit 1)
	@$(MSG) cp $< $@
	$(RM) $@
	$(CP) $< $@
vlfft_evmc6670l_pe66.oe66,copy : package/cfg/vlfft_evmc6670l_pe66.oe66
vlfft_evmc6670l_pe66.se66,copy : package/cfg/vlfft_evmc6670l_pe66.se66

$(XDCCFGDIR)%.c $(XDCCFGDIR)%.h $(XDCCFGDIR)%.xdl: $(XDCCFGDIR)%.cfg .interfaces $(XDCROOT)/packages/xdc/cfg/Main.xs
	@$(MSG) "configuring $(_PROG_NAME) from $< ..."
	$(CONFIG) $(_PROG_XSOPTS) xdc.cfg $(_PROG_NAME) $(XDCCFGDIR)$*.cfg $(XDCCFGDIR)$*

.PHONY: release,xconfig_vlfft_evmc6670l
xconfig_vlfft_evmc6670l.tar: package/package.bld.xml
xconfig_vlfft_evmc6670l.tar: package/package.ext.xml
xconfig_vlfft_evmc6670l.tar: package/package.rel.dot
xconfig_vlfft_evmc6670l.tar: package/build.cfg
xconfig_vlfft_evmc6670l.tar: package/package.xdc.inc
ifeq (,$(MK_NOGENDEPS))
-include package/rel/xconfig_vlfft_evmc6670l.tar.dep
endif
package/rel/xconfig_vlfft_evmc6670l/xconfig_vlfft_evmc6670l/package/package.rel.xml:

xconfig_vlfft_evmc6670l.tar: package/rel/xconfig_vlfft_evmc6670l.xdc.inc package/rel/xconfig_vlfft_evmc6670l/xconfig_vlfft_evmc6670l/package/package.rel.xml
	@$(MSG) making release file $@ "(because of $(firstword $?))" ...
	-$(RM) $@
	$(call MKRELTAR,package/rel/xconfig_vlfft_evmc6670l.xdc.inc,package/rel/xconfig_vlfft_evmc6670l.tar.dep)


release release,xconfig_vlfft_evmc6670l: all xconfig_vlfft_evmc6670l.tar
clean:: .clean
	-$(RM) xconfig_vlfft_evmc6670l.tar
	-$(RM) package/rel/xconfig_vlfft_evmc6670l.xdc.inc
	-$(RM) package/rel/xconfig_vlfft_evmc6670l.tar.dep

clean:: .clean
	-$(RM) .libraries .libraries,*
clean:: 
	-$(RM) .dlls .dlls,*
#
# The following clean rule removes user specified
# generated files or directories.
#

ifneq (clean,$(MAKECMDGOALS))
ifeq (,$(wildcard package))
    $(shell $(MKDIR) package)
endif
ifeq (,$(wildcard package/cfg))
    $(shell $(MKDIR) package/cfg)
endif
ifeq (,$(wildcard package/lib))
    $(shell $(MKDIR) package/lib)
endif
ifeq (,$(wildcard package/rel))
    $(shell $(MKDIR) package/rel)
endif
ifeq (,$(wildcard package/internal))
    $(shell $(MKDIR) package/internal)
endif
ifeq (,$(wildcard package/external))
    $(shell $(MKDIR) package/external)
endif
endif
clean::
	-$(RMDIR) package

include custom.mak
clean:: 
	-$(RM) package/xconfig_vlfft_evmc6670l.pjt
