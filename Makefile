.PHONY: all install

INSTALL_DIR := /usr/lib/arch-luks-suspend2
INITRAMFS_TOOLS := /usr/lib/initcpio/hooks

all:

install:
	install -Dm755 arch-luks-suspend2 "$(DESTDIR)$(INSTALL_DIR)/arch-luks-suspend2"
	install -Dm755 encrypt-on-suspend "$(DESTDIR)$(INSTALL_DIR)/encrypt-on-suspend"
	install -Dm644 initcpio-hook "$(DESTDIR)$(INITRAMFS_TOOLS)/suspend"
	install -Dm644 arch-luks-suspend2.service "$(DESTDIR)/usr/lib/systemd/system/arch-luks-suspend2.service"
	systemctl enable arch-luks-suspend2.service

uninstall:
	systemctl disable arch-luks-suspend2.service
	rm -f "$(DESTDIR)$(INSTALL_DIR)/arch-luks-suspend2"
	rm -f "$(DESTDIR)$(INSTALL_DIR)/encrypt-on-suspend"
	rm -f "$(DESTDIR)$(INITRAMFS_TOOLS)/suspend"
	rm -f "$(DESTDIR)/usr/lib/systemd/system/arch-luks-suspend2.service"

# vim:set sw=4 ts=4 noet:
