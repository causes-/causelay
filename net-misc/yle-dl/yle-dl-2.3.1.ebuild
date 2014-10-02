# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

DESCRIPTION="Small command-line program to download videos"
HOMEPAGE="https://github.com/aajanki/yle-dl/"
SRC_URI="https://github.com/aajanki/${PN}/archive/${PV}.tar.gz -> \
	${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"

DEPEND="dev-python/pycrypto
	media-video/rtmpdump
	dev-lang/php[bcmath,curl,simplexml]"

src_install() {
	emake DESTDIR="${D}" PREFIX="${EPREFIX}/usr" install
	emake DESTDIR="${D}" PREFIX="${EPREFIX}/usr" install-adobehds
}
