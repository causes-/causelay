# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

inherit git-r3

DESCRIPTION="File-based build system for Linux, OSX, and Windows."
HOMEPAGE="http://gittup.org/tup/"
EGIT_REPO_URI="https://github.com/gittup/tup"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""

DEPEND="sys-fs/fuse"

src_compile() {
	addwrite /dev/fuse
	./bootstrap.sh
}

src_install() {
	dobin tup
	doman tup.1
}
