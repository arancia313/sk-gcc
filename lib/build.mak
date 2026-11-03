SK = $(SKGCC)
include $(SK)/include/general.mak
# hint: This is a build file for Scratch projects (.sb3 files).
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
EXPAND_MEM = 1000
SKTARGET = NULL
endif

ifndef A3PACK
EXPAND_MEM = 1020
A3PACK = skpack
endif

build:
# SK-GCC does not compile, it just creates a proprietary
# encrypted version of the file. It does this just by
# copying the exact same file data, process them,
# compress them and convert them into a mysterious psk format.
	$(Q)cp $(SKTARGET).sb3 $(SKTARGET).psk
	$(Q)mv $(SKTARGET).psk $(A3PACK).psk
ripe:
	rm -rf $(SKTARGET).psk $(A3PACK).psk