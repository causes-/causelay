# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
inherit eutils git-r3

DESCRIPTION="install only st terminfo"
HOMEPAGE="http://st.suckless.org/"
EGIT_REPO_URI="git://git.suckless.org/st"

LICENSE="MIT-with-advertising"
SLOT="0"
KEYWORDS=""

RDEPEND=""
DEPEND="${RDEPEND}"

src_prepare() {
	return;
}

src_compile() {
	return;
}

src_install() {
	mkdir -p ${D}/usr/share/terminfo
	tic -s -o ${D}/usr/share/terminfo st.info || die
}
