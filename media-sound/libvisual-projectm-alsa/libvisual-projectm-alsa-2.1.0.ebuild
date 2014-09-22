# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit cmake-utils

MY_P=projectM-complete-${PV}-Source

DESCRIPTION="A libvisual graphical music visualization plugin similar to milkdrop"
HOMEPAGE="http://projectm.sourceforge.net"
SRC_URI="mirror://sourceforge/projectm/${MY_P}.tar.gz"

LICENSE="LGPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE="debug"

RDEPEND="
	media-plugins/libvisual-projectm
	media-plugins/libvisual-plugins
	media-libs/libsdl
	media-libs/libvisual
	media-libs/libprojectm
	virtual/opengl
"
DEPEND="${RDEPEND}
	virtual/pkgconfig"

S=${WORKDIR}/${MY_P}/src/projectM-libvisual-alsa/

#DOCS="AUTHORS ChangeLog"
