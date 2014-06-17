# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

DESCRIPTION="Dark GTK+ theme with metallic surfaces"
HOMEPAGE="http://killhellokitty.deviantart.com"
SRC_URI="https://dl.dropboxusercontent.com/u/330352/delorean-dark-3.10_8.05232014.zip"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RESTRICT="binchecks strip"

src_install() {
	insinto /usr/share/themes/${PN}
	doins -r *
}
