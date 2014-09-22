# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/net-analyzer/nbwmon/nbwmon-0.3.2.ebuild,v 1.1 2014/09/04 19:16:30 jer Exp $/

EAPI=5

DESCRIPTION="simple bash script to upload an image to imgur"
HOMEPAGE="http://imgur.com/tools"
SRC_URI="http://imgur.com/tools/imgurbash.sh"

LICENSE="public-domain"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="net-misc/curl"
DEPEND="${RDEPEND}"

S=${WORKDIR}

src_unpack() {
	mkdir -p ${S}
	cp ${DISTDIR}/${PN}.sh ${S}
}

src_install() {
	newbin ${PN}.sh ${PN}
}
