# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

DESCRIPTION="small file browser"
HOMEPAGE="http://git.2f30.org/noice/"
SRC_URI="http://git.2f30.org/noice/snapshot/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~x86 ~amd64"

RDEPEND="sys-libs/ncurses"
DEPEND="${RDEPEND}"

src_install() {
	emake DESTDIR="${D}" PREFIX="${EPREFIX}/usr/" MANPREFIX="/usr/share/man" install
	dodoc README
}
