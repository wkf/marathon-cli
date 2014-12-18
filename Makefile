PREFIX := /usr/local
VERSION := 0.0.1

deb:
	mkdir -p target/build$(PREFIX)/bin
	cp bin/* target/build$(PREFIX)/bin
	fpm -p target -C target/build -s dir -t deb -n marathon-cli -v $(VERSION) -a all -d curl .

clean:
	rm -rf target

install:
	cp bin/marathon-cli $(DESTDIR)$(PREFIX)/bin/marathon-cli

uninstall:
	rm $(DESTDIR)$(PREFIX)/bin/marathon-cli

.PHONY: deb clean install uninstall
