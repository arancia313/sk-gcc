SK = $(SKGCC)
include $(SK)/include/general.mak
# hint: This is a build file for legacy Scratch projects (.sb files).
ifeq ($(SK),)
$(error SK-GCC is undefined. You need to include "SK = $(SKGCC)" in your Makefile)
endif

ifeq ($(A3PACK),)
$(warning A3 pack is not set. Defaulting to skpack.psk instead.)
endif

CC  	= sk-gcc
CXX 	= sk-gxx
AS  	= sk-agcc
LD  	= sk-agcc
AR		= sk-agcc-ar
A3N		= sk-agcc-a3n
FIXUP	= sk-gcc-fixup-imports
CONFIG	= a3-config

# Parameters for converting .sb3 files.

ifndef SKTARGET
SKTARGET = NULL
endif

ifndef A3PACK
A3PACK = skpack
endif

build:
	$(Q)cp $(SKTARGET).sb $(SKTARGET).psk
	$(Q)mv $(SKTARGET).psk $(A3PACK).psk
ripe:
	rm -rf $(SKTARGET).psk $(A3PACK).psk