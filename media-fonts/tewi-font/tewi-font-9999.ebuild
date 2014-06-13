# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

inherit git-2

DESCRIPTION="Monospace font"
HOMEPAGE="https://github.com/lucy/tewi-font"
EGIT_REPO_URI="git://github.com/lucy/tewi-font"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="x11-libs/libX11"
RDEPEND="${DEPEND}"

src_prepare() {
	sed -i '/xset/d' Makefile || die
}

src_compile() {
	emake all
}

src_install() {
	insinto /usr/share/fonts/tewi
	doins *.pcf
	doins *.bdf
	doins fonts.dir
	doins fonts.scale
}
