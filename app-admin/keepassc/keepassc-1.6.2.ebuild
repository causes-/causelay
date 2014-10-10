# Distributed under the terms of the GNU General Public License v2

EAPI=4
PYTHON_COMPAT=( python{3_2,3_3} )

inherit distutils-r1

DESCRIPTION="curses-based password manager"
HOMEPAGE="https://github.com/raymontag/keepassc"
SRC_URI="https://github.com/raymontag/${PN}/archive/${PV}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
