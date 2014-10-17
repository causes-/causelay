# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

inherit eutils toolchain-funcs

DESCRIPTION="evdev input driver for trackpoint with clickpad"
HOMEPAGE="http://xorg.freedesktop.org/"
SRC_URI="http://xorg.freedesktop.org//releases/individual/driver/xf86-input-evdev-2.9.0.tar.bz2 \
	http://xorg.freedesktop.org//releases/individual/driver/xf86-input-synaptics-1.8.0.tar.bz2"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"

RDEPEND="
	!x11-drivers/xf86-input-evdev
	dev-libs/libevdev
"
DEPEND="${RDEPEND}"

S="${WORKDIR}/xf86-input-evdev-2.9.0"

src_prepare() {
	local synaptics_srcdir="${WORKDIR}/xf86-input-synaptics-1.8.0"
	cp ${synaptics_srcdir}/src/{eventcomm.c,eventcomm.h,properties.c,synaptics.c,synapticsstr.h,synproto.c,synproto.h} src/
	cp ${synaptics_srcdir}/include/synaptics-properties.h include/

	epatch "${FILESDIR}/0001-implement-trackpoint-wheel-emulation.patch"
	epatch "${FILESDIR}/0004-disable-clickpad_guess_clickfingers.patch"
	epatch "${FILESDIR}/0006-add-synatics-files-into-Makefile.am.patch"
}
