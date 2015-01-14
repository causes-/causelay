# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

inherit eutils savedconfig toolchain-funcs git-r3

DESCRIPTION="IRC-bot to fetch titles for URLs"
HOMEPAGE="https://github.com/causes-/bottler"
EGIT_REPO_URI="https://github.com/causes-/bottler"

LICENSE="MIT"
SLOT="0"
KEYWORDS=""

RDEPEND="
	net-misc/curl
"
DEPEND="
	${RDEPEND}
"

src_prepare() {
	restore_config config.h
	epatch_user
}

src_install() {
	emake DESTDIR="${D}" PREFIX="${EPREFIX}/usr/" install
	dodoc README
	save_config config.h
}
