# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

inherit eutils savedconfig toolchain-funcs

DESCRIPTION="IRC-bot to fetch titles for URLs"
HOMEPAGE="https://github.com/causes-/bottler"
SRC_URI="https://github.com/causes-/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

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
