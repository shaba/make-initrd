PLYMOUTH_LIBDIR := $(shell $(call shell-export-vars) $(FEATURESDIR)/plymouth/bin/get-libdir)

PLYMOUTH_PACK_MODULES := $(shell $(call shell-export-vars) $(FEATURESDIR)/plymouth/bin/get-modules)
PLYMOUTH_PACK_FONT    := $(or $(PLYMOUTH_FONT),$(shell fc-match -f '%{file}\n' 'DejaVuSans' ||:))
PLYMOUTH_PACK_THEME   := $(shell $(call shell-export-vars) $(FEATURESDIR)/plymouth/bin/get-theme-files "$(PLYMOUTH_THEME)")

PLYMOUTH_EXCLUDE_MODULES   ?=
PLYMOUTH_EXCLUDE_RENDERERS ?= $(PLYMOUTH_LIBDIR)/renderers/x11.so

PLYMOUTH_PACK_FILES ?= \
	$(wildcard $(SYSCONFDIR)/plymouth/plymouthd.conf) \
	$(wildcard $(SYSCONFDIR)/*-release) \
	$(wildcard /var/lib/plymouth/boot-duration) \
	$(wildcard $(DATADIR)/plymouth/plymouthd.defaults) \
	$(filter-out $(PLYMOUTH_EXCLUDE_MODULES),$(wildcard $(PLYMOUTH_LIBDIR)/*.so)) \
	$(filter-out $(PLYMOUTH_EXCLUDE_RENDERERS),$(wildcard $(PLYMOUTH_LIBDIR)/renderers/*.so)) \
	$(DATADIR)/plymouth/themes/details/details.plymouth \
	$(DATADIR)/plymouth/themes/text/text.plymouth \
	$(PLYMOUTH_PACK_FONT) \
	$(PLYMOUTH_PACK_THEME)

MODULES_ADD += $(PLYMOUTH_PACK_MODULES)
MODULES_TRY_ADD += drivers/char/agp

PUT_UDEV_RULES    += $(PLYMOUTH_UDEV_RULES)
PUT_FEATURE_DIRS  += $(PLYMOUTH_DATADIR)
PUT_FEATURE_FILES += $(PLYMOUTH_PACK_FILES) $(PLYMOUTH_FILES)
PUT_FEATURE_PROGS += $(PLYMOUTH_PROGS)

LOCALES_TEXTDOMAIN += $(PLYMOUTH_TEXTDOMAIN)
