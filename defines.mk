MAJOR=1
MINOR=0
PATCH=0
PACKG=1
VERSION:=$(MAJOR).$(MINOR).$(PATCH)

DEBUG=0

INSTALL_DIR=/home/$(USER)/t_exam

NAME=examples
LSHARED=c_examples_shared.so.$(VERSION)
LSTATIC=c_examples_static.a.$(VERSION)
BINNAME:=$(NAME).so.$(VERSION)
CVSNAME:=$(NAME)
PACKGNAME:=c-$(NAME)

SHELL=/bin/sh
OS:=$(shell uname)
ifeq ($(OS),Linux)
	DISTRO:=$(shell rpm --eval %distribution|sed -e 's/\..*//g')
endif
ifeq ($(OS),FreeBSD)
	DISTRO:=FreeBSD$(shell uname -r|sed -e 's/\..*//g')
endif
GCCVER:=$(shell gcc -dumpversion|cut -d. -f1)

DOXYGEN_PATH=doxygen
INSTALL=install
MAKE=make
ifeq ($(OS),FreeBSD)
	MAKE=gmake
endif

ifndef INSTALL_DIR
	override INSTALL_DIR:=/usr/local
endif

# if you are NOT using logrotate the lines below can be commented
# # if you are using logrotate the "install" target into Makefile should be
# # changed
# LOGROTATE_DIR=/etc/logrotate.d
# LOGROTATE_FILE=doc/app.logrotate
#
# # if you are NOT using supervise the line below can be commented
# SVC_RUN_SCRIPT=doc/app.supervise_run
