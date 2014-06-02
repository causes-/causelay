# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/x11-wm/dwm/dwm-6.0.ebuild,v 1.12 2013/02/06 15:19:31 jer Exp $

EAPI="4"

inherit eutils toolchain-funcs git-2

DESCRIPTION="Monospace font"
HOMEPAGE="https://github.com/lucy/tewi-font"
EGIT_REPO_URI="git://github.com/lucy/tewi-font"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~hppa ~ppc ~ppc64 ~x86 ~x86-fbsd"

DEPEND="x11-libs/libX11"
RDEPEND="${DEPEND}"

src_prepare() {
	sed -i '16d' Makefile || die
	cat Makefile
}

src_compile() {
	emake all
}

src_install() {
	ls
	insinto /usr/share/fonts/tewi
	doins *.pcf
	doins *.bdf
	doins fonts.dir
	doins fonts.scale
}
