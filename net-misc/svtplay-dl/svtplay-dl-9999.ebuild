# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/x11-wm/dwm/dwm-6.0.ebuild,v 1.12 2013/02/06 15:19:31 jer Exp $

EAPI="5"

inherit git-2

DESCRIPTION="Small command-line program to download videos"
HOMEPAGE="https://github.com/spaam/svtplay-dl"
EGIT_REPO_URI="git://github.com/spaam/svtplay-dl"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="dev-python/pycrypto
	media-video/rtmpdump"
RDEPEND="${DEPEND}"

src_compile() {
	emake
}

src_install() {
	emake DESTDIR="${D}" PREFIX="${EPREFIX}/usr" install
}
