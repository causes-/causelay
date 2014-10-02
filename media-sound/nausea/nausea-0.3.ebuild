# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

DESCRIPTION="Curses audio visualizer"
HOMEPAGE="http://git.2f30.org/nausea/"
SRC_URI="http://git.2f30.org/${PN}/snapshot/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"

DEPEND="
	sys-libs/ncurses
	sci-libs/fftw
"

src_install() {
	emake DESTDIR="${D}" PREFIX="${EPREFIX}/usr" MANPREFIX="${PREFIX}" install
	dodoc README
}
