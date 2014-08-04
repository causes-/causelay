# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

inherit git-r3

DESCRIPTION="Curses audio visualizer"
HOMEPAGE="http://git.2f30.org/nausea/"
EGIT_REPO_URI="http://git.2f30.org/nausea/"

LICENSE="MIT"
SLOT="0"
KEYWORDS=""

DEPEND="
	sys-libs/ncurses
	sci-libs/fftw
"

src_install() {
	emake DESTDIR="${D}" PREFIX="${EPREFIX}/usr" MANPREFIX="${PREFIX}" install
	dodoc README
}
