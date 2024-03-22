LUAVER ?= 5.3
PREFIX ?= /usr/local
MODDIR ?= $(PREFIX)/share/lua/$(LUAVER)
DOCDIR ?= $(PREFIX)/share/doc

doc:

	ldoc -l misc -s misc -c config.ld -v .

clean:

	rm -rf docs/

install: doc

	# Corky Lua modules:
	#
	install -dm 0755 '$(DESTDIR)$(MODDIR)'
	cp -a lua/* '$(DESTDIR)$(MODDIR)'

	# Documentation, README and example Conky configuration:
	#
	install -dm 0755 '$(DESTDIR)$(DOCDIR)/corky'
	cp -a docs    '$(DESTDIR)$(DOCDIR)/corky/html'
	cp    README  '$(DESTDIR)$(DOCDIR)/corky'
	cp -a example '$(DESTDIR)$(DOCDIR)/corky'

	# Change the module's path in the example configuration:
	#
	sed -i 's!"lua/corky.lua"!"$(MODDIR)/corky.lua"!' \
		'$(DESTDIR)$(DOCDIR)/corky/example/conky.conf'

uninstall:

	rm -rf '$(MODDIR)/corky/'
	rm -f  '$(MODDIR)/corky.lua'

	rm -rf '$(DOCDIR)/corky/'

.PHONY: clean doc install uninstall

# :indentSize=3:tabSize=3:noTabs=false:mode=makefile:maxLineLen=78: