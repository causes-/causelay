# Distributed under the terms of the GNU General Public License v2

EAPI=5
PYTHON_COMPAT=( python{3_2,3_3} )

inherit distutils-r1

DESCRIPTION="A Python-module to provide an API to KeePass 1.x files"
HOMEPAGE="https://github.com/raymontag/kppy"
SRC_URI="https://github.com/raymontag/${PN}/archive/${PV}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND="dev-python/pycrypto"
RDEPEND="${DEPEND}"
