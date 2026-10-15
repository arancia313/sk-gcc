include ../sk-gcc/include/general.mak
skgcc  = $(sk_gcc)/lib/build.mak
# hint: On this file, there are some parameters for
# hint: services like Arancia 3 Network, etc.
ifeq ($(skgcc),)
$(error SK-GCC is undefined. You need to include "SKGCC := $$(shell sk-gcc-config --sk-gcc-path)" in your Makefile!)
endif
CC  	= sk-gcc
CXX 	= sk-gxx
AS  	= sk-agcc
LD  	= sk-agcc
AR	= sk-agcc-ar
A3N	= sk-agcc-a3n
FIXUP	= sk-gcc-fixup-imports
TARGET	= sk-gcc-targets

CFLAGS   := $(addprefix -I,$(INCDIR)) $(CFLAGS)
CXXFLAGS := $(CFLAGS) $(CXXFLAGS)
ASFLAGS  := $(CFLAGS) $(ASFLAGS)

ifeq ($(A3_VER),)
A3_VER = 432
endif

EXPAND = 0

ifeq ($(shell test $(A3_VER) -gt 390; echo$$?),0)
EXPAND = 2
ifeq ($(LARGE_MEM),1)
$(warning The "LARGE_MEM" flag is not necessary targeting Arancia 3 versions above 3.33 and 3.66.)
EXPAND = 1
else ifeq ($(LARGE_MEM),0)
EXPAND = 0
else ifeq ($(LARGE_MEM),2)
EXPAND = 2
else ifeq ($(LARGE_MEM),3)
EXPAND = 3
endif
else
ifeq ($(LARGE_MEM),1)
EXPAND = 1
else ifeq ($(LARGE_MEM),2)
EXPAND = 2
else ifeq ($(LARGE_MEM),3)
EXPAND = 3
endif
endif

SFOFLAGSA3 := -d MEMSIZE=$(EXPAND_MEMORY) $(SFOFLAGSA3)

CFLAGS += -D_BLOW_FW_VERSION=$(BLOW_FW_VERSION)
CXXFLAGS += -D_BLOW_FW_VERSION=$(BLOW_FW_VERSION)

all:
	kxploit: $(SKTARGET).a3elf $(BLOW_EBOOT_SFO)
	mkdir -p "$(SKTARGET)"
	$(STRIP) $(SKTARGET).a3elf -o $(SKTARGET)/$(BLOW_EBOOT)
	mkdir -p "$(SKTARGET)%"
	$(PACK_PBP) "$(SKTARGET)%/$(BLOW_EBOOT)" $(BLOW_EBOOT_SFO) $(BLOW_EBOOT_ICON)  \
		$(BLOW_EBOOT_ICON1) $(BLOW_EBOOT_PIC0) $(BLOW_EBOOT_PIC1)  \
		$(BLOW_EBOOT_SND0) NULL $(BLOW_EBOOT_PSAR)


# Define the overridable parameters for EBOOT.PBP
ifndef BLOW_EBOOT_TITLE
BLOW_EBOOT_TITLE = $(TARGET)
endif

ifndef BLOW_EBOOT_SFO
BLOW_EBOOT_SFO = PARAM.SFO
endif

ifndef BLOW_EBOOT_ICON
BLOW_EBOOT_ICON = NULL
endif

ifndef BLOW_EBOOT_ICON1
BLOW_EBOOT_ICON1 = NULL
endif

ifdef BLOW_EBOOT_UNKPNG
BLOW_EBOOT_PIC0 = $(BLOW_EBOOT_UNKPNG)
else ifndef BLOW_EBOOT_PIC0
BLOW_EBOOT_PIC0 = NULL
endif

ifndef BLOW_EBOOT_PIC1
BLOW_EBOOT_PIC1 = NULL
endif

ifndef BLOW_EBOOT_SND0
BLOW_EBOOT_SND0 = NULL
endif

ifndef BLOW_EBOOT_PSAR
BLOW_EBOOT_PSAR = NULL
endif

ifndef BLOW_PRODUCE_PBOOT
ifeq ($(ENCRYPT), 2)
BLOW_PRODUCE_PBOOT = 1
endif
endif

ifndef BLOW_EBOOT
ifeq ($(BLOW_PRODUCE_PBOOT), 1)
BLOW_EBOOT = PBOOT.PBP
else
BLOW_EBOOT = EBOOT.PBP
endif
endif

ifeq ($(BLOW_PRODUCE_PBOOT), 1)
SFOFLAGSA3 := -p $(SFOFLAGSA3)
endif

ifeq ($(ENCRYPT), 2)
SFOFLAGSA3 := -d USE_USB=1 $(SFOFLAGSA3)
endif

ifeq ($(BUILD_PRX),1)
ifneq ($(TARGET_LIB),)
$(error TARGET_LIBA3 should not be defined when building a prx.)
else
FINAL_ATARGET = $(SKTARGET).prx
endif
else
ifneq ($(TARGET_LIBA3),)
FINAL_ATARGET = $(TARGET_LIBA3)
else
FINAL_ATARGET = $(SKTARGET).elf
endif
endif