# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
PYTHON_COMPAT=( python2_7 )

inherit cmake-utils python-r1

DESCRIPTION="screenshot sharing tool"
HOMEPAGE="https://github.com/olav-st/screencloud"
SRC_URI="https://github.com/olav-st/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND="
	dev-libs/quazip
	x11-libs/libqxt
	dev-python/PyQtMobility[multimedia]
	dev-qt/qtmultimedia
"
RDEPEND="${DEPEND}"

S="${WORKDIR}/${P}/${PN}"

src_configure() {
	local mycmakeargs=(
		-DQT_QMAKE_EXECUTABLE=/usr/bin/qmake-qt4
	)

	python_foreach_impl cmake-utils_src_configure
}

src_compile() {
	python_foreach_impl cmake-utils_src_compile
}

src_install() {
	python_foreach_impl cmake-utils_src_install
}
