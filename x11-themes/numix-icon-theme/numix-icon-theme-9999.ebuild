# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/x11-themes/gnome-icon-theme/gnome-icon-theme-3.12.0.ebuild,v 1.1 2014/04/27 21:58:51 eva Exp $

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
