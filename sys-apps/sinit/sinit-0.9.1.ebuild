# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"
inherit savedconfig

DESCRIPTION="suckless init"
HOMEPAGE="http://tools.suckless.org/sinit"
SRC_URI="http://git.suckless.org/sinit/snapshot/${P}.tar.bz2"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"

RESTRICT="strip mirror"

src_prepare() {
	restore_config config.h
	epatch_user
}

src_install() {
	emake DESTDIR="${D}" PREFIX="${EPREFIX}" install
	dodoc README
	save_config config.h
}
