# -*- mode: makefile-gmake; coding: utf-8; truncate-lines: true -*-

FREERTOS_URL   = svn://svn.code.sf.net/p/freertos/code/tags/V6.0.4/Source
FREERTOS_DIR   = FreeRTOS

all: $(FREERTOS_DIR)

install: all
	install -d $(DESTDIR)/usr/src/$(FREERTOS_DIR)
	cp $(FREERTOS_DIR)/*.c $(DESTDIR)/usr/src/$(FREERTOS_DIR)/
	cp -r $(FREERTOS_DIR)/portable $(DESTDIR)/usr/src/$(FREERTOS_DIR)/

	install -d $(DESTDIR)/usr/include/$(FREERTOS_DIR)
	cp $(FREERTOS_DIR)/include/*.h $(DESTDIR)/usr/include/$(FREERTOS_DIR)/

$(FREERTOS_DIR):
	svn co -q $(FREERTOS_URL) $@
	rm -rf $(FREERTOS_DIR)/.svn

.PHONY: clean
clean:
	$(RM) -rfv $(FREERTOS_DIR)

