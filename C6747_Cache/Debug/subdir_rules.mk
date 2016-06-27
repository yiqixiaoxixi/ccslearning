################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Each subdirectory must supply rules for building sources it contributes
Cache_example.obj: ../Cache_example.c $(GEN_OPTS) $(GEN_SRCS)
	@echo 'Building file: $<'
	@echo 'Invoking: C6000 Compiler'
	"C:/ti/ccsv5/tools/compiler/c6000_7.3.4/bin/cl6x" -mv6740 -g --define=c6747 --include_path="C:/ti/ccsv5/tools/compiler/c6000_7.3.4/include" --include_path="../include" --display_error_number --diag_warning=225 --abi=coffabi --preproc_with_compile --preproc_dependency="Cache_example.pp" $(GEN_OPTS__FLAG) "$<"
	@echo 'Finished building: $<'
	@echo ' '


