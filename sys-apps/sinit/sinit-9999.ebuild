# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"

inherit git-2
EGIT_REPO_URI="http://git.2f30.org/sinit/"

DESCRIPTION="suckless init"
HOMEPAGE="http://git.2f30.org/sinit/"

LICENSE="MIT"
SLOT="0"
KEYWORDS=""

RDEPEND=""

src_install() {
	emake DESTDIR="${D}" PREFIX="${EPREFIX}/" install
}
