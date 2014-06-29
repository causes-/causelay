# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

inherit git-2

DESCRIPTION="Grey GTK+ theme"
HOMEPAGE="https://github.com/shimmerproject/Greybird"
EGIT_REPO_URI="git://github.com/shimmerproject/Greybird"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""

RDEPEND="x11-themes/gtk-engines-murrine"

RESTRICT="binchecks strip"

src_install() {
	insinto /usr/share/themes/${PN}
	doins -r *
}
