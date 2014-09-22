# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

inherit git-r3

DESCRIPTION="graphical load average on terminal"
HOMEPAGE="http://www.daveltd.com/src/util/ttyload/"
EGIT_REPO_URI="git://github.com/lindes/ttyload"

LICENSE="ttyload"
SLOT="0"
KEYWORDS=""

src_install() {
	into ${EPREFIX}/usr
	dobin ttyload
}
