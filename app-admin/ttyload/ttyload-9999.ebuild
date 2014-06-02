# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/x11-wm/dwm/dwm-6.0.ebuild,v 1.12 2013/02/06 15:19:31 jer Exp $

EAPI="5"

inherit git-2

DESCRIPTION="Graphical load average on terminal"
HOMEPAGE="http://www.daveltd.com/src/util/ttyload/"
EGIT_REPO_URI="git://github.com/lindes/ttyload"

LICENSE="ttyload"
SLOT="0"
KEYWORDS="~amd64 ~x86"

src_compile() {
	emake
}

src_install() {
	into ${EPREFIX}/usr
	dobin ttyload
}
