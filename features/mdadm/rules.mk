MDADM_UDEV_RULES := \
	$(foreach majmin,$(GENERATE_UDEV_RULES_FOR_MD_DEVICE),\
		$(shell $(call shell-export-vars) $(FEATURESDIR)/mdadm/bin/generate-udev-rules $(majmin)))

PUT_UDEV_RULES += $(MDAMD_RULES_OLD) $(MDAMD_RULES) $(MDADM_UDEV_RULES)

PUT_FEATURE_DIRS  += $(MDADM_DATADIR)
PUT_FEATURE_FILES += $(MDADM_FILES)
PUT_FEATURE_PROGS += $(MDADM_PROGS)
