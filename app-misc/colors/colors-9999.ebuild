# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

inherit git-r3

DESCRIPTION="print terminal color palette"
HOMEPAGE="https://github.com/causes-/colors"
EGIT_REPO_URI="https://github.com/causes-/colors"

LICENSE="MIT"
SLOT="0"
KEYWORDS=""

src_install() {
	emake DESTDIR="${D}" PREFIX="${EPREFIX}/usr/" install
}
