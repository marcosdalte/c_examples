include ../defines.mk

MARCH:=$(shell uname -m)

# Standard VARS, may be overwritten by external parameters!
CC=gcc
CCPP=g++
LD=gcc
LDCPP=g++
MYCFLAGS=
CPPFLAGS=-W -Wall -Winline -Wstrict-prototypes -Wmissing-prototypes -Wmissing-declarations -Wwrite-strings -Wpointer-arith -Wcast-align -Wbad-function-cast -Wcast-qual
ifneq ($(GCCVER),2)
CPPFLAGS+=-Wfloat-equal -Wdisabled-optimization
ifeq ($(DISTRO),TLX1)
CPPFLAGS+=-Winit-self
endif
endif
LDFLAGS=--shared
LOADLIBES=
ifeq ($(OS),Linux)
MYCFLAGS+=-march=$(MARCH) -pipe
CPPFLAGS+=-Wshadow
endif
ifeq ($(OS),FreeBSD)
MYCFLAGS+=-march=$(MARCH)
CPPFLAGS+=-Wshadow
endif
ifeq ($(OS),SunOS)
CPPFLAGS+=
endif
ifndef DEBUG
MYCFLAGS+=-O2 -fomit-frame-pointer
CPPFLAGS+=-Werror
else
MYCFLAGS+=-ggdb3
CPPFLAGS+=-DDEBUG
endif
XMLFLAGS:=$(shell xml2-config --cflags)
MYCFLAGS+=$(XMLFLAGS)

ifndef CFLAGS
override CFLAGS=$(MYCFLAGS)
endif

# Custom vars, required for compilation, will not be overwritten.
INCLUDES=-I ../include/
CFLAGSEX=$(INCLUDES)
#CPPFLAGSEX=-D$(OS)
#ifdef DISTRO
#CPPFLAGSEX+=-D$(DISTRO)
#endif
LOADLIBESEX=

# Sources and objects
#
# specify your source and object files
#
SRCS1 = $(wildcard *.c)
OBJS1 = $(SRCS1:%.c=%.o)
SRCS = $(SRCS1) 

# Targets - specify each target..
#
TARGET1 = $(LSHARED)
TARGET2 = $(LSTATIC)

# ADD ANY TARGET HERE
TARGETS = $(TARGET1) $(TARGET2)

.PHONY : all
all: $(TARGETS)

.PHONY : clean
clean:
	rm -f $(TARGETS) *.o *~ core core.* *.core

.PHONY : depend
depend:
	makedepend $(INCLUDES) -Y $(SRCS)

.PHONY : install
install: all
	@echo "######" $(BUILD_ROOT)
	@echo "######" $(INSTALL_DIR)
	$(INSTALL) -d $(BUILD_ROOT)/$(INSTALL_DIR)
	$(INSTALL) $(LSHARED) $(BUILD_ROOT)/$(INSTALL_DIR)/$(LSHARED)
	$(INSTALL) $(LSTATIC) $(BUILD_ROOT)/$(INSTALL_DIR)/$(LSTATIC)
	ln -sf $(INSTALL_DIR)/$(LSHARED) $(BUILD_ROOT)/$(INSTALL_DIR)/$(LSHARED).$(MAJOR)
	ln -sf $(INSTALL_DIR)/$(LSTATIC) $(BUILD_ROOT)/$(INSTALL_DIR)/$(LSTATIC).$(MAJOR)

#
# Enter a section for each target
#
$(TARGET1): $(OBJS1) 
	$(LD) $(CFLAGS) $(CFLAGSEX) $(LDFLAGS) $(LDFLAGSEX) -Wl,-export-dynamic -o $@ $^ $(LOADLIBES) $(LOADLIBESEX)

$(TARGET2): $(OBJS1)
	ar rcs $@ $^

%.o: %.c
	$(CC) -c $(CPPFLAGS) $(CPPFLAGSEX) $(CFLAGS) $(CFLAGSEX) $< -o $@
