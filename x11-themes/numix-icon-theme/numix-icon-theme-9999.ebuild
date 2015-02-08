# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

inherit git-r3

DESCRIPTION="Icon theme from the numix project."
HOMEPAGE="http://numixproject.org/"
EGIT_REPO_URI="https://github.com/numixproject/numix-icon-theme"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS=""

RDEPEND=""
DEPEND="${RDEPEND}"

RESTRICT="binchecks strip"

src_install() {
	insinto /usr/share/icons
	doins -r Numix-Light
	doins -r Numix
}
