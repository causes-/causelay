# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

inherit eutils toolchain-funcs git-r3

DESCRIPTION="ncurses bandwidth monitor"
HOMEPAGE="https://github.com/causes-/nbwmon"
EGIT_REPO_URI="https://github.com/causes-/nbwmon"

LICENSE="MIT"
SLOT="0"
KEYWORDS=""

RDEPEND="
	sys-libs/ncurses
"
DEPEND="
	${RDEPEND}
	virtual/pkgconfig
"

src_prepare() {
	epatch "${FILESDIR}"/${P}-tinfo.patch
	tc-export CC PKG_CONFIG
}
