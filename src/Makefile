include ../defines.mk

CC=gcc
CINCLUDE=-I ../include
CFLAGS=-Wall
LDFLAGS=-shared
LD=

SRCS = $(wildcard *.c)
OBJS = $(SRCS:%.c=%.o)
TARGET1 = $(SHARED)
TARGET2 = $(STATIC)

TARGETS = $(TARGET1) $(TARGET2)

all:$(TARGETS)

$(TARGET1): $(OBJS)
	@echo "Creating Shared Lib"
	$(CC) $(LDFLAGS) -o $@ $^ $(CINCLUDE)

$(TARGET2): $(OBJS)
	@echo "Creating Static Lib"
	ar rcs $@ $^

%.o: %.c
	@echo "Creating Object Files"
	$(CC) -c $(CFLAGS) -fPIC $^ $(CINCLUDE)	

.PHONY: clean
clean:
	rm -f $(TARGETS) *.o *~ core core.* *.core *.a *.so
