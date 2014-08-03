# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

inherit eutils autotools toolchain-funcs git-2

DESCRIPTION="A small, native C library and utility to fetch weather"
HOMEPAGE="https://github.com/HalosGhost/shaman"
EGIT_REPO_URI="https://github.com/HalosGhost/shaman"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""

DEPEND="
	sys-devel/tup
	dev-libs/jansson
	net-misc/curl
	"
RDEPEND=""

src_compile() {
	addwrite /dev/fuse
	tup init
	tup upd
}

src_install() {
	dobin src/shaman
	dolib.so src/libweather.so
	insinto /usr/include
	doins src/weather.h
	doman docs/shaman.1
	doman docs/strfweather.3
}
