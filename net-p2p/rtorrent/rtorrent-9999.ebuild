# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit eutils git-2

DESCRIPTION="BitTorrent Client using libtorrent"
HOMEPAGE="http://libtorrent.rakshasa.no/"
EGIT_REPO_URI="git://github.com/rakshasa/rtorrent"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""
IUSE="daemon debug ipv6 selinux test xmlrpc"

COMMON_DEPEND="=net-libs/libtorrent-9999
	>=dev-libs/libsigc++-2.2.2:2
	>=net-misc/curl-7.19.1
	sys-libs/ncurses
	selinux? ( sec-policy/selinux-rtorrent )
	xmlrpc? ( dev-libs/xmlrpc-c )"
RDEPEND="${COMMON_DEPEND}
	daemon? ( app-misc/screen )"
DEPEND="${COMMON_DEPEND}
	test? ( dev-util/cppunit )
	virtual/pkgconfig"

DOCS=( doc/rtorrent.rc )

src_prepare() {
	# bug #358271
	#epatch "${FILESDIR}"/${PN}-0.9.1-ncurses.patch

	# upstream forgot to include
	#cp ${FILESDIR}/rtorrent.1 ${S}/doc/ || die

	./autogen.sh
}

src_configure() {
	# configure needs bash or script bombs out on some null shift, bug #291229
	CONFIG_SHELL=${BASH} econf \
		--disable-dependency-tracking \
		$(use_enable debug) \
		$(use_enable ipv6) \
		$(use_with xmlrpc xmlrpc-c)
}

src_install() {

	#default
	#doman doc/rtorrent.1

	emake DESTDIR="${D}" install || die

	if use daemon; then
		newinitd "${FILESDIR}/rtorrentd.init" rtorrentd
		newconfd "${FILESDIR}/rtorrentd.conf" rtorrentd
	fi
}
