# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

DESCRIPTION="subtle dark theme based on the higly popular elementary theme"
HOMEPAGE="http://satya164.deviantart.com/art/elementary-Dark-GTK3-Theme-244257862"
SRC_URI="http://fc00.deviantart.net/fs70/f/2012/164/2/0/elementary_dark___gtk3_theme_by_satya164-d41fakm.zip"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="x86 amd64"

RDEPEND="x11-themes/gtk-engines-unico"

RESTRICT="binchecks strip"

S="${WORKDIR}/elementary Dark"

src_install() {
	insinto /usr/share/themes/${PN}
	doins -r *
}
