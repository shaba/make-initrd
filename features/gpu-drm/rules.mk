GPUDRM_MODULES := $(shell $(call shell-export-vars) $(FEATURESDIR)/gpu-drm/bin/get-modules)

MODULES_ADD += $(GPUDRM_MODULES)
