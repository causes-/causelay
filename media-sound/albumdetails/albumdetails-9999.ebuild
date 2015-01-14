# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

inherit eutils toolchain-funcs git-r3

DESCRIPTION="Generate details for music album"
HOMEPAGE="https://github.com/causes-/albumdetails"
EGIT_REPO_URI="https://github.com/causes-/albumdetails"

LICENSE="MIT"
SLOT="0"
KEYWORDS=""

RDEPEND="
	media-libs/taglib
"
DEPEND="
	${RDEPEND}
"

src_install() {
	emake DESTDIR="${D}" PREFIX="${EPREFIX}/usr/" install
	dodoc README
}
