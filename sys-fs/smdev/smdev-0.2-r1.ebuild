# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

inherit eutils savedconfig linux-info

DESCRIPTION="suckless mdev"
HOMEPAGE="http://git.suckless.org/smdev/"
SRC_URI="http://git.suckless.org/${PN}/snapshot/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"

RDEPEND="
	!x11-drivers/xf86-input-evdev
	x11-base/xorg-server[-udev]
"

pkg_pretend() {
	if use kernel_linux; then
		if ! linux_config_exists; then
			ewarn "Unable to check your kernel for DEVTMPFS support"
		else
			CONFIG_CHECK="~DEVTMPFS"
			ERROR_DEVTMPFS="You must enable DEVTMPFS in your kernel to continue"
			check_extra_config
		fi
	fi
}

src_prepare() {
	restore_config config.h
	epatch_user
}

src_install() {
	emake DESTDIR="${D}" PREFIX="${EPREFIX}/" install
	newinitd "${FILESDIR}/init-${PV}" smdev
	save_config config.h
}

pkg_postinst() {
	elog "To switch from udev you should do the following:"
	elog "Set USE=\"-udev\" INPUT_DEVICES=\"synaptics keyboard mouse\""
	elog "Rebuild world"
	elog "Update xorg configs to use kbd and mouse instead of evdev"
	elog "gpasswd -a <USER> tty"
	elog "rc-update del udev sysinit"
	elog "rc-update del udev-mount sysinit"
	elog "rc-update add smdev sysinit"
}
