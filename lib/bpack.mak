SK = $(SKGCC)
include $(SK)/include/general.mak
# Compatible ONLY with .pmp or .sb3 files.
# This will NOT work with .sb or .sb2 files.

ifeq ($(SK),)
$(error Even with packing, SK-GCC is undefined. Use "SK = $(SKGCC)" in your Makefile)
endif

ifneq ($(BLOW_WIPACKSYS),)
$(error BLOW_WIPACKSYS should never be defined when doing a full-on pack of your psk)
endif

ifeq ($(SKTARGET),)
$(error No SKTARGET spec was found. Please specify it so that you tell me which files to pack)
endif

RIPE = \
		$(PACKNAME) \
		$(SKTARGET).psk \
		$(A3PACK).psk
CC  =		sk-gcc
CXX =		sk-gxx
AS  =		sk-agcc
LD  =		sk-agcc
AR  =		sk-gcc-ar

EXPAND_MEM    =	300
EXPAND_PMPMEM =	300

ifndef SKTARGET
SKTARGET = NULL
endif

ifndef PACKNAME
PACKNAME = skpack
endif

ifndef A3PACK
A3PACK = skpack
endif

ifndef BLOW_WISYSCALL
# Here are some specs for this thing:
# 1. If '0', the pack will be Read-Only.
# 2. If '333', the pack will be Read-Write.
# 3. If '777', the pack will be Read-Write-Call (all permissions).
EXPAND_MEM = 11
BLOW_WISYSCALL = 0
endif

build_sb3:
# We need to tell SK-GCC what to do with your .sb3 file (take it, encrypt it, pack it...).
	$(Q)mkdir -p $(PACKNAME)
	$(Q)cp $(SKTARGET).sb3 $(A3PACK).psk
	$(Q)cp $(A3PACK).psk $(PACKNAME)/$(A3PACK).psk
	$(Q)cp $(SK)/lib/packcertificate.A3 $(PACKNAME)/$(PACKNAME).A3
build_pmp:
# We need to tell SK-GCC what to do with your .pmp file (take it, encrypt it, pack it...).
	$(Q)mkdir -p $(PACKNAME)
	$(Q)cp $(SKTARGET).pmp $(A3PACK).psk
	$(Q)cp $(A3PACK).psk $(PACKNAME)/$(A3PACK).psk
	$(Q)cp $(SK)/lib/packcertificate.A3 $(PACKNAME)/$(PACKNAME).A3
ripe:
# We need to clean this.
	rm -rf $(RIPE)