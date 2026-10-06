# hint: On this file, there are some parameters for
# hint: services like Arancia 3 Network, etc.
ifeq ($(skgcc),)
$(error SK-GCC is undefined. You need to include "SKGCC := $$(shell sk-gcc-config --sk-gcc-path)" in your Makefile!)
endif
CC  	= sk-gcc
CXX 	= sk-gxx
AS  	= sk-agcc
LD  	= sk-agcc
AR		= sk-agcc-ar
A3N		= sk-agcc-a3n
FIXUP	= sk-gcc-fixup-imports