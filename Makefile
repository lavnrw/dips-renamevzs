.PHONY: all
all:

.PHONY: install
install: renamevzs
	@install -Dm 755 $^ /usr/local/bin/

.PHONY: uninstall
uninstall:
	@rm /usr/local/bin/renamevzs
