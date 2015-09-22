include defines.mk

PWD:=$(shell pwd)
RPMDEFS:=--define "_sourcedir $(PWD)"
DISTDIR:=$(CVSNAME)
SRCTAR:=$(NAME)-$(VERSION).tar.gz
SPECFILE:=$(NAME)-$(VERSION).spec
SPECIN:=doc/app.spec.in

# Vars used into sub-makes
# If some sub-Makefile needs any var from this file, export it here.
export BUILD_ROOT
export INSTALL_DIR
export CFLAGS
export DEBUG

.PHONY : all
all:
	$(MAKE) -C src/

.PHONY : clean
clean:
	$(MAKE) -C src/ clean
	rm -f doc/doxygen.cfg
	rm -rf doc/html doc/man
	rm -f $(SPECFILE) $(SRCTAR)

.PHONY : depend
depend:
	$(MAKE) -C src/ depend

# de-comment the lines below if you need install a logrotate script
.PHONY : install
install: all
	$(MAKE) -C src/ install

.PHONY : dist
dist: clean
	tar -C .. -czhf $(SRCTAR) --exclude CVS --exclude $(SRCTAR) $(DISTDIR)

.PHONY : spec
spec: clean $(SPECIN)
	sed s/@@PACKGNAME@@/$(PACKGNAME)/g $(SPECIN) | \
	sed s:@@SPECPREFIX@@:$(INSTALL_DIR):g | \
	sed s/@@MAJOR@@/$(MAJOR)/g | \
	sed s/@@MINOR@@/$(MINOR)/g | \
	sed s/@@PATCH@@/$(PATCH)/g | \
	sed s/@@CVSNAME@@/$(CVSNAME)/g | \
	sed s/@@APPNAME@@/$(NAME)/g | \
	sed s/@@BINNAME@@/$(BINNAME)/g | \
	sed s/@@LSHARED@@/$(LSHARED)/g | \
	sed s/@@LSTATIC@@/$(LSTATIC)/g | \
	sed s:@@LOGROTATE_DIR@@:$(LOGROTATE_DIR):g | \
	sed '/@@RUN_CONTENT@@/ r $(SVC_RUN_SCRIPT)' | \
	sed '/@@RUN_CONTENT@@/ d' | \
	sed s/@@SPECREL@@/$(PACKG)/g > $(SPECFILE)

.PHONY : rpm
rpm: clean spec dist
	rpmbuild -ba -v --clean --rmspec --rmsource $(RPMDEFS) $(SPECFILE)

.PHONY : doc
doc:
	rm -rf doc/html/*
	rm -rf doc/man/*
	sed -e "s/@@VERSION@@/$(VERSION)/g; s/@@NAME@@/$(CVSNAME)/g;" doc/doxygen.cfg.in > doc/doxygen.cfg
	cd src && \
	$(DOXYGEN_PATH) ../doc/doxygen.cfg && \
	cd ..
	gzip doc/man/man3/*

.PHONY : pubdoc
pubdoc: doc
	mv doc/html doc/$(NAME)
	tar zcf doc/$(NAME).tar.gz -C doc $(NAME)
	mv doc/$(NAME) doc/html
	pubdoc doc/$(NAME).tar.gz
	rm -f doc/$(NAME).tar.gz
