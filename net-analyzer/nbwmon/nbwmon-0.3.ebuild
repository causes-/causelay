# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

DESCRIPTION="Ncurses bandwidth monitor"
HOMEPAGE="https://github.com/defer-/nbwmon"
SRC_URI="https://github.com/defer-/${PN}/archive/${PV}.tar.gz -> \
	${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
RESTRICT="mirror"

DEPEND="sys-libs/ncurses"
