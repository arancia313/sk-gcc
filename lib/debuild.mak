SK = $(SKGCC)
include $(SK)/include/general.mak
# hint: This is a build file for Scratch projects (.sb3 files).
ifeq ($(SK),)
$(error SK-GCC is undefined. You need to include "SK = $(SKGCC)" in your Makefile)
endif

ifeq ($(A3PACK),)
$(warning A3 pack is not set. Defaulting to skpack.psk instead.)
endif

ifeq ($(SKTARGET),)
$(error Please specify SKTARGET so that you tell me which files i should pack)
endif

CC  	= sk-gcc
CXX 	= sk-gxx
AS  	= sk-agcc
LD  	= sk-agcc
AR		= sk-agcc-ar
A3N		= sk-agcc-a3n
FIXUP	= sk-gcc-fixup-imports
CONFIG	= a3-config

# Parameters.
# At this point, BLOW_WIPACKSYS can be included in the Makefile,
# but it doesn't have a point by linking your Makefile to this one.

ifndef SKTARGET
EXPAND_MEM = 1000
SKTARGET = NULL
endif

ifndef A3PACK
EXPAND_MEM = 1020
A3PACK = skpack
endif

debuild:
	$(Q)cp $(A3PACK).psk $(SKTARGET).zip
ripe:
	rm -rf $(A3PACK).zip