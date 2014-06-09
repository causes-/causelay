# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

inherit git-2

DESCRIPTION="Icon theme from the numix project."
HOMEPAGE="http://numixproject.org/"
EGIT_REPO_URI="git://github.com/numixproject/numix-icon-theme"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RESTRICT="binchecks strip"

src_install() {
	insinto /usr/share/icons
	doins -r Numix
}
