# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/x11-misc/dmenu/dmenu-4.5-r4.ebuild,v 1.1 2014/01/22 14:46:23 jer Exp $

EAPI=5

DESCRIPTION="CPU miner for Litecoin and Bitcoin"
HOMEPAGE="http://sourceforge.net/projects/cpuminer/"
SRC_URI="http://sourceforge.net/projects/cpuminer/files/pooler-${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~hppa ~ppc ~ppc64 ~x86 ~x86-fbsd"

src_compile() {
	emake
}

src_install() {
	emake DESTDIR="${D}" PREFIX="/usr" install
}
