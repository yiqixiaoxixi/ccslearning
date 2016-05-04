## THIS IS A GENERATED FILE -- DO NOT EDIT
.configuro: .libraries,e66 linker.cmd \
  package/cfg/vlfft_evmc6678l_xe66.oe66 \

linker.cmd: package/cfg/vlfft_evmc6678l_xe66.xdl
	$(SED) 's"^\"\(package/cfg/vlfft_evmc6678l_xe66cfg.cmd\)\"$""\"C:/dev/vlfft/vlfft/vlfft/evmc6678l/.config/xconfig_vlfft_evmc6678l/\1\""' package/cfg/vlfft_evmc6678l_xe66.xdl > $@
