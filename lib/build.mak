SK = $(SKGCC)
include $(SK)/include/general.mak
# hint: On this file, there are some parameters for
# hint: services like Arancia 3 Network, etc.
ifeq ($(skgcc),)
$(error SK-GCC is undefined. You need to include "SK = $(SKGCC)" in your Makefile!)
endif
CC  	= sk-gcc
CXX 	= sk-gxx
AS  	= sk-agcc
LD  	= sk-agcc
AR	= sk-agcc-ar
A3N	= sk-agcc-a3n
FIXUP	= sk-gcc-fixup-imports
TARGET	= sk-gcc-targets
CONFIG	= a3-config